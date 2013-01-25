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
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />
            
            <h2>View / Edit Profile</h2>
            <br />
			<table>
				<tr>
                    <td><b>First Name</b></td>
                    <td><b>Last Name</b></td>
				</tr>
				<tr>
                    <td><div class="edit">Yue</div></td>
                    <td><div class="edit">ma</div></td>
				</tr>
				<tr>
                    <td><b>Date of Birth</b></td>
                    <td><b>Social Security Number</b></td>
				</tr>
				<tr>
                    <td><div class="edit">Jan.12 1989</div></td>
                    <td><div class="edit">123-123-123</div></td>
				</tr>
				<tr>
                    <td><b>Email Address</b></td>
				</tr>
				<tr>
                    <td><div class="edit">email@gmail.com</div></td>
				</tr>
				<tr>
                    <td><b>Address</b></td>
                    <td><b>Apartment Number</b></td>
				</tr>
				<tr>
                    <td><div class="edit">#5, Forbes Avenue</div></td>
                    <td><div class="edit">201</div></td>
				</tr>
				<tr>
                    <td><b>City</b></td>
                    <td><b>State</b></td>
                    <td><b>Zipcode</b></td>
				</tr>
				<tr>
                    <td><div class="edit">Pittsburgh</div></td>
                    <td><div class="edit">PA</div></td>
                    <td><div class="edit">15213</div></td>
				</tr>
				<tr>
                    <td><b>Account Type</b></td>
				</tr>
				<tr>
                    <td><input type="radio" name="accountType" value="customer" checked>Customer <input type="radio" name="accountType" value="employee">Employee</td>
				</tr>
			</table>
            Click field to change the value.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="ButtonInput"><span><input type="button" value="Update" /></span></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="ButtonInput"><span><input type="button" value="Cancel" /></span></span>
            
            
<jsp:include page="template-bottom.jsp" />