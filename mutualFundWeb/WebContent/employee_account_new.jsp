<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">

            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>

        </div>

<jsp:include page="employee_template-top2.jsp" />

		<s:form method="post" action="act/employee_createCustomerAccount.action" validate="true" id="form">
			<h2>Create a New Account</h2>
		
			<table>
				<tr>
				<td>User Name</td> 
				</tr>
				
				<tr>
				<td><input type="text" name="employee.username"></td>
				</tr>
				
				<tr>
				<td>Password</td> 
				<td>Confirm Password</td>
				</tr>
				
				<tr>
				<td><input type="password" name="employee.password"></td>
				<td><input type="password" name="confirmPassword"></td>
				</tr>
				
				<tr>
				<td>First Name</td> 
				<td>Last Name</td>
				</tr>
				
				<tr>
				<td><input type="text" name="employee.firstname"></td>
				<td><input type="text" name="employee.lastname"></td>
				</tr>
				
			</table> 
			<br />
			<br />
			<span class="ButtonInput"><span><input type="submit" value="Create" style="width:100px"></span></span>&nbsp;&nbsp;&nbsp;
			<a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
			<s:fielderror/>
		</s:form>
<jsp:include page="template-bottom.jsp" />
