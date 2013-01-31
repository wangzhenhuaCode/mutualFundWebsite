<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

<div class="Menu">
		 <ul><li><a href="<%=basePath%>act/trade_showPosition.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="ActiveMenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="MenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

            
        <h2>Trade Our Funds</h2>
            <br />
            
            
            
            <table class="bottomBorder">
                <tr>
                    <th>Fund Ticker</th>
                    <th>Fund Name</th>
                    <th>Last Price</th>
                    <th>Change</th>
                
                </tr>
                <s:iterator value="fundlist" id="fund">
                <tr>
                    <td><a href="<%=basePath%>act/trade_gotoResearch.action?fund.fundId=<s:property value="#fund.fundId" />"><s:property value="#fund.symbol" /></a></td>
                    <td><s:property value="#fund.name" /></td>
                    <td align="right"><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>--</s:else></td>
                    <td align="right"><s:if test="#fund.percentage!=null"><s:property value="#fund.percentage" />%</s:if><s:else>--</s:else></td>
                  
                </tr>
              </s:iterator>
            </table>
            
            
            
            <br /><br />

<jsp:include page="template-bottom.jsp" />
