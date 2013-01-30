<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="MenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />


 <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/ui/css/redmond/jquery-ui-1.9.2.custom.css" />
    <script src="js/ui/js/jquery-ui-1.9.2.custom.js"></script>
    <script type="text/javascript">
    
        $(function() {
          
          $.getJSON('<%=basePath%>ajax/ajax_findHistory.action?fundId=<s:property value="fund.fundId" />', function(data) {
                    // Create the chart
                    var json=data.historyList;
                   var series ={};
                   series.data=[];
                    $.each(json, function(key, value) {
         
                   	    series.data.push([value.time, value.price]);
                   	    
                    });
                    window.chart = new Highcharts.StockChart({
                                                             chart : {
                                                             renderTo : 'container'
                                                             },
                                                             
                                                             rangeSelector : {
                                                             selected : 1
                                                             },
                                                             
                                                             title : {
                                                             text : '<s:property value="fund.name" />'
                                                             },
                                                             series : [{
                                                 				name : '<s:property value="fund.symbol" />',
                                                 				data : series.data,
                                                 				tooltip: {
                                                 					valueDecimals: 2
                                                 				}
                                                             }],
                                                             
                                                           
                                                             });
                    });
          
          });
        
		</script>


        <h2 style="margin-bottom:10px;"><s:property value="fund.name" /> (<s:property value="fund.symbol" />)&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="fund.todayPrice" /> &nbsp;&nbsp;&nbsp;<img src="images/up.png" height="20"/>&nbsp;<span style="color:green;"><s:property value="fund.percentage" />%</span></h2>

        <p>
            
            <script src="js/highstock.js"></script>
            <script src="js/exporting.js"></script>
            <div id="container" style="height: 500px; min-width: 500px"></div>            
            
        </p>
        <p>
            <h2>Fund Description.</h2>
            <s:property value="fund.description" />
        </p>
        <p>
  
            
    

<jsp:include page="template-bottom.jsp" />