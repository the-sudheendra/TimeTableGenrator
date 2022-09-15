<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="database.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<%
  mysql m = (mysql) session.getAttribute("mysql");
  Student st = (Student) session.getAttribute("student_details");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Submit</h1>
	<%
      String Selectedcourse[]=request.getParameterValues("course");
      st=m.addCourse(st,Selectedcourse);
      
      
      session.setAttribute("isSuccessfullyRegister",true);
      
      ArrayList<TimeTable> tt=m.getStudentTimeTable(st);
      st.setStudentTimeTable(tt);
      response.sendRedirect("regCourses.jsp");
      
      
      %>
</body>
</html>