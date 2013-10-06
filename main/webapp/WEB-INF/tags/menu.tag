<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
%><%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%
%><%@ attribute name="restaurant" required="true"
	type="scenedipity.model.Restaurant"%>
<%
%><div class="menu ">
	<div class="menuHeaderWrapper">
		<div class="menuHeader vcard" style="display: block;">
			<span class="fn org">${restaurant.restaurant_info.restaurant_name}</span>
			<div class="bL">${restaurant.restaurant_info.brief_description}</div>
			<div class="adr">
				<span class="street-address">${restaurant.restaurant_info.address_1}</span>
				<span class="street-address2">${restaurant.restaurant_info.address_2}</span>
				<br /> <span class="locality">${restaurant.restaurant_info.city_town}</span>
				<span class="region">${restaurant.restaurant_info.state_province}</span>
				<span class="postal-code">${restaurant.restaurant_info.postal_code}</span>
				<br />
				<br /> <a href="http://scndp.it/${restaurant.id}"
					alt="personal site" class="url" rel="no-follow me">scndp.it/${restaurant.id}</a>
				<a href="#menu" alt="jump to menu" class="url" rel="no-follow">menu</a>
				<a href="#twitter" alt="jump to social links" class="url"
					rel="no-follow">social</a>
			</div>
			<div class="bC">
				<ul>
					<li><span class="tel"><span class="type">phone</span> :
							<span class="value">${restaurant.restaurant_info.phone}</span>
					</span>
					</li>
					<li>twitter :<a class="url" href="http://twitter.com/null"
						rel="me no-follow"></a>
					</li>
					<li>website : <a href="http://www.greenteasushi.com"
						alt="personal site" class="url" rel="no-follow me">${restaurant.restaurant_info.website_url}</a>
					</li>
					<li>foursquare:<a href="https://foursquare.com/venue/1123772"
						alt="personal site" class="url" rel="no-follow me">${restaurant.restaurant_info.restaurant_name}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="bT"></div>
	<div class="sT"></div>

	<c:choose>
		<c:when test="${not empty restaurant.menus}">
			<c:forEach items="${restaurant.menus}" var="menu">
				<div class="menuTab">${menu.menu_name}</div>
				<div class="mT">${menu.menu_name}</div>
				<div class="mD">${menu.menu_description}</div>
				<div class="editMenu">
					<div class="editMenuTitle" id="menu">
						<c:choose>
							<c:when test="${not empty menu.menu_groups}">
								<c:forEach items="${menu.menu_groups}" var="group">
									<div class="c">${group.group_name }</div>
									<div class="cD">${group.group_description}</div>
									<c:choose>
										<c:when test="${not empty group.menu_items}">
											<c:forEach items="${group.menu_items}" var="item">
												<div class="menuItem">
													<span class="itemName">${item.menu_item_name}</span> <span
														class="itemDescription">${item.menu_item_description}</span>
												</div>
											</c:forEach>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				</c:forEach>
				</c:when>
				</c:choose>
</div>