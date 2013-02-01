<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
     <base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Mutual Fund Trade</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="BackgroundGradient"> </div>
        <div class="BodyContent">
            
            <div class="BorderBorder"><div class="BorderBL"><div></div></div><div class="BorderBR"><div></div></div><div class="BorderTL"></div><div class="BorderTR"><div></div></div><div class="BorderT"></div><div class="BorderR"><div></div></div><div class="BorderB"><div></div></div><div class="BorderL"></div><div class="BorderC"></div><div class="Border">
                
                <div class="Header">
                    <div class="HeaderTitle">
                        <h1><a href="<%=basePath%>">&nbsp;&nbsp;Mutual Fund Trade</a></h1>
                        <h2>&nbsp;&nbsp;&nbsp;Error Page</h2>
                    </div>
                </div><div class="Menu">
                    
                </div>
                
                        
                        <div style="text-align: center;">
                            <img src="images/error.png" width="840" height="400" />
                        </div>
<div><div><div><div>                        
<jsp:include page="template-bottom.jsp" />