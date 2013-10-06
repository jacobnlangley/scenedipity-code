<%@ taglib prefix="simplyhome" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<simplyhome:head title="SimplyHome | Realtime" />
<body>
	<simplyhome:toplinks system_name="SimplyHome Dev" />
	<br/>
	<div class="container" id="changes"></div>
	
	<script type="text/javascript"><%
	// --- Processing realtime changes client side. ------------------------------v
	// TODO: manage timeouts. route topics.  use validation.
	%>var socket = io.connect('http://localhost:8181');
	socket.on('update', function (data) {
		var d = JSON.parse(data);
		if(data) {
			var p = document.createElement('p');
			if(d._rev.split("-")[0]=="1"){
				$("#changes").prepend('<span class="label success">New</span>');
			}else{
				$("#changes").prepend('<span class="label warning">Update</span>');
			}
			var cont = document.createTextNode(data);
			p.appendChild(cont);
			$("#changes").prepend(p);
		}
	});<%
	// --- end Realtime Processing.----------------------------------------------^
	%></script>


</body>
</html>


