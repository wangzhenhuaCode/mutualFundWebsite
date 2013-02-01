<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
	  <ul><li><a href="<%=basePath%>act/trade_showPosition.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="ActiveMenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="MenuButton"><span>History</span></a></li></ul>
	
        </div>

<jsp:include page="template-top2.jsp" />

        <h2 >Check Request</h2>
            
Current Day: <s:property value="#application['today']" />
        <p>
            <br />
            <h3>Request History</h3>

            <s:form method="post" action="act/finance_requestCheck.action" validation="true">
               <table class="bottomBorder">
			   	<col width="150">
				<col width="150">
				<col width="150">


			   		<tr style="padding-bot:10px;">
						<th>Date</th>
						<th>Amount</th>
						<th>Status</th>
						
					</tr>
					<s:iterator value="transactionList" id="transaction">
					<s:if test="#transaction.transactionType>4">
					<tr>
						<td align="center"><s:property value="#transaction.currentDate" /></td>
						<td align="right"><s:property value="#transaction.currentAmount" /></td>
						<td align="center"><s:if test="#transaction.transactionType==5">Deposited</s:if>
                    <s:if test="#transaction.transactionType==6">Pending Deposit</s:if>
                    <s:if test="#transaction.transactionType==7">Withdrew</s:if>
                    <s:if test="#transaction.transactionType==8">Pending Withdraw</s:if></td>
					</tr>
					</s:if>
					</s:iterator>


			   </table>
			   
			<br />
            <h3>Current Balance: <s:property value="#session.customer.currentCash" /></h3>
			<h3>Available Balance: <s:property value="#session.customer.available" /></h3>
			<br />
			<div class="amount">
			Amount:&nbsp;<input type="text" name="amount" style="width: 190px;" >
			</div>
            
            <br />
		<div align = "left">
            <span class="ButtonInput"><span align="center"><input type="submit" value="Request Check"/></span></span>
		</div>
		<s:fielderror/>
		</s:form>
        </p>

<jsp:include page="template-bottom.jsp" />
