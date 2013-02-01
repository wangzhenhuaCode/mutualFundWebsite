<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">

<!DOCTYPE html>
<html>
<head>
    <title>&nbsp;&nbsp;Mutual Fund Trade</title>
    <link rel="stylesheet" href="style.css" />
    <style type="text/css">
                table.bottomBorder { border-collapse:collapse; }
                table.bottomBorder td, table.bottomBorder th { border-bottom:1px dotted black;padding:5px; }
    </style>
</head>
<body>
    <div class="BackgroundGradient"> </div>
    <div class="BodyContent">

    <div class="BorderBorder"><div class="BorderBL"><div></div></div><div class="BorderBR"><div></div></div><div class="BorderTL"></div><div class="BorderTR"><div></div></div><div class="BorderT"></div><div class="BorderR"><div></div></div><div class="BorderB"><div></div></div><div class="BorderL"></div><div class="BorderC"></div><div class="Border">

        <div class="Header">
          <div class="HeaderTitle">
            <h1><a href="<%=basePath%>act/transaction_gotoTrans.action">&nbsp;&nbsp;Mutual Fund Trade</a></h1>
            <h2>&nbsp;&nbsp;&nbsp;Administrator</h2>
            
          </div>
        </div>
            

