<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="database.mysql"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<%
      mysql m = new mysql();
      	String id = request.getParameter("professor_id");
      	String psw = request.getParameter("professor_password");
      
      	if (m.checkValidProfessor(id, psw)) {
      		Professor pro = m.getProfessorDetails(id);
      		pro.setLogin(true);
      		ArrayList<TimeTable> tt=m.getProfessorTimeTable(pro);
      		pro.setProfessorTimeTable(tt);
      		pro.setProfessorCourses(m.getProCourses(pro));
      		session.setAttribute("professor_details",pro);
      		session.setAttribute("mysql",m);
      		response.sendRedirect("welcomeP.jsp");
      
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