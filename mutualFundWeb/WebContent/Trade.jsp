<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
            <ul><li><a href="Home.html" class="MenuButton"><span>Home</span></a></li> <li><a href="Trade.html" class="ActiveMenuButton"><span>Trade</span></a></li> <li><a href="Finance.html" class="MenuButton"><span>Finance</span></a></li> <li><a href="History.html" class="MenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

            
        <h2>Trade Our Funds</h2>
            
            
            
            
            <table class="bottomBorder">
                <tr>
                    <th>Fund Ticker</th>
                    <th>Fund Name</th>
                    <th>Last Price</th>
                    <th>Change</th>
                    <th>Position</th>
                    <th>Value</th>
                    <th>P&amp;L</th>
                </tr>
                <tr>
                    <td><a href="ResearchFund.html">MCSM01</a></td>
                    <td>Michael Shamos 01</td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>50.000</td>
                    <td>5,000.00</td>
                    <td><font color="red">-123.00</td>
                </tr>
                <tr>
                    <td><a href="">JFEPG07</a></td>
                    <td>Jeff Eppinger 07</td>
                    <td>200.00</td>
                    <td><font color="green">+5%</td>
                    <td>50.000</td>
                    <td>10,000.00</td>
                    <td><font color="green">+3333.00</td>
                </tr>
                <tr>
                    <td><a href="">MCSM01</a></td>
                    <td>Michael Shamos 01</td>
                    <td>100.00</td>
                    <td><font color="red">-5%</td>
                    <td>50.000</td>
                    <td>5,000.00</td>
                    <td><font color="red">-123.00</td>
                </tr>
                <tr>
                    <td><a href="">JFEPG07</a></td>
                    <td>Jeff Eppinger 07</td>
                    <td>200.00</td>
                    <td><font color="green">+5%</td>
                    <td>50.000</td>
                    <td>10,000.00</td>
                    <td><font color="green">+3333.00</td>
                </tr>
            </table>
            
            <p>
            Please enter fund ticker to purchase or sale, your transaction will be proceed on next working day.
            </p>
            
            
            <br /><br />
            
            <form method="post" action="">
                
                <table>
                    <tr>
                        <td>
                            Fund Ticker
                        </td>
                        <td>
                            Value
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
                <span class="ButtonInput"><span><input type="button" value="BUY" /></span></span>
                
            </form>
            
            <br /><br />
            
            <form method="post" action="">
                
                <table>
                    <tr>
                        <td>
                            Fund Ticker
                        </td>
                        <td>
                            Shares
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
                <span class="ButtonInput"><span><input type="button" value="SELL" /></span></span>
            </form>
            
            <br /><br />

<jsp:include page="template-bottom.jsp" />
