<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

		<div class="Menu">

            <ul><li><a href="<%=basePath%>act/trade_showPosition.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="MenuButton"><span>History</span></a></li></ul>

        </div>

<jsp:include page="template-top2.jsp" />

		<s:form method="post" action="act/customer_changePassword.action" validate = "true" id="form">
        <h2 >Reset Your Password </h2>
		<s:hidden name="customer.customerId" value="%{customer.customerId}"></s:hidden>
            <br />
		<table >
			<col width="150">
			<col width="250">
			<div class="name">
				<tr>
					<td><strong>New Password:</strong></td>
					<td><input type="password" name="newCustomerPassword"
						style="width: 200px" /></td>
				</tr>
			</div>
			<div class="inputName">
				<tr>
				<td><strong>Confirm Password:</strong></td>
				<td><input type="password" name="confirmCustomerPassword" style="width: 200px" />
					</td>
				</tr>
			</div>
		</table>
       <div align = "right" style="margin-right:280px;">
            <span class="ButtonInput"><span align="center"><input type="submit" value="Reset"/></span></span>
           <a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
		</div>
		<s:fielderror/>
		</s:form>
       
<jsp:include page="template-bottom.jsp" />
