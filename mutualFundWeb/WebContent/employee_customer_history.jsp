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

            <form method="post" action="<%=basePath%>act/employee_viewTransactionHistory.action">
            <h2><s:property value="customer.firstName"/> <s:property value="customer.lastName"/>'s Transaction History</h2>
            
            <p>
            <br />
            <table class="bottomBorder" cellspacing="15px">
  				<tbody align="center" >
  				<tr>
    				<th width="120">Transaction Date</th>
    				<th width="100">Operation</th>
                    <th width="80">Fund Name</th>
    				<th width="60">Shares</th>
                    <th width="80">Share Price</th>
    				<th width="60">Amount</th>
  				</tr>
  				
  				<s:iterator value="transactionList" id="transaction">
                <tr>
                    <td><s:property value="#transaction.executeDate"/></td>
                    <td><s:property value="#transaction.transactionType"/></td>
                    <td><s:property value="#transaction.fund.name"/></td>
                    <td><s:property value="#transaction.shares"/></td>
                    <td></td>
                    <td><s:property value="#transaction.amount"/></td>
                </tr>
                </s:iterator>
                 
                </tbody>
                </table>
            </p>
            <div align="right" style="margin-right:80px;">
            <span class="ButtonInput"><span align="center"><input type="button" value="Back"/></span></span>
            </div>
		</form>
<jsp:include page="template-bottom.jsp" />
