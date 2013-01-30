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

            <form method="post" action="<%=basePath%>act/employee_viewTransactionHistory.action">
            <h2><s:property value="customer.firstname"/> <s:property value="customer.lastName"/>'s Transaction History</h2>
            
            <p>
            <br />
             <table class="bottomBorder" cellspacing="15px" align="left">
  				<tbody align="center" ><tr>
    				<th width="130">Transaction Date</th>
    				<th width="90">Operation</th>
				<th width="100">Fund Ticker</th>
    				<th width="60">Shares</th>
				<th width="90">Share Price</th>
    				<th width="60">Amount</th>
  				</tr>
               <s:iterator value="transactionList" id="transaction">
                <tr>
                    <td><s:property value="#transaction.currentDate" /></td>
                    <td>
                    <s:if test="#transaction.transactionType==1">Sold</s:if>
                    <s:if test="#transaction.transactionType==2">Pending Sell</s:if>
                    <s:if test="#transaction.transactionType==3">Bought</s:if>
                    <s:if test="#transaction.transactionType==4">Pending Buy</s:if>
                    <s:if test="#transaction.transactionType==5">Deposited</s:if>
                    <s:if test="#transaction.transactionType==6">Pending Deposit</s:if>
                    <s:if test="#transaction.transactionType==7">Withdrew</s:if>
                    <s:if test="#transaction.transactionType==8">Pending Withdraw</s:if>
                    </td>
                    <td><s:if test="#transaction.fund!=null"><a href="<%=basePath%>act/trade_employeeResearch.action?fund.fundId=<s:property value="#transaction.fund.fundId" />"><s:property value="#transaction.fund.symbol" /></a></s:if><s:else>--</s:else></td>
                    <td align="right"><s:if test="#transaction.fund!=null"><s:property value="#transaction.currentShares" /></s:if><s:else>--</s:else></td>
                    <td align="right"><s:if test="#transaction.fund!=null"><s:property value="#transaction.boughtPrice" /></s:if><s:else>--</s:else></td>
                    <td align="right"><s:property value="#transaction.currentAmount" /></td>
                   
                </tr>
              </s:iterator>
			</tbody></table>
            </p>
            
            <div align="right" style="margin-right:50px;">
            <a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
            </div>
		</form>
<jsp:include page="template-bottom.jsp" />
