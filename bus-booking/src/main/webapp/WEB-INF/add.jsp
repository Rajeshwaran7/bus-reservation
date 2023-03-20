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
<link rel="stylesheet" type="text/css" href="./css/home.css">
<link rel="stylesheet" type="text/css" href="./css/Registrationcss.css">
<title>BUS BOOKING</title>
</head>
<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./home">Home</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./home">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="./login">LOG IN</a></li>
				<li class="nav-item"><a class="nav-link" href="./routes">ROUTE</a></li>
			</ul>
		</div>
	</nav>
	<div class="reg">
		<div class="regh">
			<h5>REGISTRATION</h5>
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
		<form action="data" method="post">
			<div class="formin">
				<input type="text" name="uname" required="required"
					placeholder="User name">
			</div>
			<div class="formin">
				<input type="email" name="email" required="required"
					placeholder="abc12@gmail.com">
			</div>
			<div class="formin">
				<input type="tel" name="mobile" required="required"
					placeholder="mobile">
			</div>
			<div class="formin">
				<input type="password" name="password" required="required"
					placeholder="password">
			</div>

			<div class="formin">
				<input type="number" name="age" required="required"
					placeholder="Age" min=10>
			</div>
			<div class="formx">
				<label for="male">Male</label> <input type="radio" name="gender"
					id="male" value="male" checked> <label for="female">Female</label>
				<input type="radio" name="gender" id="female" value="female">
			</div>
			<div class="sub">
				<button type="submit">REGISTER</button>
			</div>

		</form>
		<div class="regie">
			<a href="./login">LOG IN</a>
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