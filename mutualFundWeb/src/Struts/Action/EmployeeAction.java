package Struts.Action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.DAO.IEmployeeDAO;
import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.IFundPriceHistoryDAO;
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
	private IFundPriceHistoryDAO fundPriceHistoryDAO;
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
	@InputConfig(resultName="employeeFailureLogin")
	public String login(){
		
		password=getMD5Str(password);
		List<Employee> list=employeeDAO.findByProperty("username", username);
		if(list.size()==0){
			this.addFieldError("username", "Username error!");
			return "employeeFailureLogin";
		}
		if(list.get(0).getPassword().equals(password)){
			ActionContext ctx=ActionContext.getContext();
			Map<String,Object> session=ctx.getSession();
			Map<String, Object> application = ctx.getSession();
			session.put("employee", list.get(0));
			if(session.containsKey("customer"))
				session.remove("customer");
			if(!application.containsKey("today")){
				 updateToday();
			}
			return "employeeSucessLogin";
		}
		else{
			
			this.addFieldError("password", "Password error!");
			return "employeeFailureLogin";
		}
	}
	public void validateLogin(){
		if(username==null||username.equals("")){
			this.addFieldError("username", "Username null");
		}
		if(username.length()>50){
			this.addFieldError("username", "Username should be within 50");
		}
		if(password==null||password.equals("")){
			this.addFieldError("username", "Password null");
		}
		
	}
	private String getMD5Str(String str) {  
        MessageDigest messageDigest = null;  
 
       try {  
            messageDigest = MessageDigest.getInstance("MD5");  
 
            messageDigest.reset();  
 
            messageDigest.update(str.getBytes("UTF-8"));  
        } catch (NoSuchAlgorithmException e) {  
            System.out.println("NoSuchAlgorithmException caught!");  
            System.exit(-1);  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
 
       byte[] byteArray = messageDigest.digest();  
 
        StringBuffer md5StrBuff = new StringBuffer();  
 
       for (int i = 0; i < byteArray.length; i++) {              
           if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)  
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));  
           else  
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));  
        }  
 
       return md5StrBuff.toString();  
    }  
	@InputConfig(resultName="goToAddNewCustomerAccount")
	public String createCustomerAccount(){
		String password=customer.getPassword();
		customer.setPassword(getMD5Str(password));
		customer.setCash((long)0);
		customer.setPendingCash(0L);
		customerDAO.save(customer);
		return "addNewCustomerSuccess";
		
	}
	public void validateCreateCustomerAccount(){
		if(customer.getUsername()==null || customer.getUsername().trim().equals("")){
			this.addFieldError("newAccount", "User Name cannot be empty");
		}
		if(customer.getUsername().length()>25) {
			this.addFieldError("newAccount", "User Name should be less than 25 words");
		}
		if(customerDAO.findByProperty("username", customer.getUsername()).size()!=0){
			this.addFieldError("newAccount", "The User Already Existed");
		}
		if(customer.getFirstname()==null || customer.getFirstname().trim().equals("")){
			this.addFieldError("newAccount", "First Name cannot be empty");
		}
		if(customer.getFirstname().length()>20) {
			this.addFieldError("newAccount", "First Name should be less than 25 words");
		}
		if(customer.getLastname()==null || customer.getLastname().trim().equals("")){
			this.addFieldError("newAccount", "Last Name cannot be empty");
		}
		if(customer.getLastname().length()>20) {
			this.addFieldError("newAccount", "Last Name should be less than 25 words");
		}
		if(customer.getAddrLine1()==null || customer.getAddrLine1().trim().equals("")){
			this.addFieldError("newAccount", "Address Line1 cannot be empty");
		}
		if(customer.getAddrLine1().length()>200) {
			this.addFieldError("newAccount", "Address Line1 is too long");
		}
		if(customer.getAddrLine2().length()>200) {
			this.addFieldError("newAccount", "Address Line2 is too long");
		}
		if(customer.getCity()==null || customer.getCity().trim().equals("")){
			this.addFieldError("newAccount", "City cannot be empty");
		}
		if(customer.getCity().length()>20) {
			this.addFieldError("newAccount", "City Name is too long");
		}
		if(customer.getState()==null){
			this.addFieldError("newAccount", "State cannot be empty");
		}
		if(customer.getState().length()>10) {
			this.addFieldError("newAccount", "State Name is too long");
		}
		if(customer.getZip()==null || customer.getZip().equals("")){
			this.addFieldError("newAccount", "Zip Code cannot be empty");
		}
		if(customer.getZip().length()>10) {
			this.addFieldError("newAccount", "Zip Code is too long");
		}
		if(customer.getPassword()==null || customer.getPassword().trim().equals("")){
			this.addFieldError("newAccount", "Password cannot be empty");
		}
		if(customer.getPassword().length()>20) {
			this.addFieldError("newAccount", "Password is too long");
		}
		if(this.confirmCustomerPassword==null || this.confirmCustomerPassword.trim().equals("")){
			this.addFieldError("newAccount", "ConfirmPassword cannot be empty");
		}
		String temp=customer.getPassword();
		if(!temp.equals(this.confirmCustomerPassword)) {
			this.addFieldError("newAccount", "Password not the same");
		}
	}
	public String logout(){
		errorInfo="";
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		session.remove("employee");
		return "logoutSuccess";
	}

	@InputConfig(resultName="employeeFailureChangePassword")
	public String changePassword(){
		errorInfo="";
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Employee e=(Employee)session.get("employee");
		Employee employee=employeeDAO.load(Employee.class, e.getEmployeeId());
		employee.setPassword(getMD5Str(newPassword));
		employeeDAO.merge(employee);
		session.put("employee", employee);
		return "employeeSucessChangePassword";
		
	}

	public String goToResetPassword(){
		return "goToResetPassword";
	}
	
	@InputConfig(resultName="goToResetPassword")
	public String resetPassword(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Employee e = (Employee) session.get("employee");
		e.setPassword(this.getMD5Str(newPassword));
		employeeDAO.update(e);

		return "employeeSucessChangePassword";
		
	}
	public void validateChangePassword(){
		if(newPassword==null||newPassword.equals("")){
			this.addFieldError("password", "Password can not be null");
		}
		if(!newPassword.equals(confirmPassword)){
			this.addFieldError("password", "Two passwords are not equal");
		}

	}

	
	public String goToChangepassword(){
		return "goToChangepassword";
	}
	public void validateResetPassword(){
		if(this.newPassword==null || this.newPassword.trim().equals(""))
			this.addFieldError("resetPassword", "Password cannot be empty");
		if(this.confirmPassword==null || this.confirmPassword.trim().equals(""))
			this.addFieldError("resetPassword", "Confirm Password cannot be empty");
		if(!this.newPassword.equals(this.confirmPassword))
			this.addFieldError("resetPassword", "Password is not the same");
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
		
		if(customer.getFirstname()==null || customer.getFirstname().trim().equals("")){
			this.addFieldError("newAccount", "First Name cannot be empty");
		}
		if(customer.getFirstname().length()>20) {
			this.addFieldError("newAccount", "First Name should be less than 20 words");
		}
		if(customer.getLastname()==null || customer.getLastname().trim().equals("")){
			this.addFieldError("newAccount", "Last Name cannot be empty");
		}
		if(customer.getLastname().length()>20) {
			this.addFieldError("newAccount", "Last Name should be less than 20 words");
		}
		if(customer.getAddrLine1()==null || customer.getAddrLine1().trim().equals("")){
			this.addFieldError("newAccount", "Address Line1 cannot be empty");
		}
		if(customer.getAddrLine1().length()>200) {
			this.addFieldError("newAccount", "The Address Line1 is too long");
		}
		if(customer.getAddrLine2().length()>200) {
			this.addFieldError("newAccount", "The Address Line2 is too long");
		}
		if(customer.getCity()==null || customer.getCity().trim().equals("")){
			this.addFieldError("newAccount", "City cannot be empty");
		}
		if(customer.getCity().length()>20) {
			this.addFieldError("newAccount", "The City Name is too long");
		}
		if(customer.getState()==null){
			this.addFieldError("newAccount", "State cannot be empty");
		}
		if(customer.getState().length()>10) {
			this.addFieldError("newAccount", "The State Name is too long");
		}
		if(customer.getZip()==null || customer.getZip().equals("")){
			this.addFieldError("newAccount", "Zip Code cannot be empty");
		}
		if(customer.getZip().length()>10) {
			this.addFieldError("newAccount", "The Zipcode is too long");
		}
	}
	
	public String goToResetCustomerPassword() {
		customer = customerDAO.findById(customer.getCustomerId());
		return "goToResetCustomerPassword";
	}
	
	@InputConfig(resultName="goToResetCustomerPassword")
	public String resetCustomerPassword(){
		customer = customerDAO.findById(customer.getCustomerId());
		customer.setPassword(getMD5Str(confirmCustomerPassword));
		customerDAO.update(customer);
		return "resetCustomerPasswordSuccess";
	}
	public void validateResetCustomerPassword() {
		if(newCustomerPassword==null ||confirmCustomerPassword==null){
			this.addFieldError("changePassword", "Password Can Not Be Empty");
			customer = customerDAO.findById(customer.getCustomerId());
			return;
		}
		if(newCustomerPassword.trim().equals("") ||confirmCustomerPassword.trim().equals("")){
			this.addFieldError("changePassword", "Password Can Not Be Empty");
			customer = customerDAO.findById(customer.getCustomerId());
			return;
		}
		if(newCustomerPassword.length()>30 || confirmCustomerPassword.length()>30){
			this.addFieldError("changePassword", "Password Can Not Be So Long");
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
	public String goToCreateEmployeeAccount() {
		return "goToCreateEmployeeAccount";
	}
	
	@InputConfig(resultName="goToCreateEmployeeAccount")
	public String createEmployeeAccount(){
		String password = employee.getPassword();
		employee.setPassword(getMD5Str(password));
		employeeDAO.save(employee);
		return "createEmployeeAccountSuccess";
	}
	public void validateCreateEmployeeAccount(){
		if(employee.getUsername()==null || employee.getUsername().trim().equals("")){
			this.addFieldError("newAccount", "User Name cannot be empty");
		}
		if(employee.getUsername().length()>25) {
			this.addFieldError("newAccount", "The User Name is too long");
		}
		if(employeeDAO.findByProperty("username", employee.getUsername()).size()!=0){
			this.addFieldError("newAccount", "The User Already Existed");
		}
		if(employee.getFirstname()==null || employee.getFirstname().trim().equals("")){
			this.addFieldError("newAccount", "First Name cannot be empty");
		}
		if(employee.getFirstname().length()>20) {
			this.addFieldError("newAccount", "The First Name is too long");
		}
		if(employee.getLastname()==null || employee.getLastname().trim().equals("")){
			this.addFieldError("newAccount", "Last Name cannot be empty");
		}
		if(employee.getLastname().length()>20) {
			this.addFieldError("newAccount", "The Last Name is too long");
		}
		if(employee.getPassword()==null || employee.getPassword().trim().equals("")){
			this.addFieldError("newAccount", "Password cannot be empty");
		}
		if(this.confirmPassword==null || this.confirmPassword.trim().equals("")){
			this.addFieldError("newAccount", "ConfirmPassword cannot be empty");
		}
		if(employee.getPassword().length()>30) {
			this.addFieldError("newAccount", "The Password is too long");
		}
		String temp=employee.getPassword();
		if(!temp.equals(this.confirmPassword)) {
			this.addFieldError("newAccount", "Password not the same");
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
	public Employee getEmployee() {
		return employee;
	}
	private void updateToday(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> application = ctx.getSession();
		Date td=transactionDAO.findLastTransitionDay();
		Date fd=fundPriceHistoryDAO.findLastTransitionDay();
		if(td==null&&fd==null){
			try {
				application.put("today", (new SimpleDateFormat("yyyy-MM-dd")).parse("1900-01-01"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(fd==null){
			application.put("today", td);
		}else if(td==null){
			application.put("today", fd);
		}else{
			if(td.after(fd)){
				application.put("today", td);
			}else{
				application.put("today", fd);
			}
		}
	}
	public void setFundPriceHistoryDAO(IFundPriceHistoryDAO fundPriceHistoryDAO) {
		this.fundPriceHistoryDAO = fundPriceHistoryDAO;
	}
	public void setTransactionDAO(ITransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}
}
