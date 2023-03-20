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
BusDataBase base = new BusDataBase();

base.deleteBus(id);
request.getRequestDispatcher("/route").forward(request, response);
%>

</body>
</html>