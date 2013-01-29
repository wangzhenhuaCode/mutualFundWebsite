<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
   
<!DOCTYPE html>
 <base href="<%=basePath%>">
<html>
<head>
    <title>Mutual Fund Trade</title>
    <link rel="stylesheet" href="style.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
    <div class="BackgroundGradient"> </div>
    <div class="BodyContent">

    <div class="BorderBorder"><div class="BorderBL"><div></div></div><div class="BorderBR"><div></div></div><div class="BorderTL"></div><div class="BorderTR"><div></div></div><div class="BorderT"></div><div class="BorderR"><div></div></div><div class="BorderB"><div></div></div><div class="BorderL"></div><div class="BorderC"></div><div class="Border">

        <div class="Header">
          <div class="HeaderTitle">
            <h1><a href="#">&nbsp;&nbsp;Mutual Fund Trade</a></h1>
            <h2>&nbsp;&nbsp;&nbsp;Team6</h2>
          </div>
        
            
        </div><div class="Columns"><div class="Column1"><div class="Block">

            

            <div class="BlockContentBorderBorder"><div class="BlockContentBorderBL"><div></div></div><div class="BlockContentBorderBR"><div></div></div><div class="BlockContentBorderTL"></div><div class="BlockContentBorderTR"><div></div></div><div class="BlockContentBorderT"></div><div class="BlockContentBorderR"><div></div></div><div class="BlockContentBorderB"><div></div></div><div class="BlockContentBorderL"></div><div class="BlockContentBorderC"></div>

               
                            </div></div>

        </div>

       

        </div><div class="MainColumn">
        <div class="ArticleBorder"><div class="ArticleBL"><div></div></div><div class="ArticleBR"><div></div></div><div class="ArticleTL"></div><div class="ArticleTR"><div></div></div><div class="ArticleT"></div><div class="ArticleR"><div></div></div><div class="ArticleB"><div></div></div><div class="ArticleL"></div><div class="ArticleC"></div>
        <div class="Article">
        <h2 style="margin-left:240px;">Login</h2>
        <br />

        <form method="post" action="<%=basePath%>act/employee_login.action" id="form">

		<table border="0" style="line-width: 60px; line-height: 30px; padding-left: 10px;" align="center">
			<col width="100">
			<col width="250">
			<div class="name">
				<tr>
					<td><strong>User Name:</strong></td>
					<td><input type="text"  name="username"
						style="width: 200px" /></td>
				</tr>
			</div>
			<div class="inputName">
				<tr>
				<td><strong>Password:</strong></td>
				<td><input type="text" name="password" style="width: 200px" />
					</td>
				</tr>
			</div>
			<tr>
			<td>
					<input type="radio" name="type" onclick="javascript:$('#form').attr('action','<%=basePath%>act/customer_login.action');">Customer  
			</td>
			<td>	
					<input type="radio" name="type" onclick="javascript:$('#form').attr('action','<%=basePath%>act/employee_login.action');" checked>Employee  
			</td>
			</tr>
		</table>

		
		
       <div align = "right" style="margin-right:250px;">
            <span class="ButtonInput"><span align="center"><input type="submit" value="Login"/></span></span>
		</div>
		</form>

        <div>        

<jsp:include page="template-bottom.jsp" />
