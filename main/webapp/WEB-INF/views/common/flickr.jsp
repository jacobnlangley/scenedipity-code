<%@ page import="java.net.URL, java.util.HashMap, org.xml.sax.Attributes, org.xml.sax.InputSource, org.xml.sax.SAXException, org.xml.sax.XMLReader, org.xml.sax.helpers.DefaultHandler, org.xml.sax.helpers.XMLReaderFactory"%><%
%><%!

private final static String API_KEY="ba8cf8e32bf81e0a246a67e40221df43";
private final static String API_USERID="64186732%40N02";
private static HashMap<String, String> imgs = new HashMap<String,String>();
private static StringBuilder urls = new StringBuilder();

// --- XML Handler -------------------------------------------------------------------v
class xmlHandler extends DefaultHandler {
	private String setID="";
	private StringBuilder stringBuffer = new StringBuilder();
			
	//Figure out which fields are available    
	public void startElement(String nsURI, String strippedName, String tagName, Attributes attributes)
	throws SAXException {
			if(tagName.equalsIgnoreCase("photo"))
				urls.append("http://farm"+attributes.getValue("farm")+
					".static.flickr.com/"+attributes.getValue("server")+
					"/"+attributes.getValue("id")+"_"+
					attributes.getValue("secret")+"_##.jpg|"
				);
	}

	// --- Process the raw text as it comes
	public void characters(char[] ch, int start, int length){}

	// --- Reached the end of an element, take proper action
	public void endElement(java.lang.String uri, java.lang.String localName, java.lang.String tagName)
	throws SAXException{}

	// --- Reached the end of the document... end
	public void endDocument(){}
}// -- end of XML Handler --------------------------------------------------------------^


// --- Flickr Call ----------------------------------------------------------------------v
public String list( ) {
	try{
		XMLReader parser = XMLReaderFactory.createXMLReader();
		parser.setContentHandler(new xmlHandler( ));
		
		// --- Need to generate links like http://farm4.static.flickr.com/server/id_secret_SIZE.jpg
			urls=new StringBuilder();
			parser.parse( 
				new InputSource(
						new URL(
							"http://api.flickr.com/services/rest/?" +
							"method=flickr.photos.search" +
							"&api_key=ba8cf8e32bf81e0a246a67e40221df43" +
							"&format=rest" 
							).openStream()
				)
			);
			imgs.put(sets.get(photoSetID),urls.toString());
		}
		// --- record into mysql
		for(String s : imgs.keySet()){
			msg.append("<div style=\"float:left; clear:both\">"+s+"<ul style=\"float:left\">");
			for(String ss : imgs.get(s).split("\\|")){
				msg.append("<li class=\"tweet_first tweet_odd\" style=\"float:left; clear:none; width:75px; list-style:none\"><img style=\"border:solid 1px #ccc; padding:2px;margin-right:5px; height:60px; width:60px;-moz-box-shadow: rgba(0, 0, 0, .33) 0 0 5px;-"+
						"webkit-box-shadow: rgba(0, 0, 0, .33) 0 0 5px;box-shadow: rgba(0, 0, 0, .33) 0 0 5px;\"  src=\""+ss.replace("##","s")+"\"/></li>");
				}
			msg.append("</ul></div>");
			DataBaseAccessWeb.updateFlickr(s,imgs.get(s));
		}
		
	}catch(Exception e){msg.append(e.toString());}
	return msg.toString();
} // --- end of Flickr Call--------------------------------------------------------------^

%>	

