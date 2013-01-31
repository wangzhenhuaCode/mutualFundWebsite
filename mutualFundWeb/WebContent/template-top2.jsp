<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/ui/css/redmond/jquery-ui-1.9.2.custom.css" />
    <script src="js/ui/js/jquery-ui-1.9.2.custom.js"></script>
    <script>
    $(function() {
        var cache = {};
        $( "#searchBox" ).autocomplete({
          minLength: 2,
          source: function( request, response ) {
            var term = request.term;
            if ( term in cache ) {
              response( cache[ term ] );
              return;
            }
     
            $.getJSON( "ajax/ajax_autoCompleteSearch.action?keywords="+$( "#searchBox" ).val(), request, function( data, status, xhr ) {
              cache[ term ] = data.fundnameList;
              response( data.fundnameList );
            });
          }
        });
      });
  </script>
        <div class="Columns"><div class="Column1"><div class="Block">

            <span class="BlockHeader"><span>Search Fund</span></span>

            <div class="BlockContentBorderBorder"><div class="BlockContentBorderBL"><div></div></div><div class="BlockContentBorderBR"><div></div></div><div class="BlockContentBorderTL"></div><div class="BlockContentBorderTR"><div></div></div><div class="BlockContentBorderT"></div><div class="BlockContentBorderR"><div></div></div><div class="BlockContentBorderB"><div></div></div><div class="BlockContentBorderL"></div><div class="BlockContentBorderC"></div><div class="BlockContentBorder">

                <input type="text" style="width:120px" id="searchBox"/>
                <span class="ButtonInput"><span><input type="button" value="Search" /></span></span>

            </div></div>

        </div>

        <div class="Block">

            <span class="BlockHeader"><span>My Account</span></span>

            <div class="BlockContentBorderBorder"><div class="BlockContentBorderBL"><div></div></div><div class="BlockContentBorderBR"><div></div></div><div class="BlockContentBorderTL"></div><div class="BlockContentBorderTR"><div></div></div><div class="BlockContentBorderT"></div><div class="BlockContentBorderR"><div></div></div><div class="BlockContentBorderB"><div></div></div><div class="BlockContentBorderL"></div><div class="BlockContentBorderC"></div><div class="BlockContentBorder">

                <ul>
                    <li><a href="#">Change Profile</a></li>
                    <li><a href="<%=basePath%>act/customer_gotoChangePassword.action">Change Password</a></li>
                    <li><a href="<%=basePath%>act/customer_logout.action">Log out</a></li>
                </ul>

            </div></div>

        </div>

        </div><div class="MainColumn">
        <div class="ArticleBorder"><div class="ArticleBL"><div></div></div><div class="ArticleBR"><div></div></div><div class="ArticleTL"></div><div class="ArticleTR"><div></div></div><div class="ArticleT"></div><div class="ArticleR"><div></div></div><div class="ArticleB"><div></div></div><div class="ArticleL"></div><div class="ArticleC"></div><div class="Article">
        
        <br />
        
