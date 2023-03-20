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
	HttpSession httpSession = request.getSession(false);
	if (httpSession != null) {
		httpSession.invalidate();
		response.sendRedirect("./login");
	} else {
		response.sendRedirect("./login");

	}
	%>
</body>
</html>