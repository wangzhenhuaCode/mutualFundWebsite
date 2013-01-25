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

            
            <form method="post" action="<%=basePath%>act/finance_deposit.action">
            <h2>Deposit Check:</h2>
            
            
            <h3><s:property value="customer.firstname" />&nbsp<s:property value="customer.lastname" /></h3>
            <h4>Balance: $<s:property value="customer.cash"/></h4>
            
			<table>
            	<tr>
                <td>Amount:</td>
                <td><input type="text" style="width:120px"><td>
                <td><span class="ButtonInput"><span><input type="submit" value="Deposit" name="amount"></span></span></td>
                <td><span class="ButtonInput"><span><input type="button" value="Cancel"></span></span></td>
                </tr>
			</table>
            </form>


<jsp:include page="template-bottom.jsp" />