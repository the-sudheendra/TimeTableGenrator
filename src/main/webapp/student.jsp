<%@page import="database.mysql"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title></title>
</head>
<body>
	<%	
      mysql m = new mysql();
      String id = request.getParameter("student_id");
      String psw = request.getParameter("student_password");
      
      if (m.checkValidUser(id, psw)) {
      
      	Student st = m.getStudentDetails(id);
      	st.setLogin(true);
      	ArrayList<TimeTable> tt=m.getStudentTimeTable(st);
      	st.setStudentTimeTable(tt);
      	
      	st.setStudentCourses(m.getCourses(st));
      	
      	
      	session.setAttribute("student_details",st);
      	
      	session.setAttribute("mysql",m);
      	
      
      	response.sendRedirect("welcomeS.jsp");
      
      } else {
      %>
	<p style="color: red">
		Invalid Credentials .<a href="index.html"> Please try again.</a>
	</p>
	<%
      }
      %>
</body>
</html>