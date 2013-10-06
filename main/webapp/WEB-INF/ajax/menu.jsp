<%@ page import="java.util.*,scene.model.*,scene.tools.DataBaseAccessWeb"%><%
%><%@include file="/views/common/i18n.jsp"%><%

 			String r = request.getParameter("r").toString();
			String value= request.getParameter("v");
			%><%=r + " "+ value %><%
			
			// --- clear out the message upon first sign in.
			if(r.equalsIgnoreCase("test")){
				theBusiness.setStep(1);
			}	
			
			// --- business name
			else if(r.equalsIgnoreCase("fn")){
				theBusiness.setBusinessName(value);
			}
			
			// --- business line
			else if(r.equalsIgnoreCase("bL")){
				theBusiness.setBusinessLine(value);
			}	
			
			// --- business addr1
			else if(r.equalsIgnoreCase("addr1")){
				theBusiness.setAddr1(value);
			}
			
			// --- business addr2
			else if(r.equalsIgnoreCase("addr2")){
				theBusiness.setAddr2(value);
			}
			
			// --- phone
			else if(r.equalsIgnoreCase("p")){
				theBusiness.setPhone(value);
			}
			
			// --- twitter
			else if(r.equalsIgnoreCase("t")){
				theBusiness.setTwitter(value);
			}	
			
			// --- business url
			else if(r.equalsIgnoreCase("url")){
				theBusiness.setUrl(value);
			}	
			
			// --- business notes
			else if(r.equalsIgnoreCase("notes")){
				theBusiness.setNotes(value);
			}
			
			// --- foursquare ID
			else if(r.equalsIgnoreCase("foursquare")){
				theBusiness.setFoursquare(value);
			}
			
			
			// --- Updating Menus -------------------------------------------------------------------v
			else if(r.startsWith("mT") || r.startsWith("mD")){

				Menu temp=null;
				try{temp = theBusiness.getMenus().get(Integer.parseInt(request.getParameter("r").split("-")[1]));}
				catch(Exception e){}
				if(temp==null)
					temp=new Menu();
				
				// --- menu title
				if(r.startsWith("mT"))
					temp.setMenuName(value);

				// --- menu description
				else if(r.startsWith("mD"))
					temp.setMenuDescripton(value);
				
				temp.Update(theBusiness.getUsername());
				
				// --- return id for newly created menu
					Business temp2 = DataBaseAccessWeb.searchFor(theBusiness.getUsername());
					%><%=temp2.getMenus().keySet().toArray()[0]%><%		
			}
			
			
			
			// --- Updating Courses-------------------------------------------------------------v
			else if(r.startsWith("cT") || r.startsWith("cD")){
				int menu = Integer.parseInt(request.getParameter("r").split("-")[1]);
				int course = Integer.parseInt(request.getParameter("r").split("-")[2]);
				MenuCourse temp = new MenuCourse();
				
				if(course!=0){temp = theBusiness.getMenus().get(menu).getMenuCourses().get(course);}
				else{temp=new MenuCourse();}
				
				// --- course title
				if(r.startsWith("cT")){temp.setMenuCourseName(value);}
		
				// --- course description
				else if(r.startsWith("cD")){temp.setMenuDescripton(value);}
				
				// --- handle the error codes from the database
				int dataBaseCall = temp.update(theBusiness.getUsername(),menu);		
				%>-<%=menu%>-<%=dataBaseCall%><%		
				
				// --- check for a new item:
				if(dataBaseCall > 0){
					session.setAttribute("theBusiness",DataBaseAccessWeb.searchFor(theBusiness.getUsername()));
				}
			
			}// --- end Course Updating -------------------------------------------------------^
	
			
			// --- Updating Items -------------------------------------------------------------v
			else if(r.startsWith("iN") || r.startsWith("iDe") ||r.startsWith("iPrice") ||r.startsWith("iSize")){
				int menu = Integer.parseInt(r.split("-")[1]);
				int course = Integer.parseInt(r.split("-")[2]);
				int item = Integer.parseInt(r.split("-")[3]);
				MenuItem temp;
				if(menu>0 & course>0 & item > 0){
					temp = theBusiness.getMenus().get(menu).getMenuCourses().get(course).getMenuItems().get(item);
				}else{temp=new MenuItem();}
				
				// --- item name
				if(r.startsWith("iN")){temp.setTitle(value);}
				
				// --- item description
				else if(r.startsWith("iDe")){temp.setDescription(value);}
	
				// --- item Price
				else if(r.startsWith("iPriceS-")){
					try{temp.setPriceS(Double.parseDouble(value));}catch(Exception e){}
				}else if(r.startsWith("iPrice-")){
					try{temp.setPrice(Double.parseDouble(value));}catch(Exception e){}
				}else if(r.startsWith("iPriceL-")){
					try{temp.setPriceL(Double.parseDouble(value));}catch(Exception e){}
				}else if(r.startsWith("iPriceXL-")){
					try{temp.setPriceXL(Double.parseDouble(value));}catch(Exception e){}
				}
				
				// --- item Size
				else if(r.startsWith("iSizeS-")){temp.setSizeS(value);}
				else if(r.startsWith("iSize-")){temp.setSize(value);}
				else if(r.startsWith("iSizeL-")){temp.setSizeL(value);}
				else if(r.startsWith("iSizeXL-")){temp.setSizeXL(value);}
				
				// --- handle the error codes from the database
				int dataBaseCall = temp.Update(theBusiness.getUsername(),menu,course);
				%>-<%=menu%>-<%=course%>-<%=dataBaseCall%><%		
				// --- check for a new item:
				if(dataBaseCall > 0){
					session.setAttribute("theBusiness",DataBaseAccessWeb.searchFor(theBusiness.getUsername()));
				}
			}
			
			else if(r.equals("dE")){
				try{DataBaseAccessWeb.delete(value);	
				session.setAttribute("theBusiness",DataBaseAccessWeb.searchFor(theBusiness.getUsername()));
				}catch(Exception e){}
			}
			theBusiness.Update();
%>