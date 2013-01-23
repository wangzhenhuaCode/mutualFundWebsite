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

<jsp:include page="template-top2.jsp" />


 <h2>Welcome, <s:property value="#session.employee.firstname" /></h2>
            
            <br />
            <h3>Fund Summary:</h3>
            
            
           <table class="bottomBorder">
				<col width="150">
				<col width="150">
				<col width="100">


                <tr>
                    <th>Fund Ticker</th>
                    <th>Last Price</th>
                    <th>New Price</th>
                </tr>
                <tr>
                    <td>MCSM01</td>
                    <td>50.00</td>
                    <td><input type="text", style="width: 100px"/></td>
                </tr>
                <tr>
                    <td>JFEPG07</td>
                    <td>100.00</td>
                    <td><input type="text", style="width: 100px"/></td>
                </tr>
                <tr>
                    <td>TT04</td>
                    <td>50.00</td>
                    <td><input type="text", style="width: 100px"/></td>
                </tr>
                <tr>
                    <td>JPP04</td>
                    <td>100.00</td>
                    <td><input type="text", style="width: 100px"/></td>
                </tr>
            </table>
			
            <div align = "left">
            <br />
            <h3>New Trading Date:</h3>
            <input type="text", style="width: 120px"/>
            <br />
            <br />
                
                <span class="ButtonInput"><span align="center"><input type="button" value="Update Transaction Day & Prices"/></span></span>
                
			</div>
                       
           <br />


<jsp:include page="template-bottom.jsp" />