<%@ page import="java.util.HashMap,java.util.Iterator,scene.model.Business,java.io.BufferedReader,java.io.IOException, java.io.InputStream, java.io.InputStreamReader, java.io.Reader, java.net.URL, java.nio.charset.Charset, org.json.JSONException, org.json.JSONObject, org.json.JSONArray"%><%

%><%!
//Create a six hour buffer
	private static HashMap<String, String> buffer;

	private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    return sb.toString();
	  }
	  
	  public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		    InputStream is = new URL(url).openStream();
		    try {
		      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
		      String jsonText = readAll(rd);
		      JSONObject json = new JSONObject(jsonText);
		      return json;
		    } finally {
		      is.close();
		    }
		  }
	  
	  public static String returnTip(JSONObject o){
		  if(buffer==null) 
			  buffer = new HashMap<String, String>();
			  
		  StringBuilder temp=new StringBuilder();
		try{
		  temp.append("&quot;"+o.getString("text")+"&quot;");
		  temp.append("<br/><font style=\"float:right\"><a target=\"_blank\" alt=\"tip summary page\" href=\"https://foursquare.com/item/"+o.getString("id")+"\"> "+o.getJSONObject("done").getString("count")+" completed this tip </a> from ");
		  temp.append(returnUser(o.getJSONObject("user"))+"</font>");
	  }catch(JSONException e){}
		return temp.toString();
	  }
	  public static String returnUser(JSONObject o){
		  StringBuilder temp= new StringBuilder();
		  try{
		  //o.get(photo")
			temp.append("<a class=\"screenname\" target=\"_blank\" href=\"https://foursquare.com/user/"+o.get("id")+"\">"+o.get("firstName")+" ");
			try{temp.append(o.get("lastName"));}catch(Exception e){}
			temp.append("</a>");
		  }catch(JSONException e){}
			return temp.toString();
			
	  }
%><%
			StringBuilder temp = new StringBuilder();
			try{
				Business menu = (Business) session.getAttribute("menu");
				String args=menu.getFoursquare();
				if(args!=null){
						if(buffer!=null && buffer.containsKey(args)){
							temp=temp.append((String)buffer.get(args));
						}else{
					    	String baseURL="https://api.foursquare.com/v2/venues/";
					    	String id = "?client_id=QFFYG5NVNPSSV5UZWGMNXVEWEVSNOS1Y5TTCJALLPF0ABXOM";
					    	String secret = "&client_secret=ANXASG1WIPQZXBA1H2MVDGH2QZMOAVOVVXCPLMXVNBTBVXFU";
				          JSONObject json = readJsonFromUrl(baseURL+args+id+secret).getJSONObject("response").getJSONObject("venue");
			
			//				JSONObject contact=json.getJSONObject("contact");
							JSONObject hereNow=json.getJSONObject("hereNow");
							JSONObject mayor=json.getJSONObject("mayor");
			//				JSONObject photos=json.getJSONObject("photos");
							String shortUrl=json.getString("shortUrl");
			//				String specials=json.getString("specials");
							JSONObject stats=json.getJSONObject("stats");
							JSONObject tips=json.getJSONObject("tips").getJSONArray("groups").getJSONObject(0);								
							temp.append("<ul class=\"tweet_list\" style=\" width:401px; font-size:10pt; color:#444\">");
								temp.append("<li class=\"foursquare\">");
								// --- Print out the statistics
								// --- Print out the mayor's info
								temp.append("<div class=\"third\">MAYOR ");
								temp.append("<img height=\"35px\" src=\""+((JSONObject)mayor.get("user")).get("photo")+"\"/>");
								temp.append("<a target=\"_blank\" alt=\"Link to foursquare user\" href=\"https://foursquare.com/user/"+((JSONObject)mayor.get("user")).get("id")+"\">"+((JSONObject)mayor.get("user")).get("firstName"));
								try{temp.append(" "+((JSONObject)mayor.get("user")).get("lastName"));}catch(JSONException e){}
								temp.append("</a><br/> "+mayor.get("count")+" checkins</div>");
								temp.append("<div class=\"third\">TOTAL PEOPLE <strong>"+stats.get("usersCount")+" </strong></div><div class=\"third\">TOTAL CHECK-INS <strong>"+stats.get("checkinsCount")+"</strong></div>");
								temp.append("<a rel=\"me nofollow\" href=\""+shortUrl+"\" target=\"_blank\">"+menu.getBusinessName() +"</a> on foursquare the past 60 days");
								temp.append("</li>");
											// --- print out the tips
								JSONArray theTips=tips.getJSONArray("items");
								for(int i=0; i<tips.getInt("count");i++){
									temp.append("<li>");
									temp.append(returnTip(theTips.getJSONObject(i)));
									temp.append("</li>");
								}
							temp.append("</ul>");
					  	       
				       //Iterator temp2 = json.sortedKeys();
				       //while(temp2.hasNext())
				        //temp.append(temp2.next().toString() + " ");
					    	}
						buffer.put(args,temp.toString());
				}
		    	// --- if an error, don't do anything... just peace out.
		     }catch(Exception e){}
		    %><%=temp.toString()%><%
%>	

