<%@ page import="java.io.BufferedReader,java.io.InputStreamReader,java.net.URLEncoder"%><%
%><%@ page import="oauth.signpost.OAuth,oauth.signpost.OAuthConsumer,oauth.signpost.OAuthProvider,oauth.signpost.basic.DefaultOAuthProvider,oauth.signpost.commonshttp.CommonsHttpOAuthConsumer"%><%
%><%@ page import="org.apache.http.HttpResponse,org.apache.http.client.HttpClient,org.apache.http.client.methods.HttpPost,org.apache.http.entity.StringEntity,org.apache.http.impl.client.DefaultHttpClient,org.apache.http.client.methods.HttpEntityEnclosingRequestBase"%><%
%><%@ page import="twitter4j.Twitter,twitter4j.TwitterException,twitter4j.TwitterFactory,twitter4j.auth.AccessToken,twitter4j.auth.RequestToken,twitter4j.conf.ConfigurationBuilder,twitter4j.ProfileImage"%><%


try{
	// --- retrieve the consumer and provider from the session
	OAuthConsumer consumer=(OAuthConsumer)session.getAttribute("consumer");
	OAuthProvider provider=(OAuthProvider)session.getAttribute("provider");
	session.removeAttribute("consumer");
	session.removeAttribute("provider");
	
	// --- retrieve bits (not sure what's req'd / what's not)
	String pin=request.getParameter("oauth_varifier");
	provider.retrieveAccessToken(consumer, pin);
	consumer.setTokenWithSecret(consumer.getToken(),consumer.getTokenSecret());
	
	// --- use twitter4j factory to prettify everything.
	try{
	
		// --- associate twitter factory w/ scenedipity
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setOAuthConsumerKey("2snlpuNIWEoOFIzFHrTQ");
		cb.setOAuthConsumerSecret("DGUvu4AOJDDGYgo2ePuDjhZUI5cYFnRlYBmzUO9A");
		Twitter twitter = new TwitterFactory(cb.build()).getInstance();
		
		// --- check consumer token & secret
		AccessToken accessToken = new AccessToken(consumer.getToken(),consumer.getTokenSecret());
		twitter.setOAuthAccessToken(accessToken);
		
		// --- give a visual confirmation to the user
		%><div class="facebookPage"><%
		  	%><img src="<%=twitter.getProfileImage(twitter.getScreenName(), ProfileImage.BIGGER).getURL()%>"/><%
			%><span class="fb_name"><%
				%><%=twitter.getScreenName()%><%
			%></span><%
			%><br/>twitter account<%
		%></div><%

		%><br/><%
		
		%><div><%
			%><span id="u"><%=twitter.getScreenName()%></span>, click the button below to save your info.<br/><%
			%><span id="t" style="display:none"><%=accessToken.getToken()%></span><%
			%><span id="s" style="display:none"><%=accessToken.getTokenSecret()%></span><%
		%></div><%
	
		// --- navigation buttons (security issues?!)
		%><div style="width:100%; float:left; clear:both; text-align:center; margin-bottom:200px"><%
		
			// --- functionality for this button in 1stPartyJS.jsp (javascript)
			%><button class="g-button" id="save" type="button">link twitter &amp; scenedipity!</button><%
			
			// --- clicking this doesn't save anything
			%><a class="g-button" href="http://scenedipity.com/oauth">cancel</a><%
		
		%></div><%
	
	}catch(Exception e){%><br/><br/><%=e.toString()%><%}
}catch(Exception e){}// oauth exceptions%>
