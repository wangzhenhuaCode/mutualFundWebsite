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

		<s:form method="post" action="act/employee_resetCustomerPassword.action" validate = "true" id="form">
		<s:hidden name="customer.customerId" value="%{customer.customerId}"></s:hidden>
        <h2 >Reset Password for <s:property value="customer.firstname" />&nbsp;<s:property value="customer.lastname" /> </h2>
		
            <br />
		<table >
			<col width="150">
			<col width="250">
			<div class="name">
				<tr>
					<td><strong>New Password:</strong></td>
					<td><input type="password" name="newCustomerPassword"
						style="width: 200px" /></td>
				</tr>
			</div>
			<div class="inputName">
				<tr>
				<td><strong>Confirm Password:</strong></td>
				<td><input type="password" name="confirmCustomerPassword" style="width: 200px" />
					</td>
				</tr>
			</div>
		</table>
       <div align = "right" style="margin-right:280px;">
            <span class="ButtonInput"><span align="center"><input type="submit" value="Reset"/></span></span>
           <a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
		</div>
		<s:fielderror/>
		</s:form>
       
<jsp:include page="template-bottom.jsp" />
