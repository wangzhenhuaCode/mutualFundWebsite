<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/customer_login.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href="#" class="ActiveMenuButton"><span>Finance</span></a></li> <li><a href="History.html" class="MenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

        <h2 >Check Request</h2>
            

        <p>
            <br />
            <h3>Request History</h3>
            <form method="post" action="<%=basePath%>act/finance_requestCheck.action">
               <table class="bottomBorder">
			   	<col width="250">
				<col width="250">
				<col width="50">

			   		<tr style="padding-bot:10px;">
						<td><Strong align="left">Date</strong>
						<td><Strong align="right">Ammount</strong>
						<td><Strong align="right">Balance</strong>
					</tr>
					<tr>
						<td>02 Jan 2013</td>
						<td>17,100.00</td>
						<td>17,100.00</td>
					</tr>
					<tr>
						<td>22 Jan 2013</td>
						<td>-5,100.00</td>
						<td>12,000.00</td>
					</tr>


			   </table>
            <h3>Current Balance: 12,000.00</h3>
               
            <br />
			
			<div class="amount">
			<input type="text" name="amount" style="width: 190px;" >
			</div>
            
            <br />
		<div align = "left">
            <span class="ButtonInput"><span align="center"><input type="submit" value="Request Check"/></span></span>
		</div>
		</form>
        </p>


        


       
<jsp:include page="template-bottom.jsp" />
