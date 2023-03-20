<%@page import="com.bus.booking.dao.UserDao"%>
<%@page import="com.bus.booking.dto.User"%>
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
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	UserDao userDao = new UserDao();
	User user = userDao.loginUser(email, pwd);
	if (user != null) {
		if (user.getEmail().equals("r@gmail.com") && user.getPwd().equals("9090")) {
			HttpSession ses = request.getSession(true);
			if (ses != null) {

		        request.getRequestDispatcher("/admin").forward(request, response);
			} else{
				response.sendRedirect("./logout");
			}
		}else{
			ServletContext context = getServletContext();
			context.setAttribute("user", user);
			request.getRequestDispatcher("/booking").include(request, response);
		}
	} else {
		String failMessage = "Bad Credential!";
		request.setAttribute("failMessage", failMessage);
		request.getRequestDispatcher("/login").include(request, response);
	}
	%>
</body>
</html>