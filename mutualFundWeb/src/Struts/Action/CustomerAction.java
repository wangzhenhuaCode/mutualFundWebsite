package Struts.Action;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import Hibernate.DAO.ICustomerDAO;
import Hibernate.PO.Customer;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

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

	public String changePassword() {
		errorInfo = "";
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Customer c=null;
		c = (Customer) session.get("customer");
		if (newCustomerPassword.equals(confirmCustomerPassword)) {
			c.setPassword(newCustomerPassword);
			customerDAO.update(c);
			return "customerSucessChangePassword";
		} else {
			errorInfo = "Password Error";
			return "customerFailureChangePassword";
		}

	}

	public String gotoChangeProfile(){
		return "changeProfile";
	}
	
	public String changeProfile(){
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		Customer oldcustomer=(Customer) session.get("customer");
		customer.setVersion(oldcustomer.getVersion());
		customer.setCustomerId(oldcustomer.getCustomerId());
		customer.setCash(oldcustomer.getCash());
		customer.setUsername(oldcustomer.getUsername());
		customer.setPassword(oldcustomer.getPassword());
		customer.setPendingCash(oldcustomer.getPendingCash());
		customerDAO.update(customer);
		session.put("customer", customer);
		return "changeProfileSuccess";
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
