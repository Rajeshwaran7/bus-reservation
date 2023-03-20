<%@page import="com.bus.booking.dto.Bus"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@page import="com.bus.booking.dto.User"%>
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
<link rel="stylesheet" type="text/css" href="./css/selection.css">
<style>
.seat {
	width: 50px;
	height: 50px;
	margin: 5px;
	background-color: green;
	border: 2px solid black;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	font-weight: bold;
	color: white;
	cursor: pointer;
}

.seat.selected {
	background-color: red;
	cursor: default;
}

.seat.disabled {
	background-color: grey;
	cursor: default;
}
</style>
</head>
<body>
	<%
	ServletContext context = getServletContext();
	User user = (User) context.getAttribute("user");
	if (user != null) {
	%>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="">WELCOME</a> <a class="navbar-brand"
			href=""><%=user.getUserName()%></a>

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
	<%
	int id = Integer.valueOf(request.getParameter("id"));
	BusDataBase base = new BusDataBase();
	Bus searchedBus = base.getBus(id);
	if (searchedBus != null) {
	%>
	<br>
	<br>
	<div class="container"
		style="border: 1px solid blue; border-radius: 4px;">
		<h4 style="background: blue; color: white; display: inline;">SEAT
			SELECTION</h4>
		<form action="genarateticket" id="myForm">
			<br> <label>BUS NUMBER</label>
			<div class="form-row" style="width: 400px" align="center">
				<div class="col-3">
					<input type="text" name="id" value="<%=searchedBus.getBusId()%>"
						class="form-control" readonly="readonly">
				</div>
			</div>
			<br> <label>DETAILS</label>

			<div class="form-row">
				<div class="col-4">
					<input type="text" class="form-control"
						value="<%=searchedBus.getName()%>" readonly="readonly"
						name="busname">
				</div>
				<label> FROM : </label>

				<div class="col-3">
					<input type="text" class="form-control"
						value="<%=searchedBus.getFrom()%>" readonly="readonly" name="from">
				</div>
				<label> TO : </label>

				<div class="col-3">
					<input type="text" class="form-control"
						value="<%=searchedBus.getTo()%>" readonly="readonly" name="to">
				</div>
			</div>



			<br> <label>SEAT AVAILABLE</label>

			<div class="form-row">
				<div class="col-4">
					<input type="number" class="form-control"
						value="<%=searchedBus.getSeats()%>" readonly="readonly"
						required="required" name="seat">
				</div>
				<label> RATE : </label>

				<div class="col-3">
					<input type="text" class="form-control" name="ticket"
						value="<%=searchedBus.getTicketRate()%>" readonly="readonly">
				</div>

			</div>
			<br> <label>PASSANGER </label>
			<div class="form-row">
				<div class="col-4">
					<input type="text" class="form-control"
						value="<%=user.getUserName()%>" name="name" required="required">
				</div>
				<label>AGE : </label>
				<div class="col-3">
					<input type="text" class="form-control" name="age"
						value="<%=user.getAge()%>" required="required">
				</div>
				<label>GENDER : </label>
				<div class="col-3">
					<div class="formx">
						<label for="male">Male</label> <input type="radio" name="gen"
							id="male" value="male" checked> <label for="female">Female</label>
						<input type="radio" name="gen" id="female" value="female">
					</div>
				</div>

			</div>
			<br>
			<div class="col-3">
				<input type="hidden" id="selected_seats" name="selected_seats">
			</div>
			<div id="seats">
				<%
				// Generate seat numbers dynamically
				int total_seats = searchedBus.getSeats();
				%>
				<div class="bus-seats">
					<%
					for (int i = 1; i <= total_seats; i++) {
					%>
					<div class='seat'><%=i%></div>

					<%
					}
					%>
					</main>
					<p id="seat-size" style="color: red">Maximum 6 seats should be
						selected *</p>

				</div>

				<br>
				<div class="form-row">
					<div class="col-5">
						<button type="submit" class="btn btn-primary">BOOK</button>

					</div>
					<div class="col-5">
						<button type="submit" class="btn btn-primary">
							<a href="./booking">BACK</a>
						</button>

					</div>
				</div>
				<br>
			</div>
		</form>
		<br>


		<script>
			document
					.addEventListener(
							'DOMContentLoaded',
							function() {
								var seats = document.querySelectorAll('.seat');
								var selected_seats = [];

								// Add event listener to each seat
								seats
										.forEach(function(seat) {
											seat
													.addEventListener(
															'click',
															function() {
																if (seat.classList
																		.contains('disabled')) {
																	return;
																}
																seat.classList
																		.toggle('selected');

																var seat_number = seat.textContent;

																if (selected_seats
																		.includes(seat_number)) {
																	selected_seats
																			.splice(
																					selected_seats
																							.indexOf(seat_number),
																					1);
																} else {
																	selected_seats
																			.push(seat_number);
																}
																document
																		.getElementById('selected_seats').value = selected_seats
																		.join(',');
															});
										});

								// Disable seats that are already booked
								var booked_seats = [ '1', '4', '15' ];
								booked_seats.forEach(function(seat_number) {
									var seat = document
											.querySelector('.seat:nth-child('
													+ seat_number + ')');
									seat.classList.add('disabled');
								});

								// Add submit event listener to form
								document
										.querySelector('form')
										.addEventListener(
												'submit',
												function(event) {
													if (selected_seats.length === 0) {
														alert("Please select at least one seat.");
														event.preventDefault(); // prevent form submission
													} else if (selected_seats.length > 6) {
														alert("seat should not exceeds more than 6.");
														event.preventDefault(); // prevent form submission

													}
												});
							});
		</script>

		<%
		} else {
		response.sendRedirect("./booking");

		}

		} else {
		response.sendRedirect("./booking");
		}
		%>
	
</body>
</html>