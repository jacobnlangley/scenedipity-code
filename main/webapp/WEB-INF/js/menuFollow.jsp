<%// Floating - fixed - title div.  Needs work ---------------------------------------------------------------v
	%>if (navigator.userAgent.indexOf('iPhone') == -1) {<%
			%>$(function () {<%
				%>var msie6 = $.browser == 'msie' && $.browser.version < 7;<%
				%>if (!msie6) {try{<%
					%>var top = $('.menuHeader').offset().top - parseFloat($('.menuHeader').css('margin-top').replace(/auto/, 0));<%
					%>$(window).scroll(function (event) {<%
						// what the y position of the scroll is
						%>var y = $(this).scrollTop();<%
						// whether that's below the form
						%>if (y >= top) {<%
							// if so, ad the fixed class
							%>if ( $('.menuHeader').is('.fiksed') ) {<%
								%>return;<%
							%>}<%
							%>$('.menuHeader').hide().addClass('fiksed').toggle();<%
							%>} else {<%
		      					// otherwise remove it
		      					%>$('.menuHeader').removeClass('fiksed');<%
		      					%>}<%
		    					%>});<%
				%>}catch(err){}}<%
				%>});<%
	%>}