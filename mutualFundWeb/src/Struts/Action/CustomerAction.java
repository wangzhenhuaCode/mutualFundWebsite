package Struts.Action;

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
		List<Customer> list = customerDAO.findByProperty("username", username);
		if (list.size() == 0) {
			errorInfo = "Username error!";
			return "customerFailureLogin";
		}
		if (list.get(0).getPassword().equals(password)) {
			ActionContext ctx = ActionContext.getContext();
			Map<String, Object> session = ctx.getSession();
			session.put("customer", list.get(0));
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

}
