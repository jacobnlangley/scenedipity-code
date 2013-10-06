<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %><%
%><%@ attribute name="checkin" required="true" type="scenedipity.model.FoodTruckCheckin" %><%

// --- parameter caching
double lat = checkin.getGeometry().getCoordinates().get(0);
double lng = checkin.getGeometry().getCoordinates().get(1);

%><div	class='foodtruck'  <%
			%>data-jmapping="{
			id: 1, 
			point: {lat: <%=lat %>, lng:<%=lng %>},
			category: 'Food'
		}"
><%

	%><div class="container"><%
		%><div class="snippet"><%
		
		// --- foodtruck avatar.
		%><a href="#" class="map-link"<%
					%>alt="show ${checkin.foodtruckID} on the map"><%
						%><img class='photo' src='' /><%
			%></a><%
			
			// --- food truck name and bio.
			%><a href="#" class="map-link"<% 
					%> alt="show  ${checkin.foodtruckID} on the map"><%
						%><span class="fn org"> ${checkin.foodtruckID} </span><%
			%></a><%
			
			// --- foodtrukc checkin info.
			%><div class='announcement'>${checkin.announcement}</div><%
		
		%></div><%// end snippet
	%></div><% // end of the container div

	// --- additional links.
	%><ul class="snippetInfo"><%
		%><a href="/EatBoxFoodTruck" alt="see the menu for TheLowdownFoodTruck">menu</a><%
		%><a href="#5" class="map-link" alt="show TheLowdownFoodTruck on the map">map</a><%
		%><a href="https://maps.google.com/maps?saddr=###&amp;daddr=<%=lat%>,<%=lng%>" class="nav-link" alt="get directions to TheLowdownFoodTruck from your current location">navigate</a><%
		%><font class="checkin">checked in: <font class="time">${checkin.checkin}</font></font><%
	%></ul><%


%></div><%// --- end of the foodtruck div %>