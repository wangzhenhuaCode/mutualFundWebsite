<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />
        
        
        
        <div class="Menu">
            <ul><li><a href="<%=basePath%>act/customer_login.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="History.html" class="MenuButton"><span>History</span></a></li></ul>
        </div>


<jsp:include page="template-top2.jsp" />            
            
            <h2>Welcome, <s:property value="#session.customer.firstname" /> <s:property value="#session.customer.lastname" /></h2>
            

            <br />
            <h3>Your Account Summary:</h3>
            
            
            <table class="bottomBorder">
                <tr>
                    <th>Fund Ticker</th>
                    <th>Last Price</th>
                    <th>Price Change</th>
                    <th>Position</th>
                    <th>Bought At</th>
                    <th>Value</th>
                    <th>P&amp;L</th>
                </tr>
                <tr>
                    <td><a href="ResearchFund.html">MCSM01</a></td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>50.000</td>
                    <td>90.00</td>
                    <td>4,500.00</td>
                    <td><font color="green">+500.00</td>
                </tr>
                <tr>
                    <td><a href="">JFEPG07</a></td>
                    <td>200.00</td>
                    <td><font color="green">+5%</td>
                    <td>100.000</td>
                    <td>240.00</td>
                    <td>24,000.00</td>
                    <td><font color="red">-4,000.00</td>
                </tr>
                <tr>
                    <td><a href="">TT04</a></td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>50.000</td>
                    <td>90.00</td>
                    <td>4,500.00</td>
                    <td><font color="green">+500.00</td>
                </tr>
                <tr>
                    <td><a href="">JPP04</a></td>
                    <td>200.00</td>
                    <td><font color="green">+5%</td>
                    <td>100.000</td>
                    <td>240.00</td>
                    <td>24,000.00</td>
                    <td><font color="red">-4,000.00</td>
                </tr>
            </table>
            
           <br />
        
<jsp:include page="template-bottom.jsp" />