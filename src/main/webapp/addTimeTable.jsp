<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entities.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addTimeTable</title>
</head>
<body>
	<%
	mysql m = (mysql) session.getAttribute("mysql");

	String[] day_id_slotId = request.getParameter("day_id_slotId").split("-");
	int course_id = Integer.parseInt(request.getParameter("course_id").trim());
	int is_lab = request.getParameter("is_lab").trim() == "Yes" ? 1 : 0;
	String hall_id = request.getParameter("hall_id").trim();
	boolean res = m.addTimeTable((Integer.parseInt(day_id_slotId[0].trim())), (Integer.parseInt(day_id_slotId[1].trim())),
			course_id, is_lab, hall_id);
	if (res) {
		session.setAttribute("isTimeTableAdded", true);
		response.sendRedirect("regCoursesP.jsp");

	} else
		response.sendRedirect("errorPage.jsp");
	%>
</body>
</html>