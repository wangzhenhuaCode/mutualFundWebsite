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
				<td><input type="text" name="confirmPassword"></td>
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
				<td>
				<select name="customer.state">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
					<option value="ZZ">None</option>
				</select>
				
				</td>
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
			<s:fielderror/>
		</s:form>
<jsp:include page="template-bottom.jsp" />
