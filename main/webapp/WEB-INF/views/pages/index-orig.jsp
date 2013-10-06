<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
%><%@ taglib prefix="scenedipity" tagdir="/WEB-INF/tags" %><%

%><c:choose><c:when test="${empty page}"><%

		// --- display an error message when nothing is returned from the database.
		%><p>Scenedipity doesn't have any restaurants'</p><%
		%><h2><a href="new">Setup a System</a></h2><%
	
	%></c:when><c:otherwise><c:forEach items="${page.rows}" var="restaurant"><%
	
		// --- show the snippets for each of the restaurant menus.
		%><scenedipity:restaurantSnippet restaurant="${restaurant}" /><%

%></c:forEach>	</c:otherwise></c:choose>