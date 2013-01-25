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
		<form method="post" action="<%=basePath%>act/customer_viewCustomers.action" id="form">
            <h2>Account Management</h2>
            
            <a href="<%=basePath%>act/employee_goToAddNewCustomerAccount.action" class="Button"><span> Create New Account</span></a>
            
            <p></p>
            <p></p>
            
            <h4>Customer List:</h4>
            
            <p></p>
            <p></p>
            <table class="bottomBorder" cellspacing="20px">
                <tbody align="left">
                <s:iterator value="customerList" id="customer">
                <tr>
                	<td><strong><s:property value="#customer.firstName" /><s:property value="#customer.lastName" /></strong></td>
                    <td><a href="<%=basePath%>act/employee_viewCustomerAccount.action?customer.customerId=<s:property value="#customer.id"/>">View Account</a></td>
                    <td><a href="<%=basePath%>act/employee_checkCustomerdeposit.action?customer.customerId=<s:property value="#customer.id"/>">Deposit Check</a></td>
                    <td><a href="<%=basePath%>act/employee_resetCustomerPassword.action?customer.customerId=<s:property value="#customer.id"/>">Reset Password</a></td>
                    <td><a href="<%=basePath%>act/employee_viewTransactionHistory.action?customer.customerId=<s:property value="#customer.id"/>">Transaction History</a></td>
                </tr>
                </s:iterator>
            	</tbody>
            </table>
		</form>
            
<jsp:include page="template-bottom.jsp" />
