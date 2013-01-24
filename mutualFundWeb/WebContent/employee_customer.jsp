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

            <h2>Account Management</h2>
            
            <a href="employee_customer_New_Account.html" class="Button"><span>Create New Account</span></a>
            
            <p></p>
            <p></p>
            
            <h4>Customer List:<h4>
            <p>
            
            </p>
            <p>
            
            </p>
            <table class="bottomBorder" cellspacing="20px">
                <tbody align="left">
                <s:iterator value="fundlist" id="fund">
                <tr>
                    <td><s:property value="#fund.symbol" /></td>
                    <td><s:property value="#fund.name" /></td>
                    <td><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>N/A</s:else></td>
                    <td><font color="red"><s:if test="#fund.percentage!=null"><s:property value="#fund.percentage" /></s:if><s:else>N/A</s:else></font></td>
                </tr>
                </s:iterator>
                <tr>
                    <td><strong>Yue Ma</strong></td>
                    <td><a href="<%=basePath%>act/employee_viewCustomer.action?customer.customerId=">View Account</a></td>
                    <td><a href="<%=basePath%>act/employee_depositCheck.action">Deposit Check</a></td>
                    <td><a href="<%=basePath%>act/employee_resetPassword.action">Reset Password</a></td>
                    <td><a href="<%=basePath%>act/employee_transactionHistory.action">Transaction History</a></td>
                </tr>
                <tr>
                    <td><strong>Edward Zhang</strong></td>
                    <td><a href="">View Account</a></td>
                    <td><a href="">Deposit Check</a></td>
                    <td><a href="">Reset Password</a></td>
                    <td><a href="">Transaction History</a></td>
                </tr>
            </tbody></table>

            
<jsp:include page="template-bottom.jsp" />
