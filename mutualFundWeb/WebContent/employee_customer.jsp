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

<jsp:include page="template-top2.jsp" />

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
                <tr>
                    <td><strong>Yue Ma</strong></td>
                    <td><a href="employee_customer_viewChangeProfile.html">View Account</a></td>
                    <td><a href="employee_customer_deposit_check.html">Deposit Check</a></td>
                    <td><a href="employee_customer_resetpassword.html">Reset Password</a></td>
                    <td><a href="employee_customer_history.html">Transaction History</a></td>
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