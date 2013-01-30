package Struts.Action;

import java.util.List;
import java.util.Map;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.DAO.IEmployeeDAO;
import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Customer;
import Hibernate.PO.Employee;
import Hibernate.PO.Fund;
import Hibernate.PO.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class EmployeeAction extends ActionSupport {
	private IEmployeeDAO employeeDAO;
	private ICustomerDAO customerDAO;
	private Customer customer;
	private Employee employee;
	private String newPassword;
	private String confirmPassword;
	private String newCustomerPassword;
	private String confirmCustomerPassword;
	
	private String errorInfo;
	private List<Customer> customerList;
	private List<Transaction> transactionList;
	private int pageNum;
	private int maxPage;

	private ITransactionDAO transactionDAO;
	private Transaction transaction;
	

	private String username;
	private String password;
	
	public String login(){
		errorInfo="";
		List<Employee> list=employeeDAO.findByProperty("username", username);
		if(list.size()==0){
			errorInfo="Username error!";
			return "employeeFailureLogin";
		}
		if(list.get(0).getPassword().equals(password)){
			ActionContext ctx=ActionContext.getContext();
			Map<String,Object> session=ctx.getSession();
			session.put("employee", list.get(0));
			return "employeeSucessLogin";
		}
		else{
			errorInfo="Password error!";
			return "employeeFailureLogin";
		}
	}
	@InputConfig(resultName="goToAddNewCustomerAccount")
	public String createCustomerAccount(){
		errorInfo="";
		customer.setCash((long)0);
		customerDAO.save(customer);
		return "addNewCustomerSuccess";
		
	}
	public void validateCreateCustomerAccount(){
		if(customer.getUsername()==null || customer.getUsername().trim()==""){
			this.addFieldError("changePassword", "User Name cannot be empty");
		}
		if(customer.getFirstname()==null || customer.getFirstname().trim()==""){
			this.addFieldError("changePassword", "First Name cannot be empty");
		}
		if(customer.getAddrLine1()==null || customer.getAddrLine1().trim()==""){
			this.addFieldError("changePassword", "Address Line1 cannot be empty");
		}
		if(customer.getCity()==null || customer.getCity().trim()==""){
			this.addFieldError("changePassword", "City cannot be empty");
		}
		if(customer.getState()==null){
			this.addFieldError("changePassword", "State cannot be empty");
		}
		if(customer.getLastname()==null || customer.getLastname().trim()==""){
			this.addFieldError("changePassword", "Last Name cannot be empty");
		}
		if(customer.getZip()==null || customer.getZip()==""){
			this.addFieldError("changePassword", "Zip Code cannot be empty");
		}
		if(customer.getPassword()==null || customer.getPassword().trim()==""){
			this.addFieldError("changePassword", "Password cannot be empty");
		}
	}
	public String logout(){
		errorInfo="";
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		session.remove("employee");
		return "logoutSuccess";
	}
	public String changePassword(){
		errorInfo="";
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Employee e=(Employee)session.get("employee");
		if(newPassword.equals(confirmPassword)){
			e.setPassword(newPassword);
			employeeDAO.update(e);
			return "employeeSucessChangePassword";
		}else{
			errorInfo="Password Error";
			return "employeeFailureChangePassword";
		}
	}

	public String viewCustomers() {
		customerList = customerDAO.findAll();
		maxPage=customerDAO.count(null,null)/20+1;
		return "viewCustomers";
	}
	
	public String goToAddNewCustomerAccount() {
		return "goToAddNewCustomerAccount";
	}
	
	public String goToViewCustomerAccount() {
		customer = customerDAO.findById(customer.getCustomerId());
		return "goToViewCustomerAccount";
	}
	
	@InputConfig(resultName="goToViewCustomerAccount")
	public String viewCustomerAccount(){
		customerDAO.update(customer);
		return "viewCustomerSuccess";
	}
	
	public void validateViewCustomerAccount() {
		if(customer.getUsername().trim().length()==0)
			this.addFieldError("viewCustomerAccount", "User Name Cannot Be Empty");
		if(customer.getFirstname().trim().length()==0)
			this.addFieldError("viewCustomerAccount", "First Name Cannot Be Empty");
		if(customer.getLastname().trim().length()==0)
			this.addFieldError("viewCustomerAccount", "Last Name Cannot Be Empty");
		if(customer.getAddrLine1().trim().length()==0)
			this.addFieldError("viewCustomerAccount", "Address Line1 Cannot Be Empty");
		/*
		if(customer.getCity().trim().length()==0)
			this.addFieldError("viewCustomerAccount", "City Cannot Be Empty");
		*/
		customer = customerDAO.findById(customer.getCustomerId());
		return;
	}
	
	public String goToResetCustomerPassword() {
		customer = customerDAO.findById(customer.getCustomerId());
		return "goToResetCustomerPassword";
	}
	
	@InputConfig(resultName="goToResetCustomerPassword")
	public String resetCustomerPassword(){
		customer = customerDAO.findById(customer.getCustomerId());
		customer.setPassword(newCustomerPassword);
		return "resetCustomerPasswordSuccess";
	}
	public void validateResetCustomerPassword() {
		customer = customerDAO.findById(customer.getCustomerId());
		if(newCustomerPassword==null ||confirmCustomerPassword==null){
			this.addFieldError("changePassword", "Password Can Not Be Empty");
			customer = customerDAO.findById(customer.getCustomerId());
			return;
		}
		
		if(!newCustomerPassword.equals(this.confirmCustomerPassword)) {
			this.addFieldError("changePassword", "Password Not The Same");
			customer = customerDAO.findById(customer.getCustomerId());
			return; 
		}
		
	}
	
	
	public String viewTransactionHistory(){
		errorInfo="";
		List<Customer> list = customerDAO.find(customer);
		if(list.size()==0) {
			errorInfo = "No customer found";
			return "viewTransactionHistoryFailue";
		}else {
			this.customer = list.get(0);
			this.transactionList = transactionDAO.findByProperty("customer", customer);
			//transaction.setCustomer(customer);
			//List<Transaction> listTran =transactionDAO.find(transaction);
			if(transactionList.size()==0) 
				return "noTransactionHistory";
			//transaction = listTran.get(0);
			return "viewTransactionHistorySuccess";
		}
	}
	
	
	public String checkCustomerDeposit(){
		errorInfo="";
		List<Customer> list = customerDAO.find(customer);
		if(list.size()==0) {
			errorInfo = "No customer found";
			return "resetCustomerPasswordFailue";
		}else {
			this.customer = list.get(0);
			return "viewCustomerSuccess";
		}
	}
	
	public String homePage(){
		return "homePage";
	}
	
	public String resetPage(){
		return "resetPage";
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public void setEmployeeDAO(IEmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
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
	public List<Customer> getCustomerList() {
		return this.customerList;
	}
	public List<Transaction> getTransactionList() {
		return this.transactionList;
	}
	public void setNewCustomerPassword(String s) {
		this.newCustomerPassword = s;
	}
	public void setTransaction(Transaction t) {
		this.transaction = t;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public void setConfirmCustomerPassword(String confirmCustomerPassword) {
		this.confirmCustomerPassword = confirmCustomerPassword;
	}
}
