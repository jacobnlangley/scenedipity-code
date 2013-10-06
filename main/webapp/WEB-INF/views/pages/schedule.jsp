<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%

%><c:choose><c:when test="${not empty user}"><%

	// --- if there's a logged in user, show the scheduling form.
	%><jsp:include page="/WEB-INF/forms/checkin_form.jspf"/><%

%></c:when><c:otherwise><%
		
	// --- otherwis, show the info regarding scheduling. 
	%><div class="message red">We've added a cool new scheduling feature!  Login to try it out.</div><%
		
%></c:otherwise></c:choose>