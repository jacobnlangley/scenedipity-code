<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
%><%@ attribute name="who" required="false" type="java.lang.String" %><%

%><div class="container"><%   
    %><div class="navbar navbar-fixed-top"><%
      %><div class="navbar-inner"><%
        %><div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <span class="brand">menu</span>
         <div class="nav-collapse"><%
            %><ul class="nav">
              <li>
                <a href="/">home</a>
              </li>
              <li>
                <a href="/find-food.jsp">find food</a>
              </li>
              <li class="">
                <a href="/feed-the-masses.jsp">feed the masses</a>
              </li>
              <li class="">
                <a href="/how-scenedipity-works.jsp">how it works</a>
              </li>
              <li class="">
                <a href="/local-business.jsp">businesses</a>
              </li>
              <li class="">
                <a href="/web-services.jsp">let us help</a>
              </li>
            </ul><%
          %><div><%%><div class="bannerRight"></div><%%></div><%
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
  				%><ul class="nav nav-pills">
					<li><a href="/streets" class="">Foodtrucks</a></li>
					<li><a href="/">Restaurants</a></li>
            		<li><a href="#"> Twitter</a></li>
      				<li><a href="#">Facebook</a></li>
            		<li><a href="#">Blog</a></li>
          		</ul><%
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
