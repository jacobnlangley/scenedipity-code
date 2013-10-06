<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%

// Check for messages/errors
%><c:if test="${not empty message}"><%
	%><br/><div class="alert-message block-message message red ${messageType}"><%
	%><p>${message}</p><%
	%></div><%
%></c:if>