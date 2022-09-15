
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<%

session.removeAttribute("professor_details");
session.removeAttribute("student_details");
response.sendRedirect("index.html");

%>
</body>
</html>