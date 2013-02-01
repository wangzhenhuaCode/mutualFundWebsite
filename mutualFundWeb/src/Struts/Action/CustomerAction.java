package Struts.Action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import Hibernate.DAO.ICustomerDAO;
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

	public String login() {

		errorInfo = "";
		password=getMD5Str(password);
		List<Customer> list = customerDAO.findByProperty("username", username);
		if (list.size() == 0) {
			errorInfo = "Username error!";
			return "customerFailureLogin";
		}
		if (list.get(0).getPassword().equals(password)) {
			ActionContext ctx = ActionContext.getContext();
			Map<String, Object> session = ctx.getSession();
			session.put("customer", list.get(0));
			if(session.containsKey("emploee"))
				session.remove("employee");
			return "customerSucessLogin";
		} else {
			errorInfo = "Password error!";
			return "customerFailureLogin";
		}
	}
	
	@InputConfig(resultName="resetPassword")
	public String changePassword() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Customer c=null;
		c = (Customer) session.get("customer");
		c.setPassword(newCustomerPassword);
		customerDAO.update(c);
		return "customerSucessChangePassword";
	}
	public void validateChangePassword() {
		if(this.newCustomerPassword==null || this.newCustomerPassword.trim().equals(""))
			this.addFieldError("resetPassword", "Password cannot be empty");
		if(this.newCustomerPassword==null || this.confirmCustomerPassword.trim().equals(""))
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
		customerDAO.update(customer);
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

}
