<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: tahoma;
}

.content-container {
	padding: 75px;
}

.col-container:after {
	content: "";
	display: table;
	clear: both;
}

.column-one {
	float: left;
	width: 66.66666%;
	padding: 25px;
}

.column-two {
	float: left;
	width: 33.33333%;
	padding: 25px;
}

.l-font {
	font-size: 45px;
	color: #03071e;
}

.xl-font {
	font-size: 65px;
	color: #03071e;
}

.button {
	border: 5px solid #03071e;
	background-color: transparent;
	color: white;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	color: #03071e;
	font-weight: bold;
	transition: .2s;
}

.button:hover {
	background-color: #03071e;
	color: white;
}

img {
	display: block;
	height: auto;
	max-width: 100%;
}

@media screen and (max-width: 800px) {
	.column-one, .column-two {
		width: 100%;
		text-align: center;
	}
	img {
		margin: auto;
	}
}
</style>
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
				<li class="nav-item"><a class="nav-link" href="./routes">ROUTES</a></li>
			</ul>
		</div>
	</nav>


	<div class="content-container" style="background-color: #ffff";>
		<div class="col-container">
			<div class="column-one">
				<h1 class="xl-font">
					<b>HURRY UP</b>
				</h1>
				<h1 class="l-font">
					<b>Make your journey as Haven</b>
				</h1>
				<button class="button">SEARCH</button>
			</div>
			<div class="column-two">
				<img
					src="https://cdn.dribbble.com/users/3593902/screenshots/8826233/media/10d04bc937cc65568fd00500d8ae4417.gif"
					width="335" height="471">
			</div>
		</div>
	</div>
	<div class="content-container" style="background-color: #cbaba6;">
		<div class="col-container">
			<div class="column-one">
				<h1 class="xl-font">
					<b>BOOK NOW</b>
				</h1>
				<h1 class="l-font">
					<b>What can't do Others, AR does.</b>
				</h1>
				<button class="button">WELOME</button>
			</div>
			<div class="column-two">
				<img
					src="https://cdn.dribbble.com/users/3593902/screenshots/6886578/bus-animation-1.gif"
					width="335" height="471">
			</div>
		</div>
	</div>







</body>
</html>