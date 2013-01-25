<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />
        
        
        
        <div class="Menu">

            <ul><li><a href="<%=basePath%>act/customer_login.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="MenuButton"><span>History</span></a></li></ul>

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
                   
                </tr>
                <s:iterator value="positionList" id="position">
                <tr>
                    <td><a href="<%=basePath%>act/trade_gotoResearch.action?fund.fundId=<s:property value="#position.id.fund.fundId" />"><s:property value="#position.id.fund.symbol" /></a></td>
                    <td><s:if test="#position.id.fund.todayPrice!=null"><s:property value="#position.id.fund.todayPrice" /></s:if><s:else>-</s:else></td>
                    <td><font color="red"><s:if test="#position.id.fund.percentage!=null"><s:property value="#position.id.fund.percentage" />%</s:if><s:else>-</s:else></font></td>
                    <td><s:property value="#position.currentShares" /></td>
                    
                </tr>
               </s:iterator>
            </table>
            
           <br />
        
<jsp:include page="template-bottom.jsp" />