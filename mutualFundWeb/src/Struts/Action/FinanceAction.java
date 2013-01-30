package Struts.Action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Customer;
import Hibernate.PO.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class FinanceAction extends ActionSupport {
	private ITransactionDAO transactionDAO;
	private String errorInfo;
	private Customer customer;
	private ICustomerDAO customerDAO;
	private List<Transaction> transactionList;
	private Double amount;
	
	@InputConfig(resultName="gotoFinance")
	public String requestCheck(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		Transaction transaction=new Transaction();
	
		transaction.setCustomer(customer);
		transaction.setTransactionType(Transaction.PENDING_WITHDRAW);
		transaction.setAmount((long)(amount*(-100)));
		transaction.setExecuteDate(new Date());
		long pending=customer.getPendingCash();
		pending+=(long)(amount*(-100));
		customer.setPendingCash(pending);
		customerDAO.merge(customer);
		session.put("customer", customer);
		transactionDAO.save(transaction);
		return "requestSuccess";
	}
	public void validateRequestCheck(){
		if(amount==null){
			this.addFieldError("amount", "Amount can not be null");
			transactionList=transactionDAO.findByProperty("customer", customer);
			return;
		}
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		if(amount<0) {
			this.addFieldError("amount", "Amount can not be negative");
			transactionList=transactionDAO.findByProperty("customer", customer);
			
		}
		if(amount>customer.getCash()+customer.getPendingCash()){
			this.addFieldError("amount", "Amount exceeds current balance");
			if(transactionList==null)
				transactionList=transactionDAO.findByProperty("customer", customer);
		}
	}
	public String financePage(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		transactionList=transactionDAO.findByProperty("customer", customer);
		return "gotoFinance";
	}
	
	public String depositPage(){
		customer=customerDAO.findById(customer.getCustomerId());
		return "gotoDeposit";
	}
	@InputConfig(resultName="gotoDeposit")
	public String deposit(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=(Customer)session.get("customer");
		
		Transaction transaction=new Transaction();
		transaction.setCustomer(customer);
		transaction.setTransactionType(Transaction.PENDING_DEPOSIT);
		transaction.setAmount((long)(amount*100));
		transaction.setExecuteDate(new Date());
		long pending=customer.getPendingCash();
		pending+=(long)(amount*(100));
		customer.setPendingCash(pending);
		customerDAO.merge(customer);
		session.put("customer", customer);
		transactionDAO.save(transaction);
		return "depositSuccess";
	}
	public void validateDeposit(){
		if(amount==null){
			this.addFieldError("amount", "Amount can not be null");
			customer=customerDAO.findById(customer.getCustomerId());
		}
		else if(amount<0) {
			this.addFieldError("amount", "Amount can not be negative");
			customer=customerDAO.findById(customer.getCustomerId());
		}
	}
	
	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getErrorInfo() {
		return errorInfo;
	}
	
	public void setTransactionDAO(ITransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}
	
	public void setCustermor(Customer customer) {
		this.customer = customer;
	}
	

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public List<Transaction> getTransactionList() {
		return transactionList;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
