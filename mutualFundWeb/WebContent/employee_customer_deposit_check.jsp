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

            
            
            <h2>Deposit Check:</h2>
            
            
            <h3>Yue Ma</h3>
            <h4>Balance: $5,000.00</h4>
			<table>
            	<tr>
                <td>Amount:</td>
                <td><input type="text" style="width:120px"><td>
                <td><span class="ButtonInput"><span><input type="button" value="Deposit"></span></span></td>
                <td><span class="ButtonInput"><span><input type="button" value="Cancel"></span></span></td>
                </tr>
			</table>
            


<jsp:include page="template-bottom.jsp" />