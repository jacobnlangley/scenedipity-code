$("[class^=tweet_last]").css("display","none");<%
		%>var count=1;<%
		%>$(".moreTweets").click(function(){$(".tweet_last"+count).toggle(); count++});<%

		// Image Functionality --------------------------------------------------------------------------------v
		%>function show(s){$("#large").show().attr("src",s.replace("_t.jpg",".jpg"));}<%
		// --- Have the client retrieve social tags on flickr
		%>$(document).ready(function(){<%
			%>$('#social').jflickrfeed({<%
				%>limit: 4,<%
				%>qstrings: {<%
					%>tags: '<%=theM%>'<%
				%>},<%
				%>itemTemplate: '<li><img onclick="show(\'{{image_t}}\')" class="pic" src="{{image_t}}" alt="{{title}}" /></li>'<%
			%>});<%
			// --- loading into viewport
			%>$(".pic").click(function(){show(this.src)});<%
			%>});<%
			// end Image Functionality ----------------------------------------------------------------------------^
%>