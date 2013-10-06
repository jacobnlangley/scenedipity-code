<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
%><%@ taglib prefix="scenedipity" tagdir="/WEB-INF/tags" %><%
// --- goal: 1) add subscribe if not food truck.
// --- goal: 2) show foodtrucks number of subscribed users
// --- goal: 3) if they've checked in - get them to edit their menu


// --- process URL parameters.
// indicates a single location page.
boolean unique = request.getParameter("streets")!=null ;


// --- if there's a logged in user
%><c:if test="${not empty user}"><%
	%><jsp:include page="/WEB-INF/forms/checkin_form.jspf"/><%
%></c:if><%


// --- Google Maps Canvas.
%><div id="map_canvas"><%
	// this div gets removed by javascript as location is determined.
	%><div style="margin:30% auto; text-align:center">Starting location services...</div><%
%></div><%


// --- add a link to return to all the foodtrucks.
if(unique){%><a href="/foodtrucks">">see all checked in foodtrucks</a><%}


%><div id="foodtrucks" style="float:left; clear:both"<%
	// add a class for the unique location case.
	if(unique){%> class="unique"<%}
%>><%
	
	// --- Retrieve the food truck map.
	%><c:choose><c:when test="${empty checkins}">
			<p>it's awfully quiet... doesn't look like anyone's checked in yet</p>
	</c:when><c:otherwise>
			<c:forEach items="${checkins}" var="checkin"> 
				<scenedipity:checkinSnippet checkin="${checkin}" />
			</c:forEach>
	</c:otherwise></c:choose><%
	

%></div>
