<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %><%
%><%@ attribute name="restaurant" required="true" type="scenedipity.model.Restaurant" %><%
%><%@ attribute name="comments" required="false" type="java.lang.Boolean" %><%

%><a href="/${restaurant.id}">${restaurant.restaurant_info.restaurant_name}</a><%
%><time><joda:format value="${omf_updated_timestamp}" style="SS" /></time>