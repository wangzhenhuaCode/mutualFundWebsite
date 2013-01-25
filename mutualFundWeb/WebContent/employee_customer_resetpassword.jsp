<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
           <ul><li><a href='<%=basePath%>act/employee_homePage.action' class="MenuButton"><span>Home</span></a></li> <li><a href='<%=basePath%>act/employee_transactionPage.action' class="MenuButton"><span>Transaction History</span></a></li> <li><a href='<%=basePath%>act/employee_customerPage.action' class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href='<%=basePath%>act/employee_fundPage.action' class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>



<jsp:include page="template-top2.jsp" />
		<form method="post" action="<%=basePath%>act/employee_resetCustomerPassword.action" id="form">
        <h2 >Reset Password for <s:property value="customer.firstname" /><s:property value="customer.lastname" /> </h2>

            <br />
		<table >
			<col width="150">
			<col width="250">
			<div class="name">
				<tr>
					<td><strong>New Password:</strong></td>
					<td><input type="text" , name="newPassword"
						style="width: 200px" /></td>
				</tr>
			</div>
			<div class="inputName">
				<tr>
				<td><strong>Confirm Password:</strong></td>
				<td><input type="text" , name="newPassword" style="width: 200px" />
					</td>
				<tr>
			</div>
		</table>
       <div align = "right" style="margin-right:280px;">
            <span class="ButtonInput"><span align="center"><input type="button" value="Reset"/></span></span>
           <span class="ButtonInput"><span align="center"><input type="button" value="Cancel"/></span></span>
		</div>
		</form>
       
<jsp:include page="template-bottom.jsp" />
