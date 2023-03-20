<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@page import="com.bus.booking.dto.Bus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (request.getSession(false) != null) {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUS BOOKING</title>
</head>
<body>
	<%
	String name = request.getParameter("busname");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	int seat = Integer.parseInt(request.getParameter("seats"));
	double ticket = Double.valueOf(request.getParameter("ticket"));
	BusDataBase base = new BusDataBase();
	Bus bus = new Bus();
	bus.setName(name);
	bus.setFrom(from);
	bus.setTo(to);
	bus.setSeats(seat);
	bus.setTicketRate(ticket);
	boolean busAdded = base.addBus(bus);
	if (busAdded) {
		request.getRequestDispatcher("/route").forward(request, response);
	} else {
		request.getRequestDispatcher("/addbus").forward(request, response);

	}
	%>
</body>
</html>
<%
} else {

response.sendRedirect("./logout");
}
%>