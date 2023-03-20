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
	String busName = request.getParameter("busname");
	BusDataBase base = new BusDataBase();
	List<Bus> buses = base.searchBus(busName);
	if (buses != null) {
		request.getRequestDispatcher("/dashboard").include(request, response);
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
					<th colspan="2" align="center">ACTION</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Bus bb : buses) {
				%>

				<tr>
					<td><%=bb.getName()%></td>
					<td><%=bb.getFrom()%></td>
					<td>To</td>
					<td><%=bb.getTo()%></td>
					<td><%=bb.getSeats()%></td>
					<td><%=bb.getTicketRate()%></td>
					<td><button class="btn btn-primary">
							<a href="./edit?id=<%=bb.getBusId()%>">EDIT</a>
						</button></td>
					<td><button class="btn btn-danger">
							<a href="./delete?id=<%=bb.getBusId()%>">DELETE</a>
						</button></td>

				</tr>


				<%
				}

				} else {
				request.getRequestDispatcher("/admin").forward(request, response);
				}
				%>
			</tbody>

		</table>
		<button type="submit" class="btn btn-primary mb-2">
			<a href="./route">BACK</a>
		</button>

	</div>

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