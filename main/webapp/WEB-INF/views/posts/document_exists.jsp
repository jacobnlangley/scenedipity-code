<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="simplyhome" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
	<simplyhome:head title="SimplyHome | Blog Exists" />
	<body>
		<div class="row">
		<header id="blog_hd" class="column grid_9">
			<h1 style="color: red;">Blog Post Exists</h1>
			<a href="<c:url value="/simplyhome/posts/"/>">Home</a>
		</header>
		</div>
		<div class="row">
			<div class="column grid_9">
				<p>A blog post with the title <strong>${param.title}</strong> already exists</p>
				<h3>Change your title:</h3>
				<jsp:include page="../forms/post_form.jspf"/>
			</div>	
		</div>
	</body>
</html>