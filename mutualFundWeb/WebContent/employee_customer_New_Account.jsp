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
		<form method="post" action="<%=basePath%>act/customer_addNewCustomerAccount.action" id="form">
			<h2>Create a New Account</h2>
		
			<table>
				<tr>
				<td>First Name</td> 
				<td>Last Name</td>
				</tr>
				
				<tr>
				<td><input type="text" name="customer.firstName"></td>
				<td><input type="text" name="customer.lastName"></td>
				</tr>
				
				<tr>
<<<<<<< HEAD
				<td>AddressLine1</td>
				<td>AddressLine2</td>
				</tr>
				<tr>
				<td><input type="text" name="customer.addrLine1"></td>
				<td><input type="text" name="customer.addrLine2"></td>
=======
				<td>Address Line 1</td>
				<td>Address Line 2</td>
				</tr>
				<tr>
				<td><input type="text" name="customer.addLine1"></td>
				<td><input type="text" name="customer.addLine2"></td>
>>>>>>> ca770e0604d7ac6704744bb232a5cbf16d58897b
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
			<span class="ButtonInput"><span align="center"><input type="button" value="Create" style="width:100px"></span></span>
		</form>
<jsp:include page="template-bottom.jsp" />