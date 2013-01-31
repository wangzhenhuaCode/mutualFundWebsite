<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">

            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>

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
				<td><input type="password" name="customer.password"></td>
				<td><input type="password" name="confirmCustomerPassword"></td>
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
						<option value="AL">AL</option>
						<option value="AK">AK</option>
						<option value="AZ">AZ</option>
						<option value="AR">AR</option>
						<option value="CA">CA</option>
						<option value="CO">CO</option>
						<option value="CT">CT</option>
						<option value="DE">DE</option>
						<option value="DC">DC</option>
						<option value="FL">FL</option>
						<option value="GA">GA</option>
						<option value="HI">HI</option>
						<option value="ID">ID</option>
						<option value="IL">IL</option>
						<option value="IN">IN</option>
						<option value="IA">IA</option>
						<option value="KS">KS</option>
						<option value="KY">KY</option>
						<option value="LA">LA</option>
						<option value="ME">ME</option>
						<option value="MD">MD</option>
						<option value="MA">MA</option>
						<option value="MI">MI</option>
						<option value="MN">MN</option>
						<option value="MS">MS</option>
						<option value="MO">MO</option>
						<option value="MT">MT</option>
						<option value="NE">NE</option>
						<option value="NV">NV</option>
						<option value="NH">NH</option>
						<option value="NJ">NJ</option>
						<option value="NM">NM</option>
						<option value="NY">NY</option>
						<option value="NC">NC</option>
						<option value="ND">ND</option>
						<option value="OH">OH</option>
						<option value="OK">OK</option>
						<option value="OR">OR</option>
						<option value="PA">PA</option>
						<option value="RI">RI</option>
						<option value="SC">SC</option>
						<option value="SD">SD</option>
						<option value="TN">TN</option>
						<option value="TX">TX</option>
						<option value="UT">UT</option>
						<option value="VT">VT</option>
						<option value="VA">VA</option>
						<option value="WA">WA</option>
						<option value="WV">WV</option>
						<option value="WI">WI</option>
						<option value="WY">WY</option>
						<option value="ZZ">N/A</option>
				</select>
				
				</td>
				<td><input type="text" size="5" name="customer.zip"></td>
				</tr>
				
				
			</table> 
			<br />
			<br />
			<span class="ButtonInput"><span><input type="submit" value="Create" style="width:100px"></span></span>&nbsp;&nbsp;&nbsp;
			<a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
			<s:fielderror/>
		</s:form>
<jsp:include page="template-bottom.jsp" />
