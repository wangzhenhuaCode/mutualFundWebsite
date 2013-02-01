<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
        	<ul><li><a href="<%=basePath%>act/trade_showPosition.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="ActiveMenuButton"><span>History</span></a></li></ul>
        	
        </div>

<jsp:include page="template-top2.jsp" />

        <h2>Transaction History</h2>

        <p>
        <br />
            <table class="bottomBorder" cellspacing="15px">
  				<tbody align="center" ><tr>
    				<th width="120">Transaction Date</th>
    				<th width="100">Operation</th>
                    <th width="80">Fund Name</th>
    				<th width="60">Shares</th>
                    <th width="80">Share Price</th>
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
                    <td><s:if test="#transaction.fund!=null"><a href="<%=basePath%>act/trade_gotoResearch.action?fund.fundId=<s:property value="#transaction.fund.fundId" />"><s:property value="#transaction.fund.symbol" /></a></s:if><s:else>--</s:else></td>
                    <td align="right"><s:property value="#transaction.currentShares" /></td>
                    <td align="right"><s:if test="#transaction.fund!=null"><s:property value="#transaction.boughtPrice" /></s:if><s:else>-</s:else></td>
                    <td align="right"><s:property value="#transaction.currentAmount" /></td>
                   
                </tr>
              </s:iterator>
			</tbody></table>
         </p>

        
        


<jsp:include page="template-bottom.jsp" />