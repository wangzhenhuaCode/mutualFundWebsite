<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />

<script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/ui/css/redmond/jquery-ui-1.9.2.custom.css" />
    <script src="js/ui/js/jquery-ui-1.9.2.custom.js"></script>
    <script>
  $(function() {
    $( "#datepicker" ).datepicker({dateFormat:"yy-mm-dd"});
  });
  </script>
 <h2>Welcome, <s:property value="#session.employee.firstname" /></h2>
            <br />
			<font color="red"><s:property value="errorInfo" /></font>
			
			<form method="post" action="<%=basePath%>/act/transaction_transact.action">
            
            <h3>New Transaction Day:</h3>
            <input type="text" id="datepicker" style="width: 120px" name="datestring"/>
            <br />
              <s:fielderror/> 
            <h3>Fund Prices:</h3>
           <table class="bottomBorder">
				<col width="150">
				<col width="100">
				<col width="100">

                <tr>
                    <th>Fund Ticker</th>
                    <th>Last Price</th>
                    <th>New Price</th>
                </tr>
                <s:iterator value="fundlist" id="fund">
                <tr>
                    <td><a href="<%=basePath%>act/trade_employeeResearch.action?fund.fundId=<s:property value="#fund.fundId" />"><s:property value="#fund.symbol" /></a></td>
                    <td align="right"><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>--</s:else></td>
                    <td><input type="text" style="width: 100px" name="newPrices"/></td>
                </tr>
                </s:iterator>
                
            </table>
			<br />
                
                <span class="ButtonInput"><span align="center"><input type="submit" value="Update Transaction Day & Prices"/></span></span>
                
                       
           <br />
</form>

<jsp:include page="template-bottom.jsp" />
