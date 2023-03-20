<%@page import="com.bus.booking.dto.User"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>BUS BOOKING</title>
<link rel="stylesheet" type="text/css" href="./css/home.css">
<link rel="stylesheet" type="text/css" href="./css/log.css">

</head>
<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./home">AR Travels</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./home">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="./login">LOG
						IN</a></li>
				<li class="nav-item"><a class="nav-link" href="./routes">ROUTE</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="container">
		<div class="form1">
			<div class="text" align="center" style="background: blue; color: white;">FORGOT PASSWORD</div>
			
			<form action="changepassword" id="myForm" method="post">
				<%
				String failMessage = (String) request.getAttribute("invalid");
				if (failMessage != null) {
				%>
				<div class="fail">
					<h4 id="Message" style="color: red; text-align: center;"><%=failMessage%></h4>
				</div>
				<%
				}
				%>

				<div class="form-group">
					<label for="email">Email address:</label> <input type="email"
						class="form-control" name="email" placeholder="Enter email"
						id="email">
				</div>
				<div class="form-group">
					<label for="pwd">New Password:</label> <input type="password"
						class="form-control" name="password" placeholder="Enter password"
						id=password>
				</div>
				<div class="form-group">
					<label for="pwd"> Confirm Password:</label> <input type="password"
						class="form-control" name="password2" placeholder="Enter password"
						id="password2">
				</div>

				<div class="btn">
					<button type="submit">SET PASSWORD</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		var form = document.getElementById("myForm");
		form.addEventListener("submit", function(event) {
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var password2 = document.getElementById("password2").value;

			if (email == "") {
				alert("Email is required");
				event.preventDefault();
			}

			if (!password) {
				alert("Password is required");
				event.preventDefault();
			}
			if (password != password2) {

				alert("Mis match Password");
				event.preventDefault();
			}
		});
	</script>
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