<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (request.getSession(false) != null) {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/home.css">
<link rel="stylesheet" type="text/css" href="./css/Registrationcss.css">
<title>BUS BOOKING</title>
</head>
<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./admin">HOME</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./admin">ADMIN</a></li>
				<li class="nav-item"><a class="nav-link" href="./addbus">ADD
						BUS</a></li>
				<li class="nav-item"><a class="nav-link" href="./route">ROUTE</a></li>
				<li class="nav-item"><a class="nav-link" href="./logout">LOG
						OUT</a></li>

			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="reg">
			<div class="regh">
				<h5>ADD BUS</h5>
			</div>
			<%
			String failedMessage = (String) request.getAttribute("failMessage");
			%>
			<%
			if (failedMessage != null) {
			%>
			<div class="fail">
				<h4 id="Message" style="color: red; text-align: center;"><%=failedMessage%></h4>
			</div>
			<%
			}
			%>
			<form action="busdata" method="post" style="height: 400px">
				<div class="formin">
					<input type="text" name="busname" required="required"
						placeholder="BUS NAME">
				</div>
				<div class="formin">
					<input type="text" name="from" required="required"
						placeholder="FROM CITY">
				</div>
				<div class="formin">
					<input type="text" name="to" required="required"
						placeholder="DESTINATION">
				</div>
				<div class="formin">
					<input type="number" name="seats" required="required" min="1"
						placeholder="SEATS">
				</div>

				<div class="formin">
					<input type="number" name="ticket" required="required" min="450"
						placeholder="Ticket Amount">
				</div>

				<div class="sub">
					<button type="submit">ADD</button>
				</div>

			</form>
		</div>
	</div>
	<script type="text/javascript">
		//Get the success message element
		var successMessage = document.getElementById("Message");

		// Show the success message
		successMessage.style.display = "block";

		// Delay for 5 seconds
		setTimeout(function() {
			// Hide the success message
			Message.style.display = "none";
		}, 5000);
	</script>
</body>
</html>
<%
} else {

response.sendRedirect("./logout");
}
%>