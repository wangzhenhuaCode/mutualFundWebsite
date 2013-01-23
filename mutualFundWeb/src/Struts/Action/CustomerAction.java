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
	private String errorInfo;
	public String login(){
		errorInfo="";
		List<Customer> list=customerDAO.findByProperty("username", customer.getUsername());
		if(list.size()==0){
			errorInfo="Username error!";
			return "failure";
		}
		if(list.get(0).getPassword().equals(customer.getPassword())){
			ActionContext ctx=ActionContext.getContext();
			Map<String,Object> session=ctx.getSession();
			session.put("customer", list.get(0));
			return "customerSucessLogin";
		}
		else{
			errorInfo="Password error!";
			return "customerFailureLogin";
		}
	}
	public String changePassword(){
		errorInfo="";
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		Customer c=(Customer)session.get("customer");
		if(c.getPassword().equals(customer.getPassword())){
			c.setPassword(newPassword);
			customerDAO.update(c);
			return "customerSucessChangePassword";
		}else{
			errorInfo="Password Error";
			return "customerFailureChangePassword";
		}
		
	}
	public String logout(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
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
	
}
