<%@page import="com.bus.booking.dao.TicketDataBase"%>
<%@page import="com.bus.booking.dto.Ticket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();
Ticket ticket = (Ticket) context.getAttribute("ticket");
if (ticket != null) {
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
<title>BUS BOOKING</title>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="">WELCOME</a> <a class="navbar-brand"
			href=""><%=ticket.getUserName()%></a>

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

	<div class="container"
		style="border: 2px solid black; border-radius: 6px">
		<h1 style="background-color: gray;; color: white; text-align: center;">Ticket</h1>

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">TICKET ID</th>
					<th scope="col">NAME</th>
					<th scope="col">AGE</th>
					<th scope="col">GENDER</th>

				</tr>
			</thead>
			<tbody class="table-group-divider">
				<tr>
					<th scope="row">1</th>
					<td><%=ticket.getUserName()%></td>
					<td><%=ticket.getAge()%></td>
					<td><%=ticket.getGender()%></td>
				</tr>

			</tbody>
		</table>
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>

					<th scope="col">BUS NAME</th>
					<th scope="col">FROM</th>
					<th scope="col">DESTINATION</th>
					<th scope="col">NO OF SEATS</th>
					<th scope="col">AMOUNT TOTAL</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<tr>
					<td><%=ticket.getBusName()%></td>
					<td><%=ticket.getFromPlace()%></td>
					<td><%=ticket.getToPlace()%></td>
					<td><%=ticket.getSeats()%></td>
					<td><%=ticket.getTotalAmount()%></td>


				</tr>

			</tbody>
		</table>

	</div>
	<br>
	<div class="container">
		<div align="right">
			<button type="submit" class="btn btn-primary">
				<a href="./booking">CANCEL</a>
			</button>

			<button type="submit" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">PROCEED TO PAY</button>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">ARE
						YOU SURE ?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" align="center">BOOK YOUR BUS</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CANCEL</button>
					<button type="submit" class="btn btn-primary">
						<a href="./booked">SURE</a>
					</button>

				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>
</body>
</html>