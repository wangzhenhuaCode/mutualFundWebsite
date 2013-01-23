<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="employee_home.html" class="MenuButton"><span>Home</span></a></li> <li><a href="employee_transaction.html" class="MenuButton"><span>Transaction History</span></a></li> <li><a href="employee_customer.html" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="employee_fund.html" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>


<jsp:include page="employee_template-top2.jsp" />

        <h2 >Reset Password for Yue Ma</h2>
            <br />
		<table >
			<col width="150">
			<col width="250">
			<div class="name">
				<tr>
					<td><strong>New Password:</strong></td>
					<td><input type="text" , name="first name"
						style="width: 200px" /></td>
				</tr>
			</div>
			<div class="inputName">
				<tr>
				<td><strong>Confirm Password:</strong></td>
				<td><input type="text" , name="last name" style="width: 200px" />
					</td>
				<tr>
			</div>
		</table>
       <div align = "right" style="margin-right:280px;">
            <span class="ButtonInput"><span align="center"><input type="button" value="Reset"/></span></span>
           <span class="ButtonInput"><span align="center"><input type="button" value="Cancel"/></span></span>
		</div>
       
<jsp:include page="template-bottom.jsp" />
