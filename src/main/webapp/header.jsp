<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="entities.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="header.css" />
</head>
<body>

	<div class="nav">
		<a href="welcomeS.jsp">Home</a> <a href="timeTable.jsp">Time
			Table </a> <a href="regCourses.jsp">Courses</a> <a href="logout.jsp">Logout</a>
	</div>
</body>
</html>