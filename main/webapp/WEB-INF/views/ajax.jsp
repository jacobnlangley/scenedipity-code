<%-- AJAX.JSP - the contoller used to provide asynchronous calls --%><%
%><%@include file="/views/common/i18n.jsp"%><%
%><%@ page import="scene.model.Business"%><%

try{
	// --- variable declarations
	String username="";
	try{username=(String) request.getParameter("u");}catch(Exception e){}
	
	String intent = "";
	try{intent=(String) request.getParameter("data");}catch(Exception e){}
	
	// ---trying to add a subscription (don't need to be logged in)
	if(intent.equalsIgnoreCase("subscribe")){
		%><jsp:include page="views/ajax/subscribe.jsp"  /><%
	}
	
	// --- require a logged in session for these functions
	else if(theBusiness!=null && theBusiness.getUsername().equalsIgnoreCase(username)){
		
		// --- trying to update menu----------------------------------------
		if(intent.equalsIgnoreCase("menu")){
			%><jsp:include page="views/ajax/menu.jsp"  /><%
		}//-------------------------------------------------------------------------
		
		// --- trying to schedule ----------------------------------------------
		else if(intent.equalsIgnoreCase("schedule")){
			%><jsp:include page="views/ajax/schedule.jsp"  /><%
		}//-------------------------------------------------------------------------
		
		// --- trying to redisplay schedule -------------------------------
		else if(intent.equalsIgnoreCase("generateschedule")){
			%><jsp:include page="views/pages/scheduler.jsp"  /><%
		}//-------------------------------------------------------------------------
		
		// --- trying to checkin ----------------------------------------------
		else if(intent.equalsIgnoreCase("checkin")){
			%><jsp:include page="views/ajax/checkin.jsp"  /><%
		}//-------------------------------------------------------------------------
		
		// --- trying to store a set of oauth keys for fb-----------------
		else if(intent.equalsIgnoreCase("facebook")){
			theBusiness.setFbPageId(request.getParameter("id"));
			theBusiness.setFbAcessToken(request.getParameter("at"));
			theBusiness.Update();
		}//-------------------------------------------------------------------------
			
		// --- trying to store a set of oauth keys for twitter-----------
		else if(intent.equalsIgnoreCase("twitter")){
			theBusiness.setTwitter(request.getParameter("tu"));
			theBusiness.setTwitterAccessToken(request.getParameter("to"));
			theBusiness.setTwitterAccessSecret(request.getParameter("se"));
			theBusiness.Update();
		}//-------------------------------------------------------------------------


}else{%><%}
}catch(Exception e){	%><%=e.toString()%><%} // --- End ajax session validation

/*    Anti-XSS SECURITY CONSIDERATIONS : Before returning, escape the following
		& --> &amp;
		< --> &lt;
		> --> &gt;
		" --> &quot;
		' --> &#x27;     &apos; is not recommended
		/ --> &#x2F;     forward slash is included as it helps end an HTML entity
*/

//String safe = ESAPI.encoder().encodeForHTML( request.getParameter( "input" ) );
//String safe = ESAPI.encoder().encodeForHTMLAttribute( request.getParameter( "input" ) );
//String safe = ESAPI.encoder().encodeForJavaScript( request.getParameter( "input" ) );
//String safe = ESAPI.encoder().encodeForCSS( request.getParameter( "input" ) );
//String safe = ESAPI.encoder().encodeForURL( request.getParameter( "input" ) );

%>