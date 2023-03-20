<%@page import="com.bus.booking.dto.Bus"%>
<%@page import="java.util.List"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@page import="com.bus.booking.dto.User"%>
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
	<%
	ServletContext context = getServletContext();
	User user = (User) context.getAttribute("user");
	if (user != null) {
	%>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="./booking"> WELCOME</a> <a
			class="navbar-brand" href="./booking"> <%=user.getUserName()%></a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./logout">LOG
						OUT</a></li>
			</ul>

		</div>
	</nav>
	<br>
	<div class="container">
		<form class="form-inline" action="shows">
			<label for="email" class="mr-sm-2">FROM CITY : </label> <input
				type="text" class="form-control mb-2 mr-sm-2" name="place1"
				placeholder="FROM CITY" id="email" required="required"> <label
				for="pwd" class="mr-sm-2">DESTINATION : </label> <input type="text"
				name="place2" class="form-control mb-2 mr-sm-2"
				placeholder="DESTINATION" id="pwd" required="required">

			<button type="submit" class="btn btn-primary mb-2">SEARCH</button>
		</form>

	</div>

	<br>

	<%
	String noSeats = (String) request.getAttribute("noSeats");
	if (noSeats != null) {
	%>
	<div class="container">
		<div class="success">
			<h4 id="Message" style="color: red; text-align: center;"><%=noSeats%></h4>
		</div>
	</div>


	<%
	}
	%>
	<%
	String bookedMessage = (String) request.getAttribute("msg");
	if (bookedMessage != null) {
	%>
	<div class="container">
		<div class="success">
			<h4 id="Message" style="color: green; text-align: center;"><%=bookedMessage%></h4>
		</div>
	</div>	<%
	if(bookedMessage != null){
		Thread.sleep(1000);
		request.removeAttribute("msg");
	}
	}
	String fmsg = (String) request.getAttribute("fmsg");
	if (fmsg != null) {
	%>
	<div class="container">
		<div class="success">
			<h4 id="Message" style="color: red; text-align: center;"><%=fmsg%></h4>
		</div>
	</div>

	<%
	}

	BusDataBase base = new BusDataBase();
	List<Bus> bus = base.getRoutes();
	if (bus != null) {
	%>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>BUS NAME</th>
					<th>FROM</th>
					<th>--</th>
					<th>TO</th>
					<th>SEATS</th>
					<th>TICKET</th>
					<th>BOOK</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Bus bb : bus) {
					if (bb.getSeats() < 1) {
				%>
				<tr style="color: red">
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button class="btn btn-danger">
					NO SEATS
						</button></td>
				</tr>


				<%
				} else {
				%>

				<tr>
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button class="btn btn-primary">
							<a href="./book?id=<%=bb.getBusId()%>">BOOK</a>
						</button></td>
				</tr>


				<%
				}
				}
				} else {
				request.getRequestDispatcher("/booking").forward(request, response);
				}
				} else {
				request.getRequestDispatcher("/login").forward(request, response);
				}
				%>
			</tbody>

		</table>

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