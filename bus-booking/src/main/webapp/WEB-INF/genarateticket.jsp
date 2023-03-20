<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.bus.booking.dto.Ticket"%>
<%@page import="com.bus.booking.dao.TicketDataBase"%>
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
	int id = Integer.valueOf(request.getParameter("id"));
	String name = request.getParameter("busname");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	int seat = Integer.valueOf(request.getParameter("seat"));
	double ticket = Double.valueOf(request.getParameter("ticket"));
	String selectedSeatsParam = request.getParameter("selected_seats");
	String uname = request.getParameter("name");
	int age = Integer.valueOf(request.getParameter("age"));
	String gen = request.getParameter("gen");
	String decodedParam = URLDecoder.decode(selectedSeatsParam, "UTF-8");
	List<String> seatNumbers = Arrays.asList(decodedParam.split(","));
	List<Integer> addedSeats = new ArrayList();

	for (String stringSeat : seatNumbers) {
		addedSeats.add(Integer.parseInt(stringSeat));
	}

	BusDataBase base = new BusDataBase();
	TicketDataBase ticketDataBase = new TicketDataBase();
	if (!(seat < addedSeats.size()) && !(seat < 1) && !(addedSeats.size() > 6)) {
		int bookedSeats = seat - addedSeats.size();
		double bookedRate = addedSeats.size() * ticket;
		double discount = 0;
		if (age <= 15	) {

			discount = bookedRate * 0.08;

			bookedRate = bookedRate - discount;
		}

		boolean busUpdated = base.updateSeat(bookedSeats, id);
		if (busUpdated) {
			Ticket tk = new Ticket();
			tk.setTicketId(id);
			tk.setBusName(name);
			tk.setFromPlace(from);
			tk.setToPlace(to);
			tk.setSeats(addedSeats.size());
			tk.setTotalAmount(bookedRate);
			tk.setUserName(uname);
			tk.setAge(age);
			tk.setGender(gen);

			ServletContext context = getServletContext();
			context.setAttribute("ticket", tk);
			request.getRequestDispatcher("/ticketpage").forward(request, response);

		}
	} else {

		String noSeats = "Maximum 6 seats only selected !!!";
		request.setAttribute("noSeats", noSeats);
		request.getRequestDispatcher("/booking").include(request, response);
	}
	%>
</body>
</html>