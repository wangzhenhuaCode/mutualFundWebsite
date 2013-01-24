<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="employee_home.html" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="employee_transaction.html" class="MenuButton"><span>Transaction History</span></a></li> <li><a href="employee_customer.html" class="MenuButton"><span>Account Management</span></a></li> <li><a href="employee_fund.html" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />


 <h2>Welcome, <s:property value="#session.employee.firstname" /></h2>
            
            <br />
            <h3>Fund Summary:</h3>
            
            <form method="post" action="<%=basePath%>/act/transaction_transact.action">
           <table class="bottomBorder">
				<col width="150">
				<col width="150">
				<col width="100">


                <tr>
                    <th>Fund Ticker</th>
                    <th>Last Price</th>
                    <th>New Price</th>
                </tr>
                <s:iterator value="fundlist" id="fund">
                <tr>
                    <td><s:property value="#fund.symbol" /></td>
                    <td><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>N/A</s:else></td>
                    <td><input type="text" style="width: 100px" name="newPrices"/></td>
                </tr>
                </s:iterator>
                
            </table>
			
            <div align = "left">
            <br />
            <h3>New Trading Date:</h3>
            <input type="text", style="width: 120px" name="datestring"/>
            <br />
            <br />
                
                <span class="ButtonInput"><span align="center"><input type="submit" value="Update Transaction Day & Prices"/></span></span>
                
			</div>
                       
           <br />
</form>

<jsp:include page="template-bottom.jsp" />