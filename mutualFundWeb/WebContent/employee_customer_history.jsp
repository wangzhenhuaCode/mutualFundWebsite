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

            
            <h2>Yue Ma's Transaction History</h2>
            
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
                    <tr class="pending">
                        <td>Pending...</td>
                        <td>Request Check</td>
                        <td>-</td><td>-</td>
                        <td>-</td>
                        <td>6,000.00</td>
                    </tr>
                    <tr class="pending">
                        <td>Pending...</td>
                        <td>Deposit</td>
                        <td>-</td><td>-</td>
                        <td>-</td>
                        <td>3,000.00</td>
                    </tr>
                    <tr>
                        <td>01/17/2013</td>
                        <td>Buy</td>
                        <td>Name</td>
                        <td>100.000</td>
                        <td>50.00</td>
                        <td>5,000.00</td>
                    </tr>
                </tbody></table>
            </p>
            <div align="right" style="margin-right:80px;">
            <span class="ButtonInput"><span align="center"><input type="button" value="Back"/></span></span>
            </div>

<jsp:include page="template-bottom.jsp" />
