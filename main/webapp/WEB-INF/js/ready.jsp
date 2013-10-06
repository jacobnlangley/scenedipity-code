$(document).ready(function(){<%
		%>$('.bannerRight').html($('#loginForm').html());<%
		%>$(".tabs").tabs();<%
	%>});<%
	
	
	//URL hiding for iphone  ------------------------------------------------------v
	%>if (navigator.userAgent.indexOf('iPhone') != -1) {<%
		%>addEventListener("load", function() {<%
			%>setTimeout(hideURLbar, 0);<%
		%>}, false);<%
	%>}<%
	%>function hideURLbar() {<%
		%>window.scrollTo(0, 1);<%
	%>}<%// ---------------------------------------------------------------------------^
%>