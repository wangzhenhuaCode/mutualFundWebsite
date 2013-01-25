<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="employee_template-top.jsp" />

<div class="Menu">
            <ul><li><a href="<%=basePath%>act/transaction_gotoTrans.action" class="MenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/employee_viewCustomers.action" class="MenuButton"><span>Account Management</span></a></li> <li><a href="<%=basePath%>/act/trade_employeeGotoTrade.action" class="ActiveMenuButton"><span>Fund Management</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />

            <h2>Fund Listed:</h2>
            
            <table class="bottomBorder">
                
                
                
                <tr>
                    <th>Fund Ticker</th>
                    <th>Fund Name</th>
                    <th>Last Price</th>
                    <th>Change</th>
                   
                   
                </tr>
               
                <s:iterator value="fundlist" id="fund">
                <tr>
                    <td><s:property value="#fund.symbol" /></td>
                    <td><s:property value="#fund.name" /></td>
                    <td><s:if test="#fund.todayPrice!=null"><s:property value="#fund.todayPrice" /></s:if><s:else>N/A</s:else></td>
                    <td><font color="red"><s:if test="#fund.percentage!=null"><s:property value="#fund.percentage" />%</s:if><s:else>N/A</s:else></font></td>
                </tr>
                </s:iterator>
               
                
            </table>

            
            <br />
            
            <form method="post" action="<%=basePath%>/act/trade_create.action">
                
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
                </table>
                Fund Description<br/>
                <textArea width="500" height="300" name="fund.description"></textArea><br/>
                <span class="ButtonInput"><span><input type="submit" value="Add New Fund" /></span></span>
                
            </form>
            

<jsp:include page="template-bottom.jsp" />