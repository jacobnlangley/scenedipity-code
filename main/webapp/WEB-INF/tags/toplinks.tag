<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
%><%@ attribute name="who" required="false" type="java.lang.String" %><%

%><div class="navbar navbar-fixed-top"><%   
    %><div class="navbar-inner"><%
      %><div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <span class="brand logo-margin">login</span>
         <div class="nav-collapse logo-margin" ><%
            %><ul class="nav ">
              <li><%
              %><div class="city">${who}'s</div><div><%
				%><a style="color:#0fa6c5; font-size:4.5em;font-family: Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif;" href="/">scenedipity<%
						%><font style="font-size:x-small; font-family:open sans; font-weight:normal">TM</font></a><%
	%></div><%
              %></li>
			  <li><%%><div class="bannerRight"></div><%%></li>
            </ul><%
          %><div></div><%
        %></div><%
      %></div><%
    %></div><%
       %></div><%

// --- Banner Left & Logo -----------------------------------------------------------------------------
%><div class="container"><%
	%><div class="row"><%
 		%><div class="span7 toplinks img"><div class="city">${who}'s</div><div class="theScene"><%
			%><h1 class="theScene"><%
				%><a href="/">scenedipity<%
						%><font style="font-size:x-small; font-family:open sans; font-weight:normal">TM</font><%
				%></a><%
				%></h1><%
			%></div><%
	%></div><%
 		%><div class="span5"><%
 			%><div class="subnav"><%
  				%><scenedipity:index_navigation /><%
				%></div><%
	%></div><%         
%></div><%
%></div><%

%><div class="container"><% 
	%><div class="row"><% 
 		 %><div class="span12 spacer"><% %></div><%           
	%></div><% 
%></div><% // --- end toplinks
%>
