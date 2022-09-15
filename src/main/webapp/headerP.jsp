<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entities.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="header.css" />
</head>
<body>
	<div class="nav">
		<a href="welcomeP.jsp">Home</a> <a href="timeTableP.jsp">Time
			Table </a> <a href="regCoursesP.jsp">Add</a> <a href="logout.jsp">Logout</a>
	</div>
</body>
</html>