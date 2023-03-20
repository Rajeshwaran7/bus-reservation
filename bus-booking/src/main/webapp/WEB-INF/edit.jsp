<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@page import="com.bus.booking.dto.Bus"%>
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
<link rel="stylesheet" type="text/css" href="./css/search.css">

</head>

<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./admin">AR Travels</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./admin">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="./addbus">ADD
						BUS</a></li>
				<li class="nav-item"><a class="nav-link" href="./route">ROUTE</a></li>
				<li class="nav-item"><a class="nav-link" href="./logout">LOG
						OUT</a></li>

			</ul>
		</div>
	</nav>
	<br>
	<%
	int id = Integer.valueOf(request.getParameter("id"));
	BusDataBase base = new BusDataBase();
	Bus gotBus = base.getBus(id);
	if (gotBus != null) {
	%>
	<div class="container" style="border-bottom-color: gray;">


		<form action="updatebus">

			<div class="row">
				<div class="col">
					<label>BUS ID</label> <input type="text" class="form-control"
						name="id" readonly="readonly" value="<%=gotBus.getBusId()%>">
				</div>
				<div class="col">
					<label>BUS NAME</label> <input type="text" class="form-control"
						name="busname" placeholder="BUS NAME"
						value="<%=gotBus.getName()%>">
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col">
					<label>FROM</label> <input type="text" class="form-control"
						name="from" value="<%=gotBus.getFrom()%>" />
				</div>
				<div class="col">
					<label>TO</label> <input type="text" class="form-control" name="to"
						value="<%=gotBus.getTo()%>" />
				</div>
			</div>

			<br>

			<div class="row" style="width: 300px">
				<div class="col">
					<label>SEAT</label> <input type="number" class="form-control"
						name="seat" placeholder="SEATS" value="<%=gotBus.getSeats()%>">
				</div>
				<div class="col">
					<label>TICKET RATE</label> <input type="number" class="form-control"
						name="ticket" placeholder="RATE" value="<%=gotBus.getTicketRate()%>" min="450">
				</div>
				
			</div>
			<br>
			<button type="submit" class="btn btn-primary">SUBMIT</button>

		</form>
	</div>
	<%
	}
	%>

	<style>
label {
	color: black;
}
</style>
</body>
</html>