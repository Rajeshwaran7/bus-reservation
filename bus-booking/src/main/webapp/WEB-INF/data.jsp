<%@page import="com.bus.booking.dto.User"%>
<%@page import="com.bus.booking.dao.BusDataBase"%>
<%@page import="com.bus.booking.dto.Bus"%>
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
	String name = request.getParameter("uname");
	String email = request.getParameter("email");
	long mobile = Long.parseLong(request.getParameter("mobile"));
	String password = request.getParameter("password");
	int age = Integer.parseInt(request.getParameter("age"));
	String gen = request.getParameter("gender");

	BusDataBase base = new BusDataBase();
	User user = new User();
	user.setUserName(name);
	user.setEmail(email);
	user.setPwd(password);
	user.setAge(age);
	user.setMobile(mobile);
	user.setGender(gen);
	boolean user2 = base.addUser(user);
	if (user2) {
	%>
	<%
	String successMessage = "Registration successful!";
	request.setAttribute("successMessage", successMessage);
	request.getRequestDispatcher("/login").include(request, response);
	%>
	<%
	} else {
	String failedMessage = "Registration Failed!";
	request.setAttribute("failMessage", failedMessage);
	request.getRequestDispatcher("/add").include(request, response);
	}
	%>
</body>
</html>