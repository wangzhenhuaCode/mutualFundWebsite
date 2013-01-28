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

public class TradeAction extends ActionSupport {
	private IFundDAO fundDAO;
	private IPositionDAO positionDAO;
	private ITransactionDAO transactionDAO;
	private List<Fund> fundlist;
	private Integer pageNum;
	private Integer maxPage;
	private Integer _PAGE_SIZE=20;
	private Fund fund=null;
	private Double amount;
	private Double shares;
	private String keywords;
	private List<Transaction> transactionList;
	private List<Position> positionList;
	private ICustomerDAO customerDAO;
	private Position position;
	private Customer customer;
	public String buy(){
		try{
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		if(amount*100>customer.getCash()) return "buyfailure";
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
	
		transaction.setPosition(p);
		transactionDAO.save(transaction);
		return "success";
		}catch(Exception e){
			e.printStackTrace();
			 return "failure";
		}
	}

	public String sell(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		PositionId pid=new PositionId(customer,fund);
		Position p=positionDAO.load(Position.class,pid);
		if(p.getShares()<shares){
			return "failure";
		}
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
	public String search(){
		fundlist=fundDAO.findByProperty("symbol",keywords);
		
		return "";
	}
	public String gotoTrade(){
		fundlist=fundDAO.getListByPage(0, _PAGE_SIZE,null,null);
		maxPage=fundDAO.count(null,null)/20+1;
		return "gotoTrade";
	}
	public String employeeGotoTrade(){
		fundlist=fundDAO.getListByPage(0, _PAGE_SIZE,null,null);
		maxPage=fundDAO.count(null,null)/20+1;
		return "employeeGotoTrade";
	}
	public String changePage(){
		if(maxPage==null)
			maxPage=fundDAO.count(null,null)/_PAGE_SIZE+1;
		if(pageNum<1)
			pageNum=1;
		if(pageNum>maxPage)
			pageNum=maxPage;
		fundlist=fundDAO.getListByPage((pageNum-1)*_PAGE_SIZE, _PAGE_SIZE,null,null);
		return "gotoTrade";
	}
	public String gotoResearch(){
		fund=fundDAO.findById(fund.getFundId());
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");

		transactionList=transactionDAO.findByTwoProperty("customer", customer, "fund", fund);
		if(transactionList.size()>0){
			PositionId pid=new PositionId(customer,fund);
			
			position=positionDAO.load(Position.class, pid);
		}
		return "gotoResearch";
	}

	public String create(){
		fundDAO.save(fund);
		return "create";
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

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(Integer maxPage) {
		this.maxPage = maxPage;
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
