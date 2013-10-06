<jsp:useBean id="clock" class="scene.tools.JspCalendar" /><%
 %><%@ page import="scene.tools.DataBaseAccessWeb, java.sql.Timestamp, java.text.SimpleDateFormat"%><%		
%><%@include file="/views/common/i18n.jsp"%><%
	
try{	//  --- storing checkin to the database
	    java.util.Date date = new SimpleDateFormat("yyyyMMddHHmm").parse(request.getParameter("d")); 
	    
		%><%=DataBaseAccessWeb.scheduleFoodtruck(
			Integer.parseInt(request.getParameter("s")),
			request.getParameter("i"),
			request.getParameter("lat"),
			request.getParameter("lon"),
			request.getParameter("m").toString(),
			new Timestamp(date.getTime()),
			request.getParameter("a")
			)%><%
			
	}catch(Exception e){%>failed to schedule...<%=e.toString() + " " +request.getParameter("d")%><%}

	// --- update the schedule file for the business.
	theBusiness.setEvents(DataBaseAccessWeb.getSchedule(theBusiness.getId()+""));
	session.setAttribute("theBusiness", theBusiness);
%>