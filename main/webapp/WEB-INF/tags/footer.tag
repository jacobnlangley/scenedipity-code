<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%

%><div class="container"><%
	%><div class="row"><%
  %><div class="span12 footer"><%
	%><ul><%		
			%><li>&copy; 2012 Scenedipity</li><%
			%><li><a href="/about-us" rel="me" > about </a></li><%
			%><li><a href="http://blog.scenedipity.com" rel="me" >blog</a></li><%
			%><li><a href="http://data.scenedipity.com" rel="me" > developers </a></li><%
			%><li><a href="/privacy" rel="me" > privacy</a></li><%
			%><li><a href="/products-offered" rel="me" > products</a></li><%
			%><li><a href="http://scndp.it" rel="me" > scndp.it </a></li><%
			%><li><a href="/terms-of-service" rel="me"> terms </a></li><%
			//><li><a> art </a></li><%
			//><li><a> business </a></li><%
		%></ul><%
%></div><%
%></div><%
%></div>


<%

// --- include common js libs
%><script type="text/javascript" src="/resources/scripts/jquery.js"></script><%
%><script type="text/javascript" src="/resources/scripts/socket.io.js"></script><%

// --- include the login form for every page
%><jsp:include page="/WEB-INF/forms/login_form.jspf"/><%

// --- include 'location not right?' form for streets
%><c:if test="${include == 'pages/foodtrucks.jsp'}"><%
	%><jsp:include page="/WEB-INF/forms/foodtruck_forms.jspf"/><%
%></c:if><%

// --- include js to place above forms in right place.
%><script type="text/javascript"><%
	%><jsp:include page="/WEB-INF/js/ready.jsp"/><%
%></script><%


	%><script type="text/javascript" src="/resources/scripts/jquery.ui.js"></script><%
	%><script type="text/javascript" src="/resources/scripts/bootstrap.min.js"></script><%
	%>    <script type="text/javascript" src="http://twitter.github.com/bootstrap/1.4.0/bootstrap-tabs.js"></script><%
	%><script type="text/javascript" src="/resources/scripts/bootstrap-modal.js"></script><%
		
// --- include javascript required for foodtrucks.
%><c:if test="${include == 'pages/foodtrucks.jsp'}"><%
	%><script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=true"></script><%
	%><script type="text/javascript" src="/resources/scripts/map.js"></script><%
	%><script type="text/javascript"><jsp:include page="/WEB-INF/js/foodtrucks.jsp"/></script><%
%></c:if>