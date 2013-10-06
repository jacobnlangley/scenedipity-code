waiting on confirmation...<%	

// --- need to find max/day
// --- texts by distance
// --- number of checkins
try{// --- send out text messages
	%><%TwilioAPI.message(
	"hi, just confirming recent txt subscription: 4/day | w/in 10 miles | all foodtrucks. please reply \"yes\" to confirm and save." , 
	"Scenedipity", // ---  username
	"scndp.it/terms" // ---  url
	);%><%
}catch(Exception e){
	%>failed sending texts<%
}%>	