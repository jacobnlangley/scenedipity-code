 <%@ page import="scene.tools.SceneSocialMediaAPI"%><%		
 %><%@include file="/views/common/i18n.jsp"%><%

try{ 
	String tToken = null;
	String tSecret = null;
	try{
		tToken=theBusiness.getTwitterAccessToken().trim();
		tSecret=theBusiness.getTwitterAccessSecret().trim();
	}catch(Exception e){}
	
	
	SceneSocialMediaAPI.SendOut(
			theBusiness.getUsername(),
			theBusiness.getId()+"",
			request.getParameter("m").toString(),
			request.getParameter("lat"),
			request.getParameter("lon"),
			theBusiness.getFbAccessToken(),
			theBusiness.getFbPageId(),
			tToken,
			tSecret,
			true
		);
	}catch(Exception e){%><%=e.toString()%><%}
	
%>