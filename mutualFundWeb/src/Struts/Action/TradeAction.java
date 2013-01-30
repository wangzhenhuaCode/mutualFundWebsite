package Struts.Action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.IPositionDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Customer;
import Hibernate.PO.Fund;
import Hibernate.PO.Position;
import Hibernate.PO.PositionId;
import Hibernate.PO.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class TradeAction extends ActionSupport {
	private IFundDAO fundDAO;
	private IPositionDAO positionDAO;
	private ITransactionDAO transactionDAO;
	private List<Fund> fundlist;
	private Fund fund=null;
	private Double amount;
	private Double shares;
	private String keywords;
	private List<Transaction> transactionList;
	private List<Position> positionList;
	private ICustomerDAO customerDAO;
	private Position position;
	private Customer customer;
	@InputConfig(resultName="gotoResearch")
	public String buy(){
		
		try{
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");

		Transaction transaction=new Transaction();
		transaction.setCustomer(customer);
		transaction.setFund(fund);
		transaction.setTransactionType(Transaction.PENDING_BUY);
		transaction.setAmount((long)(amount*(-100)));
		transaction.setExecuteDate(new Date());
		
		PositionId pid=new PositionId(customer,fund);
		Position p=positionDAO.findById(pid);
		if(p==null){
			p=new Position(pid);
			p.setShares((long)0);
			positionDAO.save(p);
		}
		long pending=customer.getPendingCash();
		pending+=(long)(amount*(-100));
		customer.setPendingCash(pending);
		customerDAO.merge(customer);
		session.put("customer", customer);
		transaction.setPosition(p);
		transactionDAO.save(transaction);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			research();
			this.addFieldError("operation", "Operation error");
			return "gotoResearch";
		}
	}
	public void validateBuy(){
		if(amount==null){
			this.addFieldError("amount", "Invalid amount");
			research();
			return;
		}
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		if(amount*100>(customer.getCash()+customer.getPendingCash())){
			research();
			this.addFieldError("buy", "Insufficient amount");
		}
	}
	@InputConfig(resultName="gotoResearch")
	public String sell(){
		
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		PositionId pid=new PositionId(customer,fund);
		Position p=positionDAO.load(Position.class,pid);
		long pending=p.getPendingShare();
		pending+=(long)(shares*1000);
		positionDAO.merge(p);
		p.setPendingShare(pending);
		Transaction transaction=new Transaction();
		transaction.setCustomer(customer);
		transaction.setFund(fund);
		transaction.setTransactionType(Transaction.PENDING_SELL);
		transaction.setShares((long)(shares*1000));
		transaction.setExecuteDate(new Date());
		transaction.setPosition(p);
		transactionDAO.save(transaction);
		return "success";
	}
	public void validateSell(){
		if(shares==null){
			this.addFieldError("shares", "Invalid shares");
			research();
			return;
		}
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		PositionId pid=new PositionId(customer,fund);
		Position p=positionDAO.load(Position.class,pid);
		if((p.getShares()-p.getPendingShare())<shares){
			this.addFieldError("shares", "Insufficient shares");
			research();
		}
		
	}
	public String search(){
		fundlist=fundDAO.findByProperty("symbol",keywords);
		
		return "";
	}
	public String gotoTrade(){
		fundlist=fundDAO.findAll();
		
		return "gotoTrade";
	}
	public String employeeGotoTrade(){
		fundlist=fundDAO.findAll();
		return "employeeGotoTrade";
	}
	public void research(){
		fund=fundDAO.findById(fund.getFundId());
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");

		transactionList=transactionDAO.findByTwoProperty("customer", customer, "fund", fund);
		if(transactionList.size()>0){
			PositionId pid=new PositionId(customer,fund);
			
			position=positionDAO.load(Position.class, pid);
		}
	}
	public String gotoResearch(){
		
		research();
		return "gotoResearch";
	}
	@InputConfig(resultName="employeeGotoTrade")
	public String employeeCreate(){
		fundDAO.save(fund);
		
		return "create";
	}
	
	public void validateEmployeeCreate(){
		if(fund.getName()==null||fund.getName().equals("")){
			this.addFieldError("name", "Empty fund name");
			fundlist=fundDAO.findAll();
		}
		if(fund.getSymbol()==null||fund.getSymbol().equals("")){
			this.addFieldError("symbol", "Empty fund symbol");
			if(fundlist==null)
				fundlist=fundDAO.findAll();
		}
	}
	public String showPosition(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		positionList=positionDAO.findByProperty("id.customer", customer);
		return "home";
	}
	public String viewHistory(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		transactionList=transactionDAO.findByProperty("customer", customer);
		return "viewHistory";
	}
	public String employeeViewHistory(){
		
		customer=customerDAO.findById(customer.getCustomerId());
		transactionList=transactionDAO.findByProperty("customer", customer);
		return "employeeViewHistory";
	}
	public String employeeResearch(){
		fund=fundDAO.findById(fund.getFundId());
		return "employeeResearch";
	}
	
	//setter getter
	public void setFundDAO(IFundDAO fundDAO) {
		this.fundDAO = fundDAO;
	}
	public void setPositionDAO(IPositionDAO positionDAO) {
		this.positionDAO = positionDAO;
	}
	public void setTransactionDAO(ITransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}


	public List<Fund> getFundlist() {
		return fundlist;
	}



	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public void setShares(Double shares) {
		this.shares = shares;
	}

	public List<Transaction> getTransactionList() {
		return transactionList;
	}

	public List<Position> getPositionList() {
		return positionList;
	}

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Position getPosition() {
		return position;
	}




	
}
