<%@page import="com.bus.booking.dto.Bus"%>
<%@page import="java.util.List"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUS BOOKING</title>
</head>
<body>

	<%
	String from = request.getParameter("place1");
	String to = request.getParameter("place2");
	BusDataBase base = new BusDataBase();
	List<Bus> bus = base.searchBus(from, to);

	if (bus.isEmpty()) {

		String noSeats = "No Trip Available";
		request.setAttribute("noSeats", noSeats);
		request.getRequestDispatcher("/booking").forward(request, response);
		
	} else {
	request.getRequestDispatcher("/nav").include(request, response);
	%>

	<br>
	<div class="container">
		<form class="form-inline" action="shows" method="get">
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

					if (bb.getSeats() < 1) {
				%>
				<tr style="color: red">
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button class="btn btn-danger ">NO SEATS</button></td>
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
					<td><button class="btn btn-primary ">
							<a href="./book?id=<%=bb.getBusId()%>">BOOK</a>
						</button></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>

		</table>

		<button type="submit" class="btn btn-primary">
			<a href="./booking">BACK</a>
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