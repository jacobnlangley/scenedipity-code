<%@ page import="scene.model.Business, scene.constants.Translator"%><%	
%><%@include file="i18n.jsp"%><%

%><script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script><%
%><script type="text/javascript" src="<%=Translator.toURL("js","jquery.min.js")%>" ></script><%
if(isMenu){//Display for menu
	%><script type="text/javascript" src="<%=Translator.toURL("js","jflickrfeed.min.js")%>" ></script><%
}else if(isFoodTruck || isScheduling){
	%><script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.3&sensor=true"></script><%
	%><script type="text/javascript" src="<%=Translator.toURL("js","foodtruck.js")%>"></script><%
	%><script type="text/javascript" src="<%=Translator.toURL("js","jquery.ui.js")%>"></script><%
}
		
	%><script type="text/javascript"><%
	%><%@include file="../js/ready.jsp"%><%
	
	if(isMenu){
		%><%@include file="../js/menu.jsp"%><%
		if(editing){%><%@include file="../js/menuEditing.jsp"%><%}
		else{%><%@include file="../js/menuFollow.jsp"%><%}
	
	}else if(isFoodTruck){
		%><%@include file="../js/foodtruck.jsp"%><%
	
	}else if(isLoggedIn && isScheduling){
		%><%@include file="../js/schedule.jsp"%><%
		
	}else if(isLoggedIn && (isFacebookOauth || isTwitterOauth)){
		// --- ajax call to save fb and twitter info
		%>$("#save").click(function(){<%
			%>$.ajax({<%
				%>url: "<%
				if(isFacebookOauth){//facebook's url
					%><%=Translator.toURL("a","facebook")%><%
						%>&id="+encodeURIComponent($('input[name=fbpage]:checked').attr('id'))+<%
						%>"&at="+encodeURIComponent($('input[name=fbpage]:checked').val())+<%
				}else if(isTwitterOauth){//twitter's url
					%><%=Translator.toURL("a","twitter")%><%
						%>&tu="+encodeURIComponent($('#u').html())+<%
						%>"&to="+encodeURIComponent($('#t').html())+<%
						%>"&se="+encodeURIComponent($('#s').html())+<%
				}
				%>"&u=<%=theB%>",<%
				%>cache:false,<%
				%>beforeSend:function(){$("save").fadeTo("slow",.05);},<%
				%>success:function(html){window.location='<%=Translator.toURL("oauth")%>';}<%
			%>});<%
		%>});<%
 }
%></script>