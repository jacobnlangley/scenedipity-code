var map;<%
				
				%>$(document).bind('draw', function() {<%
					%>$('#map_canvas').jMapping({<%
						%>category_icon_options: {<%
				      %>'Food': {color: '#ede8de'},<%
				      %>'loc':new google.maps.MarkerImage(<%
				      		%>'http://scenedipity.com/style/blue_dot_circle.png',<%
								%>new google.maps.Size(38, 38),<% 	// size
								%>new google.maps.Point(0, 0), <%		// origin
								%>new google.maps.Point(19, 19)<%	// anchor
						%>),<%
				      %>'me': {color: '#0a9cf3'},<%
				      %>'default': {color: '#0F06C5'}<%
				    	%>},<%
					   %>side_bar_selector: '#foodtrucks:first',<%
					   %>location_selector: '.foodtruck',<%
					   %>link_selector: 'a.map-link',<%
						%>info_window_selector: '.foodtruckInfo'<%
					%>});<%					
					%>$('#me').html($('#location').html());<%
					
					//Useful links:--------------------------------------------------------------------------------------------------------------------
					// http://code.google.com/apis/maps/documentation/javascript/reference.html#Marker
					// http://code.google.com/apis/maps/documentation/javascript/services.html#Geocoding
					// http://jqueryui.com/demos/autocomplete/#remote-with-cache
					%>var geocoder;<%
					        
					  //GEOCODER
					  %>geocoder = new google.maps.Geocoder();<%
					         								  
					  %>$(function() {<%
					    %>$(".address").autocomplete({<%
					      //This bit uses the geocoder to fetch address values
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
			 				%>$("#me").attr("data-jmapping","{ id: 0, point: {lat: "+ui.item.latitude+", lng: "+ui.item.longitude+"}, category: 'loc'}");<%
			 				%>$("#lat").val(ui.item.latitude);<%
			 				%>$("#lon").val(ui.item.longitude);<%
							%>$('#map_canvas').jMapping('update');<%
						%>}<%
				 	  %> });<%
				%>});<%//-------------------------------------------------------------------------------------------------------------------------
					
				%>});<% // end call to draw
			
				%>$(document).ready(function(){<%
					%>$('.foodtruck:nth-child(3n+2)').addClass("m");<%
					%>$.each($('.container'),function(){$(this).parent().append($('<div class="foodtruckInfo"></div>').html($(this).clone().attr("class","foodtruckc")));});<%
					%>initialize();<%
				%>});<%// end document.ready()
				
				%>function initialize(){<%
					%>if (navigator.geolocation){<%
						%>navigator.geolocation.getCurrentPosition(<% 
					 		%>function(position){<%
					 		%>latitude = position.coords.latitude;<%
                   			%>longitude = position.coords.longitude;<%
                    		
                   			// --- ADDING THE SUBSCRIPTION FORM!!!!!!!!!!!!!
                    		%>var text = "";<%
                    		if( false){ //!isLoggedIn &&
    	            			%>text =$('#subscriptionForm').html();<%
    	                    }
                    		
		                    %>$('.foodtruck').first().before('<%
		                    %><div id="me" class="green foodtruck" style="height:100%"">'+text+'<%
		                			%><div class="container"></div><%
		                		%></div><%
								%>');<%
			 				%>$("#me").attr("data-jmapping","{ id: 0, point: {lat: "+latitude+", lng: "+longitude+"}, category: 'loc'}");<%
			 				%>$.each(<%
			 						%>$(".nav-link"),function(){<%
			 							%>$(this).attr("href",$(this).attr("href").replace("###",latitude+","+longitude));<%
		 							%>}<%
 							%>);<%
			 				%>try{<%
			 				%>$("#lat").val(latitude);<%
			 				%>$("#lon").val(longitude);<%
			 				%>}catch(err){}<%
							%>$(document).trigger('draw');<%
							%>},<% 
							// next function is the error callback
							%>function (error){<%
								%>var error;<%
								%>switch(error.code){<%
									%>case error.TIMEOUT:<%
										%>error='Sorry it\'s taking too long to try and find your location...';<%
										%>break;<%
									%>case error.POSITION_UNAVAILABLE:<%
										%>error='Sorry, this browser either doesn\'t support geolocation or your gps isn\'t turned on.';<%
										%>break;<%
									%>case error.PERMISSION_DENIED:<%
										%>error='We weren\'t allowed to get your exact location, please check your permission settings if this device has GPS';<%
										%>break;<%
									%>case error.UNKNOWN_ERROR:<%
										%>error='Sorry, i have no clue why this wouldn\'t work.';<%
										%>break;<%
								%>}<%
								  %>$('#foodtrucks').before('<%
					                        %><div id="me" class="foodtruck red">'+error+'<%
					                    		%></div><%
									%>');<%
					 				%>$.each(<%
					 						%>$(".nav-link"),function(){<%
					 							%>$(this).attr("href",$(this).attr("href").replace("saddr=###&",""));<%
				 							%>}<%
		 							%>);<%
								%>$(document).trigger('draw');<%
							%>},<%
							%>{<%
							    %>enableHighAccuracy: true,<%
							   	%>maximumAge:300000<%
							  %>}<%
							%>);<%
						%>}else{}<%
						%>}<%// end initialize()
						
						
if(false){ 
	// --- ajax call to checkin
	%>$("#checkin").click(function(){<%
		%>$.ajax({<%//&u=<%=theB% >&i=<%=theBid% >
			%>url: "/a/checkin&lon="+encodeURIComponent($('#lon').val())+"&lat="+encodeURIComponent($('#lat').val())+"&m="+encodeURIComponent($('#text').val()),<%
			%>cache:false,<%
			%>beforeSend:function(){<%
				%>if(confirm('Submit check in with the following: "'+$('#text').val()+'"?')){<%
				%>$("body").fadeTo("slow",.05);<%
				%>}else{return false;}<%
			%>},<%
			%>error:function(){<%
				%>$("body").fadeTo("slow",1);<%
			%>},<%
			%>success:function(html){<%
				%>alert("succesfully checked in: "+html);<%
				%>$(".me").attr("data-jmapping","{ id: 0, point: {lat: "+$('#lat').val()+", lng: "+$('#lon').val()+"}, category: 'me'}");<%
				%>$('#map_canvas').jMapping('update');<%
				%>$("body").fadeTo("slow",1);<%
			%>}<%
		%>});<%
	%>});<%
}// --- end logged in check
%>