<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(request.getSession(false) != null){ %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUS BOOKING</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/home.css">
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./admin">Home</a>

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
				<li class="nav-item"><a class="nav-link" href="./route">ROUTES</a></li>
				<li class="nav-item"><a class="nav-link" href="./logout">LOG
						OUT</a></li>

			</ul>
		</div>
	</nav>
	<div>
		<img alt=""
			src="https://cdn.pixabay.com/photo/2018/03/07/16/07/coach-3206326_960_720.png">
	</div>

</body>
</html>

<% }else{
	
	response.sendRedirect("./logout");
}
%>