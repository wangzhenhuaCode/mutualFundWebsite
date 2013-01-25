<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/ui/css/redmond/jquery-ui-1.9.2.custom.css" />
    <script src="js/ui/js/jquery-ui-1.9.2.custom.js"></script>
    <script type="text/javascript">
        $(function() {
          $( "#sellSlider" ).slider({
                                          range: "max",
                                          min: 0,
                                          max: <s:property value="#session.customer.currentCash" />,
                                          value: 50,
                                          slide: function( event, ui ) {
                                          $( "#sellField" ).val( ui.value );
                                          }
                                          });
          $( "#sellField" ).val( $( "#sellSlider" ).slider( "value" ) );
          
          
          $( "#buySlider" ).slider({
                                    range: "max",
                                    min: 0,
                                    max: 100,
                                    value: 50,
                                    slide: function( event, ui ) {
                                    $( "#buyField" ).val( ui.value );
                                    }
                                    });
          $( "#buyField" ).val( $( "#buySlider" ).slider( "value" ) );
          
          
          $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?', function(data) {
                    // Create the chart
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
                                                                       data : data,
                                                                       tooltip: {
                                                                       valueDecimals: 2
                                                                       }
                                                                       }]
                                                             });
                    });
          
          });
        
		</script>

    <div class="Menu">
            <ul><li><a href="#" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a class="MenuButton" href="Finance.html" ><span>Finance</span></a></li> <li><a href="History.html" class="MenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

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
            <h2>Fund Position</h2>
            <center>
            <table style="text-align:center;">
                <tr>
                    <td width="150"><b>Trasaction Time</b></td>
                    <td width="150"><b>Purchase Price</b></td>
                    <td width="150"><b>Shares</b></td>
                    <td width="150"><b>Shares</b></td>
                </tr>
                 <s:iterator value="transactionList" id="transaction">
                <tr>
                    <td ><s:property value="#transaction.executeDate" /></td>
                    <td ><s:property value="#transaction.boughtPrice" /></td>
                    <td ><s:property value="#transaction.currentShares" /></td>
                </tr>
                </s:iterator>
                
                <s:if test="transactionList.size()>0">
                <tr >
                    <td ></td>
                    <td style="padding-top:10px;"><b>Total</b></td>
                    <td style="padding-top:10px;"><s:property value="transactionList.get(0).position.currentShares" /></td>
                </tr>
                </s:if>
            </table>
                </center>
        </p>
            
        <p><h2>Profit / Loss</h2>
            
            <h2 style="color:red; margin-left:20px;"><img src="images/down.png" height="20"/>&nbsp;-320.00</h2>
            </p>
         <p><h2>Transaction</h2>
         <form method="post" action="<%=basePath%>act/trade_buy.action">
            <div id="sellDiv">
                Shares: <input type="textfield" id="sellField"/><span class="ButtonInput"><span><input type="submit" value="Sell" /></span></span>
                
                
                <br/>
                
                
                <div id="sellSlider"></div>
                
                
            </div>
           </form>
           <form method="post" action="<%=basePath%>act/trade_sell.action">
            <div id="buyDiv" style="margin-top:20px;">
                Spend: <input type="textfield" id="buyField"/> <span class="ButtonInput"><span><input type="submit" value="Buy" /></span></span>
                    
                    <div id="buySlider"></div>
                
            </div>
            </form>
            </p>
           
<jsp:include page="template-bottom.jsp" />