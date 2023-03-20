<%@page import="com.bus.booking.dto.Ticket"%>
<%@page import="com.bus.booking.dao.TicketDataBase"%>
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
ServletContext context = getServletContext();
Ticket ticket = (Ticket) context.getAttribute("ticket");
if(ticket != null){
TicketDataBase base = new TicketDataBase();
boolean tickedAdded = base.addTicket(ticket);
if(tickedAdded){


  String bookedMessage = "BOOKED SUCCESSFULL !!!";
  request.setAttribute("msg", bookedMessage);
  request.getRequestDispatcher("./booking").include(request, response);
}else{

	  String bookedMessage = "BOOKING UNSUCCESSFULL !!!";
	  request.setAttribute("fmsg", bookedMessage);
	  request.getRequestDispatcher("./booking").include(request, response);
	
}
}
%>
</body>
</html>