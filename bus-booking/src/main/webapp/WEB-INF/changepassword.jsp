<%@page import="com.bus.booking.dao.UserDao"%>
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
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");

	UserDao dao = new UserDao();
	boolean updatedPassword = dao.updatePassword(email, pwd);
	
	if(updatedPassword){

		String success = "Password setted  !!!";
		request.setAttribute("success", success);
		request.getRequestDispatcher("/login").include(request, response);
	}else{
		String invalidMessage = "Invalid credentials !!!";
		request.setAttribute("invalid", invalidMessage);
		request.getRequestDispatcher("/forgot").include(request, response);
	}
	%>
</body>
</html>