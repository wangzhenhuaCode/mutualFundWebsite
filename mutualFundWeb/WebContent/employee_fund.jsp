<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="employee_home.html" class="MenuButton"><span>Home</span></a></li> <li><a href="employee_transaction.html" class="MenuButton"><span>Transaction History</span></a></li> <li><a href="employee_customer.html" class="MenuButton"><span>Account Management</span></a></li> <li><a href="employee_fund.html" class="ActiveMenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />

            <h2>Fund Listed:</h2>
            
            <table class="bottomBorder">
                
                
                
                <tr>
                    <th>Fund Ticker</th>
                    <th>Fund Name</th>
                    <th>Last Price</th>
                    <th>Change</th>
                    <th>Share Sold</th>
                    <th>Current Value</th>
                    <th>Cost</th>
                </tr>
                <tr>
                    <td>MCSM01</td>
                    <td>Michael Shamos 01</td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>1000.000</td>
                    <td><font color="green">100,000.00</td>
                    <td>89,000.00</td>
                </tr>
                <tr>
                    <td>JFEPG07</td>
                    <td>Jeff Eppinger 07</td>
                    <td>10.00</td>
                    <td><font color="red">-5%</td>
                    <td>1000.000</td>
                    <td><font color="green">10,000.00</td>
                    <td>9,000.00</td>
                </tr>
                <tr>
                    <td>MCSM01</td>
                    <td>Michael Shamos 01</td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>1000.000</td>
                    <td><font color="green">100,000.00</td>
                    <td>89,000.00</td>
                </tr>
                <tr>
                    <td>JFEPG07</td>
                    <td>Jeff Eppinger 07</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
            </table>

            
            <br />
            
            <form method="post" action="">
                
                <table>
                    <tr>
                        <td>
                            Fund Ticker
                        </td>
                        <td>
                            Fund Name
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <input type="text" maxlength="255" value=""/>
                        </td>
                        <td>
                            <input type="text" maxlength="255" value=""/>
                        </td>
                        
                    </tr>
                </table>
                <span class="ButtonInput"><span><input type="button" value="Add New Fund" /></span></span>
                
            </form>
            

<jsp:include page="template-bottom.jsp" />