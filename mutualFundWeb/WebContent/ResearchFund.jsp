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
    
        $(function() {<s:if test="position.shares>0" > 
          $( "#sellSlider" ).slider({
                                          range: "max",
                                          min: 0,
                                          max:  <s:property value="position.currentShares" />,
                                          value: 0,
                                          slide: function( event, ui ) {
                                          $( "#sellField" ).val( ui.value );
                                          }
                                          });
          $( "#sellField" ).val( $( "#sellSlider" ).slider( "value" ) );
     </s:if>     
     <s:if test="#session.customer.cash>0" >     
          $( "#buySlider" ).slider({
                                    range: "max",
                                    min: 0,
                                    max: <s:property value="#session.customer.currentCash" />,
                                    value: 0,
                                    slide: function( event, ui ) {
                                    $( "#buyField" ).val( ui.value );
                                    }
                                    });
          $( "#buyField" ).val( $( "#buySlider" ).slider( "value" ) );
          </s:if>
          
          $.getJSON('<%=basePath%>ajax/ajax_getHistory.action?fundId=<s:property value="fund.fundId" />', function(data) {
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

    <div class="Menu">
            <ul><li><a href="<%=basePath%>act/customer_login.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="ActiveMenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="History.html" class="MenuButton"><span>History</span></a></li></ul>
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
                    <td ><b>Trasaction Time</b></td>
                    <td ><b>Purchase Price</b></td>
                    <td ><b>Shares</b></td>
                    <td ><b>Amount</b></td>
                    <td ><b>Status</b></td>
                </tr>
                 <s:iterator value="transactionList" id="transaction">
                <tr>
                    <td ><s:property value="#transaction.currentDate" /></td>
                    <td ><s:property value="#transaction.boughtPrice" /></td>
                    <td ><s:property value="#transaction.currentShares" /></td>
                    <td ><s:property value="#transaction.currentAmount" /></td>
                    <td ><s:if test="#transaction.transactionType==1">Sold</s:if>
                    <s:if test="#transaction.transactionType==2">Pending Sell</s:if>
                    <s:if test="#transaction.transactionType==3">Bought</s:if>
                    <s:if test="#transaction.transactionType==4">Pending Buy</s:if>
                    </td>
                </tr>
                </s:iterator>
                
                <s:if test="transactionList.size()>0">
                <tr >
                    <td ></td>
                    
                    <td style="padding-top:10px;"><b>Position</b></td>
                    <td style="padding-top:10px;"><s:property value="position.currentShares" /></td>
                	<td></td>
                	<td></td>
                </tr>
                </s:if>
            </table>
                </center>
        </p>
            
      <!--    <p><h2>Profit / Loss</h2>
            
            <h2 style="color:red; margin-left:20px;"><img src="images/down.png" height="20"/>&nbsp;-320.00</h2>
            </p>-->
         <p><h2>Transaction</h2>
         <s:if test="position.shares>0" > 
         <form method="post" action="<%=basePath%>act/trade_sell.action?fund.fundId=<s:property value="fund.fundId" />">
            <div id="sellDiv">
                Shares: <input type="textfield" id="sellField" name="shares"/><span class="ButtonInput"><span><input type="submit" value="Sell" /></span></span>
                
                
                <br/>
                
                
                <div id="sellSlider"></div>
                
                
            </div>
           </form>
           </s:if>
            <s:if test="#session.customer.cash>0" > 
           <form method="post" action="<%=basePath%>act/trade_buy.action?fund.fundId=<s:property value="fund.fundId" />">
            <div id="buyDiv" style="margin-top:20px;">
                Spend: <input type="textfield" id="buyField" name="amount"/> <span class="ButtonInput"><span><input type="submit" value="Buy" /></span></span>
                    
                    <div id="buySlider"></div>
                
            </div>
            </form>
            </s:if>
            </p>
           
<jsp:include page="template-bottom.jsp" />
