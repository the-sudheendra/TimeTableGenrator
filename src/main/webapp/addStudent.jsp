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
<title>add Student</title>
</head>
<body>
	<%
      mysql m= (mysql)session.getAttribute("mysql");
      
      int id=Integer.parseInt(request.getParameter("student_id").trim());
      String student_first_name=request.getParameter("student_first_name").trim();
      String student_last_name=request.getParameter("student_last_name").trim();
      String student_password=request.getParameter("student_password").trim();
      boolean res=m.addStudent(id, student_first_name, student_last_name, student_password);
      if(res)
      {
      	session.setAttribute("isStudentAdd", true);
      	response.sendRedirect("regCoursesP.jsp");
      
      }
      else
      	response.sendRedirect("errorPage.jsp");
      %>
</body>
</html>