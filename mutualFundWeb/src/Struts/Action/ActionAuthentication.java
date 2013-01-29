package Struts.Action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ActionAuthentication extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		 String url = arg0.getInvocationContext().getName();
		 ActionContext ctx=ActionContext.getContext();
		 Map<String,Object> session=ctx.getSession();
		 if(url.contains("employee_")){
			 if(!url.contains("login"))
			 if(session.containsKey("employee")){
				 return arg0.invoke();
			 }else{
				 return "loginPage";
			 }
		 }else if(url.contains("customer_")){
			 if(!url.contains("login"))
			 if(session.containsKey("customer")){
				 return arg0.invoke();
			 }else{
				 return "loginPage";
			 }
		 }else if(url.contains("transaction_")){
			 if(session.containsKey("employee")){
				 return arg0.invoke();
			 }else{
				 return "loginPage";
			 }
		 }else{
			 if(url.contains("trade_")){
				 if(url.contains("employee")){
					 if(session.containsKey("employee")){
						 return arg0.invoke();
					 }else{
						 return "loginPage";
					 }
				 }else{
					 if(session.containsKey("customer")){
						 return arg0.invoke();
					 }else{
						 return "loginPage";
					 }
				 }
			 }else if(url.contains("finance_")){
				 if(url.contains("deposit")){
					 if(session.containsKey("employee")){
						 return arg0.invoke();
					 }else{
						 return "loginPage";
					 }
				 }else{
					 if(session.containsKey("customer")){
						 return arg0.invoke();
					 }else{
						 return "loginPage";
					 }
				 }
			 }
		 }
		 System.out.println(url);
		return arg0.invoke();
	}

}
