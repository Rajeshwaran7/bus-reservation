<%@page import="java.util.List"%>
<%@page import="com.bus.booking.dto.Bus"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
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
	<%
	String from = request.getParameter("place1");
	String to = request.getParameter("place2");
	BusDataBase base = new BusDataBase();
	List<Bus> bus = base.searchBus(from, to);

	if (bus.isEmpty()) {
		String noSeats = "No Trip Available";
		request.setAttribute("noSeats", noSeats);
		request.getRequestDispatcher("/routes").forward(request, response);
		
	} else {
	%>

	<br>
	<div class="container">
		<form class="form-inline" action="show">
			<label for="email" class="mr-sm-2">FROM CITY : </label> <input
				type="text" class="form-control mb-2 mr-sm-2" name="place1"
				required="required" placeholder="FROM CITY" id="email"> <label
				for="pwd" class="mr-sm-2">DESTINATION : </label> <input type="text"
				required="required" name="place2" class="form-control mb-2 mr-sm-2"
				placeholder="DESTINATION" id="pwd">

			<button type="submit" class="btn btn-primary mb-2">SEARCH</button>
			
		</form>

	</div>
	<br>
	<div class="container">

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>BUS NAME</th>
					<th>FROM</th>
					<th>--</th>
					<th>TO</th>
					<th>SEATS</th>
					<th>TICKET RATE</th>
					<th>BOOK</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Bus bb : bus) {
					if(bb.getSeats() < 1){%>
				<tr style="color: red">
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button type="submit" class="btn btn-danger">
					NO SEATS
						</button></td>
				</tr>

				<%}else{
					
				%>

				<tr>
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button type="submit" class="btn btn-primary mb-2">
							<a href="./login">BOOK</a>
						</button></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>

		</table>

		<button type="submit" class="btn btn-primary mb-2">
			<a href="./routes">BACK</a>
		</button>
	</div>

	<%
	}
	%>
	<style>
a:visited {
	color: white;
}

a:active {
	color: white;
}

a {
	color: white;
	text-decoration: none;
}
</style>




</body>
</html>