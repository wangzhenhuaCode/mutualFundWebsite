<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
            <ul><li><a href="Home.html" class="MenuButton"><span>Home</span></a></li> <li><a href="Trade.html" class="MenuButton"><span>Trade</span></a></li> <li><a href="Finance.html" class="MenuButton"><span>Finance</span></a></li> <li><a href="History.html" class="ActiveMenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

        <h2>Transaction History</h2>

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
                    <td>1%</td><td>100.000</td>
                    <td>50.00</td>
                    <td>5,000.00</td>
  				</tr>
			</tbody></table>
         </p>

        </div>
        </div>


<jsp:include page="template-bottom.jsp" />