<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>act/trade_employeeGotoTrade.action" class="ActiveMenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="employee_template-top2.jsp" />

            <h2>Fund Listed:</h2>
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
                    <td><a href="<%=basePath%>act/trade_employeeResearch.action?fund.fundId=<s:property value="#fund.fundId" />"><s:property value="#fund.symbol" /></a></td>
                    <td><s:property value="#fund.name" /></td>

                    <td align="right"><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>N/A</s:else></td>
                    <td align="right"><s:if test="#fund.percentage!=null"><s:property value="#fund.percentage" />%</s:if><s:else>N/A</s:else></td>

                </tr>
                </s:iterator>
               
                
            </table>

            
            <br />
            
            <s:form method="post" action="/act/trade_employeeCreate.action" validate="true">
                
                <table>
                    <tr>
                        <td>
                            Fund Ticker
                        </td>
                        <td>
                            Fund Name
                        </td>
                        
                    </tr>
                    <tr> 
                        <td>
                            <input type="text" maxlength="255" name="fund.symbol" />
                        </td>
                        <td>
                            <input type="text" maxlength="255" name="fund.name"/>
                        </td>
                        
                    </tr>
                    <tr>
                    <td>
                    Fund Description
                    </td>
                    </tr>
                </table>
                
                <textArea rows="3" cols="48" name="fund.description"></textArea><br />
                <br />
                <span class="ButtonInput"><span><input type="submit" value="Add New Fund" /></span></span>
                <s:fielderror/>
            </s:form>
            

<jsp:include page="template-bottom.jsp" />
