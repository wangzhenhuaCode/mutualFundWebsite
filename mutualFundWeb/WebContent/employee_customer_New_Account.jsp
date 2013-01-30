<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">

            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>

        </div>

<jsp:include page="employee_template-top2.jsp" />
		<s:form method="post" action="act/employee_createCustomerAccount.action" validate="true" id="form">
			<h2>Create a New Account</h2>
		
			<table>
				<tr>
				<td>User Name</td> 
				</tr>
				
				<tr>
				<td><input type="text" name="customer.username"></td>
				</tr>
				
				<tr>
				<td>Password</td> 
				<td>Confirm Password</td>
				</tr>
				
				<tr>
				<td><input type="text" name="customer.password"></td>
				<td><input type="text" name="password"></td>
				</tr>
				
				<tr>
				<td>First Name</td> 
				<td>Last Name</td>
				</tr>
				
				<tr>
				<td><input type="text" name="customer.firstname"></td>
				<td><input type="text" name="customer.lastname"></td>
				</tr>
				
				<tr>
				<td>Address Line 1</td>
				<td>Address Line 2</td>
				</tr>
				
				<tr>
				<td><input type="text" name="customer.addrLine1"></td>
				<td><input type="text" name="customer.addrLine2"></td>
				</tr>
				
				<tr>
				<td>City</td>
				<td>State</td>
				<td>Zipcode</td>
				</tr>
				<tr>
				<td><input type="text" size="20" name="customer.city"></td>
				<td><input type="text" size="20" name="customer.state"></td>
				<td><input type="text" size="5" name="customer.zip"></td>
				</tr>
				<tr>
				<td>Account Type</td>
				</tr>
				<tr>
				<td><input type="radio" name="accountType" value="customer" checked>Customer <input type="radio" name="accountType" value="employee">Employee</td>
				</tr>
			</table> 
			<span class="ButtonInput"><span align="center"><input type="submit" value="Create" style="width:100px"></span></span>&nbsp;&nbsp;&nbsp;
			<a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
		</s:form>
<jsp:include page="template-bottom.jsp" />