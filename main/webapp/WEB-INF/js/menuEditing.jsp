<%// editing Functions ------------------------------------------------------------------------------------v
		
			// --- switching b/w collapsed and condensed views----v
			%>$(".static").click(function(){<%
					%>$(this).hide()<% 
						%>.next().show();<%
			%>});<%
			
			
			// --- finished editing-------------------------------v
			%>$("a.finish").click( function(){<%
					%>$(this).parent().parent().hide()<%
						%>.prev().show();<%
				%>});<%
				
				
			// --- deleteing an item ----------------------------v
			%>$("a.delete").click( function(){<%
				// id of the element being deleted
				%>var i = $(this).attr("id");<%
				%>$(this).parent().parent().parent().remove();<%
				%>$.ajax({<%
	 				%>url: "<%=Translator.toURL("a","menu")%>&u=<%=theB%>&r=dE&v="+i,<%
	             	%>cache:false,<%
					%>beforeSend:function(){},<%
	            	 %>success:function(){}<%
				%>});<%
			%>});<%
			
			
			// --- inserting a new item--------------------------v
				%>var additions = 0;<%
				%>$("a.insert").click( function(){<%
					%>var temp=$("#template").clone(true);<%
					%>temp.show();temp.attr("id","");<%
					%>updateItem(temp,"-"+this.id+additions);<%
					%>additions=additions+""+"0";<%
					%>$(this).parent().before(temp);<%
				%>});<%
				%>$("a.insertCourse").click(function(){<%
					%>var temp=$("#courseTemplate").clone(true);<%
					%>temp.show();temp.attr("id","");<%
					%>updateCourse(temp,"-"+this.id+"-"+additions);<%
					%>additions=additions+""+"0";<%
					%>$(this).parent().before(temp);<%
				%>});<%
			
				
			// --- updating an id after insertions -----------------v
			// --- menuItem, replacingID
			%>function updateItem(m,r){<%
				%>m.find(":input.i").attr("id","iSize"+r);<%
				%>m.find(":input.i.S").attr("id","iSizeS"+r);<%
				%>m.find(":input.L").attr("id","iSizeL"+r);<%
				%>m.find(":input.i.XL").attr("id","iSizeXL"+r);<%
				%>m.find(":input.itemName.i").attr("id","iN"+r);<%
				%>m.find(":input.itemDescription.i").attr("id","iDe"+r);<%
			%>}<%
			
			%>function updateCourse(m,r){<%
				%>m.find(":input.c.i").attr("id","cT"+r);<%
				%>m.find(":input.cD.i").attr("id","cD"+r);<%
				%>if(r.split('-')[2]!=0){<%
					%>m.find(".insert").show()<%
						%>.attr("id",r.substring(1)+"-");<%
				%>}<%
			%>}<%
			
				// --- editing-------------------------------------v
				%>$('.i').keypress( function(event) {<%
						%>if(event.keyCode==13){<%		
							// - ajax call
							%>s($(this).attr('id'), $(this).val(),"test","gray",$(this).parent().parent());<%
							// - clear next div
							%>$(this).next().hide().text("");<%
						%>} else if($(this).val() !=this.alt){<%
							// - enter to submit
							%>$(this).next().show()<%
								%>.attr('color','#333')<%
								%>.html("enter to submit");<%
						%>}else{<%
							%>$(this).next().text("");}<%
				%>});<%
				
				%>$('.i').blur( function() {<%
							%>if($(this).next().text()!=""){<%
								%>$(this).next().text("not saved")<% 
									%>.css('color','red');<%
							%>}<%
				%>});<%
				
				// --- submit-------------------------------------v
				// --- 		(u) id of what you're updating
				// ---     val of what you're updating
				// --- 		id to replace w/ load
				// --- 		color of gif load
				// --- )
	             %>function s(u,v,i,c,e){<%
	             	%>$.ajax({<%
			 				%>url: "<%=Translator.toURL("a","menu")%>&u=<%=theB%>&r="+u+"&v="+encodeURIComponent(v),<%
			             %>cache:false,<%
			             %>success:function(html){<%
								// The first thing we want to do is check for -1's (first additions : need to update ids)
								%>if(html.substring(html.length-2)!="-1"){<%
									%>var count = html.split('-').length -1;<%
									//Update the menu items for continued editing.
									%>if(count==3){<%
										%>updateItem(e,html);<%
									//Update the course items
									%>}else if(count==2){<%
										%>updateCourse(e,html);<%
									//Update add course items
									%>}else{<%
										%>$(".c").css("display","inline");<%
										%>$(".insertCourse").attr("id",html);<%
									%>}<%
								%>}<%
							%>}<%
	               %>});<%
	            %>}