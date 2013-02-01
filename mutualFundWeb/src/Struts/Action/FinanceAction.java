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
		Customer customer=customerDAO.load(Customer.class, ((Customer)session.get("customer")).getCustomerId());
		Transaction transaction=new Transaction();
	
		transaction.setCustomer(customer);
		transaction.setTransactionType(Transaction.PENDING_WITHDRAW);
		transaction.setAmount((long)(Math.round(amount*(-100))));
		transaction.setExecuteDate(new Date());
		customer=customerDAO.load(Customer.class, customer.getCustomerId());
		long pending=customer.getPendingCash();
		pending+=(long)(Math.round(amount*(-100)));
		customer.setPendingCash(pending);
		
		if(!transactionDAO.operateTransaction(transaction, customer)){
			this.addFieldError("operation", "System busy, please try again");
			transactionList=transactionDAO.findByProperty("customer", customer);
			return "gotoFinance";
		}
		session.put("customer", customer);
		
		return "requestSuccess";
	}
	public void validateRequestCheck(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=customerDAO.load(Customer.class, ((Customer)session.get("customer")).getCustomerId());
		if(amount==null){
			this.addFieldError("amount", "Amount can not be null");
			transactionList=transactionDAO.findByProperty("customer", customer);
			return;
		}
		if(amount>Transaction.MAX_TRANSACTION_AMOUNT){
			this.addFieldError("amount", "Amount should be less than 1 billion");
			transactionList=transactionDAO.findByProperty("customer", customer);
			return;
		}
		
		if(amount<0.01) {
			this.addFieldError("amount", "Amount can not be negative or too small");
			transactionList=transactionDAO.findByProperty("customer", customer);
			return;
		}
		if(amount*100>customer.getCash()+customer.getPendingCash()){
			this.addFieldError("amount", "Amount exceeds current balance");
			if(transactionList==null)
				transactionList=transactionDAO.findByProperty("customer", customer);
		}
	}
	public String financePage(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer customer=customerDAO.load(Customer.class, ((Customer)session.get("customer")).getCustomerId());
		session.put("customer", customer);
			transactionList=transactionDAO.findByProperty("customer", customer);
		return "gotoFinance";
	}
	
	public String depositPage(){
		customer=customerDAO.findById(customer.getCustomerId());
		return "gotoDeposit";
	}
	@InputConfig(resultName="gotoDeposit")
	public String deposit(){
		Transaction transaction=new Transaction();
		customer=customerDAO.load(Customer.class, customer.getCustomerId());
		transaction.setTransactionType(Transaction.PENDING_DEPOSIT);
		transaction.setAmount((long)(Math.round(amount*100)));
		transaction.setExecuteDate(new Date());

		long pending=customer.getPendingCash();
		pending+=(long)(Math.round(amount*(100)));
		customer.setPendingCash(pending);

		transaction.setCustomer(customer);
		if(!transactionDAO.operateTransaction(transaction, customer)){
			this.addFieldError("operation", "System busy, please try again");
			customer=customerDAO.findById(customer.getCustomerId());
			return "gotoDeposit";
		}
		return "depositSuccess";
	}
	public void validateDeposit(){
		if(amount==null){
			this.addFieldError("amount", "Amount can not be null");
			customer=customerDAO.findById(customer.getCustomerId());
			return;
		}
		if(amount<0.01) {
			this.addFieldError("amount", "Amount can not be negative or too small");
			customer=customerDAO.findById(customer.getCustomerId());
			return;
		}
		if(amount>Transaction.MAX_TRANSACTION_AMOUNT){
			this.addFieldError("amount", "Amount should be less than 1 billion");
			customer=customerDAO.findById(customer.getCustomerId());
			return;
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
