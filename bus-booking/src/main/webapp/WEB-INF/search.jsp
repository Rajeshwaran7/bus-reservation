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
<link rel="stylesheet" type="text/css" href="./css/search.css">

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
				<li class="nav-item"><a class="nav-link" href="">search</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			</ul>
		</div>
	</nav>
	<div class="bd">
		<div class="Regi">
			<div class="search">
				<h3>Search</h3>
			</div>
			<hr>
			<form class="form" action="">
				<div class="form2">
					<label> From </label> <input type="text" list="place" name="place1"
						required="required" />
					<datalist id="place">
						<option value="">Select your option</option>
						<option value="Chennai">Chennai</option>
						<option>Thoothukudi</option>
						<option>Coimbatore</option>
						<option>Trichy</option>
					</datalist>

				</div>
				<div class="form2">
					<label> TO </label> <input type="text" list="place" name="place2"
						required="required" />
					<datalist id="place">
						<option value="Select your option">Select your option</option>
						<option>Kanyakumari</option>
						<option>Thoothukudi</option>
						<option>Coimbatore</option>
						<option>Trichy</option>
					</datalist>
				</div>
				<div class="btn">
					<button type="submit">SEARCH</button>
				</div>
			</form>

		</div>
	</div>



</body>
</html>