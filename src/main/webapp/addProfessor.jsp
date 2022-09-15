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
<title>add Professor</title>
</head>
<body>
	<%
      mysql m= (mysql)session.getAttribute("mysql");
      
      int id=Integer.parseInt(request.getParameter("pro_id").trim());
      String pro_first_name=request.getParameter("pro_first_name").trim();
      String pro_last_name=request.getParameter("pro_last_name").trim();
      String pro_password=request.getParameter("pro_password").trim();
      boolean res=m.addProfessor(id, pro_first_name, pro_last_name, pro_password);
      if(res)
      {
      	session.setAttribute("isProAdd", true);
      	response.sendRedirect("regCoursesP.jsp");
      
      }
      else
      	response.sendRedirect("errorPage.jsp");
      %>
</body>
</html>