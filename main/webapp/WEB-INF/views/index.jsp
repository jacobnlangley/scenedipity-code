<%@ taglib prefix="scenedipity" tagdir="/WEB-INF/tags" %><%

%><!DOCTYPE html><%

%><html><%
	%><scenedipity:head /><%
	%><body><%
		%><scenedipity:toplinks/><%
		%><scenedipity:messages/><%
		%><jsp:include page="${include}"/><%
		%><scenedipity:footer/><%
	%></body><%
%></html>