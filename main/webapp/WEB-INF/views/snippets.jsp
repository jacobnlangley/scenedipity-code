  // Log any kind of Web Intent event to Google Analytics
  // Category: "twitter_web_intents"
  // Action: Intent Event Type
  // Label: Identifier for action taken: tweet_id, screen_name/user_id, click region
  function clickEventToAnalytics(intent_event) {
    if (intent_event) {
      var label = intent_event.region;
      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);
    };
  }
 
  function tweetIntentToAnalytics(intent_event) {
    if (intent_event) {
      var label = "tweet";
      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);
    };
  }
 
  function favIntentToAnalytics(intent_event) {
    tweetIntentToAnalytics(intent_event);
  }
 
  function retweetIntentToAnalytics(intent_event) {
    if (intent_event) {
      var label = intent_event.data.source_tweet_id;
      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);
    };
  }
 
  function followIntentToAnalytics(intent_event) {
    if (intent_event) {
      var label = intent_event.data.user_id + " (" + intent_event.data.screen_name + ")";
      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);
    };
  }
 
  twttr.events.bind('click',    clickEventToAnalytics);
  twttr.events.bind('tweet',    tweetIntentToAnalytics);
  twttr.events.bind('retweet',  retweetIntentToAnalytics);
  twttr.events.bind('favorite', favIntentToAnalytics);
  twttr.events.bind('follow',   followIntentToAnalytics);

%><div id="states"><%
%><a>al</a><%
%><a>ak</a><%
%><a>az</a><%
%><a>ar</a><%
%><a>ca</a><%
%><a>co</a><%
%><a>ct</a><%
%><a>de</a><%
%><a>fl</a><%
%><a>ga</a><%
%><a>hi</a><%
%><a>id</a><%
%><a>il</a><%
%><a>in</a><%
%><a>ia</a><%
%><a>ks</a><%
%><a>ky</a><%
%><a>la</a><%
%><a>me</a><%
%><a>md</a><%
%><a>ma</a><%
%><a>mi</a><%
%><a>mn</a><%
%><a>ms</a><%
%><a>mo</a><%
%><a>mt</a><%
%><a>ne</a><%
%><a>nv</a><%
%><a>nh</a><%
%><a>nj</a><%
%><a>nm</a><%
%><a>ny</a><%
%><a>nc</a><%
%><a>nd</a><%
%><a>nd</a><%
%><a>oh</a><%
%><a>ok</a><%
%><a>or</a><%
%><a>pa</a><%
%><a>ri</a><%
%><a>sc</a><%
%><a>sd</a><%
%><a>tn</a><%
%><a>tx</a><%
%><a>ut</a><%
%><a>vt</a><%
%><a>va</a><%
%><a>wa</a><%
%><a>wv</a><%
%><a>wi</a><%
%><a>wy</a><%
%></div><%