<%@page import="com.bus.booking.dto.Bus"%>
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
int seat = Integer.parseInt(request.getParameter("seat"));
double ticket = Double.valueOf(request.getParameter("ticket"));
BusDataBase base = new BusDataBase();

boolean busUpdated = base.updateBus(name, from, to, seat, ticket, id);
if (busUpdated) {
request.getRequestDispatcher("/route").forward(request, response);
}else{
	request.getRequestDispatcher("/addbus").forward(request, response);

}

%>
</body>
</html>