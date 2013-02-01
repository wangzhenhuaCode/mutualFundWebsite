package Struts.Action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.DAO.IFundPriceHistoryDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Customer;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class CustomerAction extends ActionSupport {
	private ICustomerDAO customerDAO;
	private Customer customer;
	private String newPassword;
	private String newCustomerPassword;
	private String confirmCustomerPassword;
	private String errorInfo;
	private String username;
	private String password;
	private ITransactionDAO transactionDAO;
	private IFundPriceHistoryDAO fundPriceHistoryDAO;
	@InputConfig(resultName="loginPage")
	public String login() {

		
		password=getMD5Str(password);
		List<Customer> list = customerDAO.findByProperty("username", username);
		if (list.size() == 0) {
			this.addFieldError("username", "Username error!");
			return "loginPage";
		}
		if (list.get(0).getPassword().equals(password)) {
			ActionContext ctx = ActionContext.getContext();
			Map<String, Object> session = ctx.getSession();
			Map<String, Object> application = ctx.getApplication();
			session.put("customer", list.get(0));
			if(!application.containsKey("today")){
				 updateToday();
			}
			if(session.containsKey("emploee"))
				session.remove("employee");
			return "customerSucessLogin";
		} else {
			this.addFieldError("username", "Password error!");
			return "loginPage";
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

	
	@InputConfig(resultName="resetPassword")
	public String changePassword() {

		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Customer c=null;


		c =customerDAO.load(Customer.class, ((Customer) session.get("customer")).getCustomerId());
		newCustomerPassword=getMD5Str(newCustomerPassword);
		c.setPassword(newCustomerPassword);
		customerDAO.update(c);
		session.put("customer", c);

		return "customerSucessChangePassword";


	}

	
	public void validateChangePassword() {
		if(this.newCustomerPassword==null || this.newCustomerPassword.trim().equals(""))
			this.addFieldError("resetPassword", "Password cannot be empty");
		if(this.confirmCustomerPassword==null || this.confirmCustomerPassword.trim().equals(""))
			this.addFieldError("resetPassword", "Confirm Password cannot be empty");
		if(!this.newCustomerPassword.equals(this.confirmCustomerPassword))
			this.addFieldError("resetPassword", "Password is not the same");
	}

	public String gotoChangeProfile(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();

		customer = (Customer) session.get("customer");
		return "changeProfile";
	}
	@InputConfig(resultName="changeProfile")
	public String changeProfile(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Customer oldcustomer=customerDAO.load(Customer.class,((Customer) session.get("customer")).getCustomerId());
		customer.setVersion(oldcustomer.getVersion());
		customer.setCustomerId(oldcustomer.getCustomerId());
		customer.setCash(oldcustomer.getCash());
		customer.setUsername(oldcustomer.getUsername());
		customer.setPassword(oldcustomer.getPassword());
		customer.setPendingCash(oldcustomer.getPendingCash());
		customerDAO.merge(customer);
		session.put("customer", customer);
		return "changeProfileSuccess";
	}
	
	public void validateChangeProfile() {
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
	public String gotoChangePassword(){
		return "resetPassword";
	}
	
	public String logout() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		session.remove("customer");
		return "logout";
	}
	public String gotoLogin(){
		return "loginPage";
	}
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public void setNewCustomerPassword(String newCustomerPassword) {
		this.newCustomerPassword = newCustomerPassword;
	}
	
	public void setConfirmCustomerPassword(String confirmCustomerPassword) {
		this.confirmCustomerPassword = confirmCustomerPassword;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
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
	private void updateToday(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> application = ctx.getApplication();
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

	public void setTransactionDAO(ITransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}

	public void setFundPriceHistoryDAO(IFundPriceHistoryDAO fundPriceHistoryDAO) {
		this.fundPriceHistoryDAO = fundPriceHistoryDAO;
	}

}
