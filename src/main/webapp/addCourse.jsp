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
<title>addCourse</title>
</head>
<body>
	<%
         mysql m= (mysql)session.getAttribute("mysql");
         
         int id=Integer.parseInt(request.getParameter("course_id").trim());
         String course_name=request.getParameter("course_name").trim();
         String course_code=request.getParameter("course_code").trim();
         boolean res=m.addCourse(id, course_code, course_name);
         if(res)
         {
         	session.setAttribute("isCourseAdded", true);
         	response.sendRedirect("regCoursesP.jsp");
         }
         else
         	response.sendRedirect("errorPage.jsp");
         %>
</body>
</html>