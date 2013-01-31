<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/editable.js"></script>
    <script>
        $(document).ready(function() {
                          $('.edit').editable();
                          });
    </script>

		<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />
         <s:form method="post" action="act/employee_viewCustomerAccount.action" validate= "true" id="form">
            <s:hidden name="customer.customerId" value="%{customer.customerId}"></s:hidden>
       		<s:hidden name="customer.username" value="%{customer.username}"></s:hidden>
       		<s:hidden name="customer.password" value="%{customer.password}"></s:hidden>
       		<s:hidden name="customer.cash" value="%{customer.cash}"></s:hidden>

       		<s:hidden name="customer.version" value="%{customer.version}"></s:hidden>
			<s:hidden name="customer.pendingCash" value="%{customer.pendingCash}"></s:hidden>
            <h2>View / Edit Profile</h2>
            <br />
			<table>
				<tr>
                    <td><b>First Name</b></td>
                    <td><b>Last Name</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.firstname"/>" name="customer.firstname" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.lastname"/>" name="customer.lastname" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				
				<tr>
                    <td><b>Address Line1</b></td>
                    <td><b>Address Line2</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.addrLine1"/>" name="customer.addrLine1" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.addrLine2"/>" name="customer.addrLine2" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				<tr>
                    <td><b>City</b></td>
                    <td><b>State</b></td>
                    <td><b>Zipcode</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.city"/>" name="customer.city" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td>
                    <select name="customer.state">
                    <option value="<s:property value="customer.state"/>"><s:property value="customer.state"/></option>
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
                    <td><input type="text" value="<s:property value="customer.zip"/>" name="customer.zip" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				<tr>
                    <td><b>Balance</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.cash"/>" name="customer.cash" style="border: 0px solid #000000; background-color: #f6f6f6;" disabled/></td>
				</tr>
				
			</table>
            Click field to change the value.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="ButtonInput"><span><input type="submit" value="Update" /></span></span>&nbsp;&nbsp;&nbsp;
            <a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
           	<s:fielderror/>
           </s:form>
            
<jsp:include page="template-bottom.jsp" />
