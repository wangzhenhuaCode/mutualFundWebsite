<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />

            
            
            <h2>All Transaction Listed:</h2>
            
            
            <table class="bottomBorder">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">

                <tr>
                    <th>Customer</th>
                    <th>Fund Ticker</th>
                    <th>Value</th>
					<th>Shares</th>
					<th>Date</th>
					<th>Status</th>
                </tr>
                <tr>
                    <td>Edward </td>
					<td>MCSM02 </td>
                    <td>50.00</td>
					<td>2.123</td>
                    <td>17 Jan,13</td>
                    <td>Pending...</td>
                </tr>
				<tr>
                    <td>Edward </td>
					<td>MCSM02 </td>
                    <td>50.00</td>
					<td>2.123</td>
                    <td>12 Jan,13</td>
                    <td>Successful</td>
                </tr>
				<tr>
                    <td>Edward </td>
					<td>MCSM02 </td>
                    <td>50.00</td>
					<td>2.123</td>
                    <td>12 Jan,13</td>
                    <td>Successful</td>
                </tr>
				<tr>
                    <td>Edward </td>
					<td>MCSM02 </td>
                    <td>50.00</td>
					<td>2.123</td>
                    <td>12 Jan,13</td>
                    <td>Successful</td>
                </tr>

            </table>
            
            
            <br />
            
                       
<jsp:include page="template-bottom.jsp" />
