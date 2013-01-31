<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">

           <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="ActiveMenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>

        </div>

<jsp:include page="employee_template-top2.jsp" />

            
            <s:form method="post" action="act/finance_deposit.action" validate="true">
            <h2>Deposit Check:</h2>
            <s:hidden name="customer.customerId" value="%{customer.customerId}"></s:hidden>
            
            <h3><s:property value="customer.firstname" />&nbsp;<s:property value="customer.lastname" />'s Account:</h3>
            <h3>Balance: $<s:property value="customer.currentCash"/></h3>
            
			<table>
            	<tr>
                <td>Amount:</td>
                <td><input type="text" style="width:120px" name="amount"><td>
                <td><span class="ButtonInput"><span><input type="submit" value="Deposit" ></span></span></td>
                <td><a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a></td>
                </tr>
			</table>
			<s:fielderror/>
            </s:form>
            


<jsp:include page="template-bottom.jsp" />