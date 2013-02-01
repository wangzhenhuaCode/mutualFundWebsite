<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
   
<!DOCTYPE html>

<html>
<head>
    <title>Mutual Fund Trade</title>
    <link rel="stylesheet" href="style.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>

<% 
  response.sendRedirect(basePath+"act/customer_gotoLogin.action");
%>

 </body>
 </html>