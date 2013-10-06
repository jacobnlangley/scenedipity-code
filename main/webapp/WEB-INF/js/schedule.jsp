<%//Useful links:--------------------------------------------------------------------------------------------------------------------
// http://code.google.com/apis/maps/documentation/javascript/reference.html#Marker
// http://code.google.com/apis/maps/documentation/javascript/services.html#Geocoding
// http://jqueryui.com/demos/autocomplete/#remote-with-cache
%>var geocoder;<%
        
  //GEOCODER
  %>geocoder = new google.maps.Geocoder();<%
         								  
//This bit uses the geocoder to fetch address values
  %>$(function() {<%
    %>$(".address").autocomplete({<%
      %>source: function(request, response) {<%
        %>geocoder.geocode( {'address': request.term + ', us' }, function(results, status) {<%
          %>response($.map(results, function(item) {<%
            %>return {<%
              %>label:  item.formatted_address,<%
              %>value: item.formatted_address,<%
              %>latitude: item.geometry.location.lat(),<%
              %>longitude: item.geometry.location.lng()<%
            %>}<%
          %>}));<%
        %>})<%
      %>},<%
     
      //This bit is executed upon selection of an address
    	 %>select: function(event, ui) {<%
			%>$("#lat").val(ui.item.latitude);<%
			%>$("#lon").val(ui.item.longitude);<%
			%>$("#addr").css("border-color","green");<%
			%>$("#addr").css("-webkit-box-shadow","0px 0px 6px green");<%  
			%>$("#addr").css("-moz-box-shadow","0px 0px 5px green");<%
			%>$("#addr").css("box-shadow","0px 0px 5px green");<%
			%>$("#schedule").removeAttr('disabled').text("schedule checkin");<%
	%>}<%
 %> });<%
%>});<%
// end geocoding-----------------------------------------------------------------------------------


// --- ajax call to schedule ---------------------------------------------------------
%>$("#schedule").click(function(){<%
	%>if($('#text').val()!=""){<%
	%>$.ajax({<%
		%>url: "<%=Translator.toURL("a","schedule")%><%
			%>&u=<%=theB%><% 															//username
			%>&i=<%=theBid%><% 															//userID
			%>&s=1<% 																				//scheduling status (1=add)
			%>&lon="+encodeURIComponent($('#lon').val())+<%
			%>"&lat="+encodeURIComponent($('#lat').val())+<%
			%>"&m="+encodeURIComponent($('#text').val())+<% 	//message
			%>"&d="+$('#date').val()+$('#hour').val()+<% 					//date construct
			%>"&a="+encodeURIComponent($('#addr').val()),<%		//address
		%>cache:false,<%
		%>error:function(){},<%
		%>success:function(html){<%			
			// --- ajax used to refresh calendar w/ current events updated.
			%>$.ajax({<%
				%>url: "<%=Translator.toURL("a","generateSchedule")%>&u=<%=theB%>",<%
				%>cache:false,<%
				%>error:function(){},<%
				%>success:function(html){<%
					%>$("#calendar").replaceWith(html);<%
				%>},<%
				%>complete:function(){attachDeletes();}<%
			%>});<%  // --- end calendar refresh ajax
			%>$('#lon').val("");<%
			%>$('#lat').val("");<%
			%>$('#text').val("");<%
			%>$('#addr').val("");<%
		%>}<%
	%>});<%
	%>}else{alert("announcements can't be left blank");}<%
%>});<% // --- end schedule----------------------------------------------------


// --- ajax call to delete ---------------------------------------------------------
%>function attachDeletes(){<%
%>$(".delete").click(function(){<%
	%>var id=$(this).attr("id");<%
	%>$.ajax({<%
		%>url: "<%=Translator.toURL("a","schedule")%><%
			%>&u=<%=theB%><% 															//username
			%>&i="+id+"<% 																		//Event ID
			%>&s=-1<% 																			//scheduling status (-1=delete)
			%>&lon="+encodeURIComponent($('#lon').val())+<%
			%>"&lat="+encodeURIComponent($('#lat').val())+<%
			%>"&m="+encodeURIComponent($('#text').val())+<% 	//message
			%>"&d="+$('#date').val()+$('#hour').val()+<% 					//date construct
			%>"&a="+encodeURIComponent($('#addr').val()),<% 	//address
		%>cache:false,<%
		%>error:function(){},<%
		%>success:function(html){<%
			%>$("#event-"+id).html("Event deleted...  "+html);<%
			%>$("#event-"+id).addClass("message red");<%
		%>}<%
	%>});<%
%>});<%
%>} attachDeletes();<%// --- end delete--------------------------------------------------------

%>$("#addr").keyup(function(){<%
	%>$("#clear").css("display","inline");<%
	%>$(this).css("border-color","red")<%
	%>.css("-webkit-box-shadow","0px 0px 6px red")<%  
	%>.css("-moz-box-shadow","0px 0px 5px red")<%
	%>.css("box-shadow","0px 0px 5px red");<%
	%>$("#schedule").attr('disabled', 'disabled')<%
	%>.text("please select a location from the dropdown");<%
%>});<%

%>$("#clear").click(function(){<%
	%>$(this).css("display","none");<%
	%>$("#schedule").removeAttr('disabled')<%
	%>.text("schedule");<%
	%>$('#lon').val("");<%
	%>$('#lat').val("");<%
	%>$('#text').val("");<%
	%>$('#addr').val("")<%
	%>.css("border-color","white")<%
	%>.css("-webkit-box-shadow","0px 0px 6px white")<%  
	%>.css("-moz-box-shadow","0px 0px 5px white")<%
	%>.css("box-shadow","0px 0px 5px white");<%
%>});<%
				
// --- ToDo: ajax call to update----------------------------------------------
//    - step0: populate all the fields w/ info, remove add button, add update/cancel
//    - define update.click (easy)
//    - define cancel.click - clear all the fields, remove "update/cancel", add "add"
// --- end update ---------------------------------------------------------------
%>