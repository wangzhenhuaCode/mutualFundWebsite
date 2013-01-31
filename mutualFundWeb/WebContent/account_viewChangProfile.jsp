<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<jsp:include page="template-top.jsp" />

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/editable.js"></script>
    <script>
        $(document).ready(function() {
                          $('.edit').editable();
                          });
    </script>

		<div class="Menu">
            <ul><li><a href="<%=basePath%>act/trade_showPosition.action" class="ActiveMenuButton"><span>Home</span></a></li> <li><a href="<%=basePath%>act/trade_gotoTrade.action" class="MenuButton"><span>Trade</span></a></li> <li><a href='<%=basePath%>act/finance_financePage.action' class="MenuButton"><span>Finance</span></a></li> <li><a href="<%=basePath%>act/trade_viewHistory.action" class="MenuButton"><span>History</span></a></li></ul>
        </div>

<jsp:include page="template-top2.jsp" />
         <s:form method="post" action="act/employee_viewCustomerAccount.action" validate= "true" id="form">
         
         <s:hidden name="customer.customerId" value="%{customer.customerId}"></s:hidden>
       		
            <h2>View / Edit Profile</h2>
            <br />
			<table>
				<tr>
                    <td><b>First Name</b></td>
                    <td><b>Last Name</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.firstname"/>" name="customer.firstname" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.lastname"/>" name="customer.lastname" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				
				<tr>
                    <td><b>Address Line1</b></td>
                    <td><b>Address Line2</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.addrLine1"/>" name="customer.addrLine1" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.addrLine2"/>" name="customer.addrLine2" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				<tr>
                    <td><b>City</b></td>
                    <td><b>State</b></td>
                    <td><b>Zipcode</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.city"/>" name="customer.city" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.state"/>" name="customer.state" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
                    <td><input type="text" value="<s:property value="customer.zip"/>" name="customer.zip" style="border: 0px solid #000000; background-color: #f6f6f6;"/></td>
				</tr>
				<tr>
                    <td><b>Balance</b></td>
				</tr>
				<tr>
                    <td><input type="text" value="<s:property value="customer.cash"/>" name="customer.cash" style="border: 0px solid #000000; background-color: #f6f6f6;" disabled/></td>
				</tr>
				
			</table>
            Click field to change the value.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="ButtonInput"><span><input type="submit" value="Update" /></span></span>&nbsp;&nbsp;&nbsp;
            <a href="<%=basePath%>act/employee_viewCustomers.action" class="Button"><span>Cancel</span></a>
           	<s:fielderror/>
           </s:form>
            
<jsp:include page="template-bottom.jsp" />