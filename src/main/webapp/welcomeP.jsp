<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1" errorPage="errorPage.jsp" %>
<%@page import="entities.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%!
  public String greetings()
  {
  	Calendar c = Calendar.getInstance();
  	int hours = c.get(Calendar.HOUR_OF_DAY);
  	
       if(hours>=1 && hours<=12){
           return "Good Morning! ";
       }
       else if(hours>=12 && hours<=16)
       {
      	 return "Good Afternoon! ";
       }
       else if(hours>=16 && hours<=21)
       {
      	 return "Good Evening! ";
       }
      return "Good Night! ";
      	 
      	 
  }
  
  %>
<%
  mysql m = (mysql) session.getAttribute("mysql");
  Professor pro = (Professor) session.getAttribute("professor_details");
  if (pro == null || !pro.isLogin()) {
  	
  	response.sendRedirect("index.html");
  	return;
  }
  ArrayList<String> alHalls=m.getAllHalls();

  %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="welcomeS.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <meta charset="ISO-8859-1">
    <title><%="welcome@" + pro.getId()%></title>
    <style type="text/css">
     table
    {
    width:100%;
    text-align:center;
      border-collapse: collapse;
      over-flow:hidden;
    
    }
 th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}
a:link, a:visited {
width:100%;
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
    
    caption {
  display: table-caption;
  text-align: center;
  font-size:25px;	
   font-style: oblique;
  font-weight: bold;
}
    </style>
  </head>
  <body>
    <%@ include file="headerP.jsp" %>
    <div class="wallpaper">
      <img src="https://img.freepik.com/free-photo/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28312.jpg?w=996&t=st=1659939410~exp=1659940010~hmac=99513e28343f5c59d6cd7baca42ef512fd056ea4d5820e36b378200feec24e0f" />
      <h2 class="greetings" > <%= greetings()+ pro.getLastName()%></h2>
    </div>
    <div class="Hallviews">
	<table>
	<caption><%=alHalls.size()%>Hall Views</caption>
	
	<tbody>
		<tr>
	<%
	for(String i:alHalls)
	{
		%>
	
		<td><a href="hallView.jsp?id=<%=i%>"><%=i.toUpperCase()%></a></td>
		
		<% 
	}
	%>
	</tr>
	</tbody>
	</table>    
    </div>
  </body>
</html>