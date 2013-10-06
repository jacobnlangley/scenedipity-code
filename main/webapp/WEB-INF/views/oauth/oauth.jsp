<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%

%><c:choose><c:when test="${not empty user}"><%
	
%><span class="message yellow"><b>Protecting your privacy<br/></b>We only publish information when you checkin to scenedipity.  We do not access your accounts for any other reason whatsoever.</span><%

// FACEBOOK SERVICES ----------------------------------------------------
String authUrl = "https://m.facebook.com/dialog/oauth"+
		"?client_id=117564374937567"+
		"&redirect_uri=http://www.scenedipity.com/facebook_oauth"+
		"&scope=manage_pages,publish_stream,offline_access";

%><div class="oauth_provider" id="facebook"><%
		%><font style="font-weight:bold; color:#222">scenedipity <=></font><%
		%> <font style="letter-spacing:-1px;font-family:'lucida grande',tahoma,verdana,arial,sans-serif;font-weight:bold;color:#3b5998"> facebook</font><br/><%

		%><c:if test="${not empty user.fb_oauth_id}"><%
			 %><div class="facebookPage" style="float:none"><%
			   	%><img src="https://graph.facebook.com/me/picture?access_token=${user.fb_oauth_token}&type=large"/><%
					%><span class="fb_name"></span><%
					%><br/>currently linked account<%
				%><br/><a style="float:none; clear:both;" href="<%=authUrl%>">change connection</a><%
				%></div><%
		
		%></c:if><c:if test="${empty user.fb_oauth_id}"><%
			%><a style="float:none; clear:both;" href="<%=authUrl%>">link <b>scenedipity</b> to <b>facebook</b></a><% 
		%></c:if><%
		
%></div><%


//TWITTER SERVICES ---
%><%@ page import="java.io.BufferedReader,java.io.InputStreamReader,java.net.URLEncoder,java.net.*"%><%
%><%@ page import="oauth.signpost.OAuth,oauth.signpost.OAuthConsumer,oauth.signpost.OAuthProvider,oauth.signpost.basic.DefaultOAuthProvider,oauth.signpost.commonshttp.CommonsHttpOAuthConsumer"%><%
%><%@ page import="org.apache.http.HttpResponse,org.apache.http.client.HttpClient,org.apache.http.client.methods.HttpPost,org.apache.http.entity.StringEntity,org.apache.http.impl.client.DefaultHttpClient"%><%
%><%@ page import=" twitter4j.Twitter,twitter4j.TwitterFactory,twitter4j.ProfileImage" %><%

//--- set the consumer info
OAuthConsumer consumer = new CommonsHttpOAuthConsumer
("2snlpuNIWEoOFIzFHrTQ","DGUvu4AOJDDGYgo2ePuDjhZUI5cYFnRlYBmzUO9A");

OAuthProvider provider = new DefaultOAuthProvider(
              "http://twitter.com/oauth/request_token",
              "http://twitter.com/oauth/access_token", 
              "http://twitter.com/oauth/authorize");

//--- Set the callback URL here
authUrl = provider.retrieveRequestToken
        (consumer,"http://www.scenedipity.com/twitter_oauth");

//--- pass the consumer/provider to callback
session.setAttribute("consumer",consumer);
session.setAttribute("provider",provider);

//--- instantiate twitter4j for some light checking
Twitter twitter = new TwitterFactory().getInstance();

%><div class="oauth_provider" id="twttr"><%
	%><font style="font-weight:bold; color:#222">scenedipity <=></font><%
	%><font class="t_name"> twitter</font><br/><%

	%><c:if test="${not empty user.twit_oauth_secret}"><%
	
			%><div class="facebookPage" style="float:none"><%
			  %><img src="<%=twitter.getProfileImage(theBusiness.getTwitter(), ProfileImage.BIGGER).getURL()%>"/><%
				%><span class="fb_name"></span><%
				%><br/>currently linked twitter account<%
				%><br/><%
				%><a style="float:none; clear:both;" href="<%=authUrl%>">change connection</a><%
			%></div><%

		%></c:if><c:if test="${empty user.twit_oauth_secret}"><%
			%><a style="float:none; clear:both" href="<%=authUrl%>">link <b>scenedipity</b> to <b>twitter</b>.</a><%
	%></c:if><%
%></div><%



%></c:when><c:otherwise><%
		// --- not logged in... we need to put up info regarding why scenedipity... linking accounts, etc.
		%><span class="message red">you need to be logged in to link accounts. </span><%
%></c:otherwise></c:choose>