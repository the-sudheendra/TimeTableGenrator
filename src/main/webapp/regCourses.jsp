<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="database.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<link rel="stylesheet" href="regCourses.css" />
</head>
<body>
	<%
	mysql m = (mysql) session.getAttribute("mysql");
	Student st = (Student) session.getAttribute("student_details");
	if (st == null || !st.isLogin()) {

		response.sendRedirect("index.html");
		return;
	}
	if (session.getAttribute("isSuccessfullyRegister") != null) {

		boolean status = (boolean) session.getAttribute("isSuccessfullyRegister");
		if (status) {
	%>
	<script>
		alert("Courses Successfully added");
	</script>
	<%
	}
	session.setAttribute("isSuccessfullyRegister", false);
	}
	%>
	<%@ include file="header.jsp"%>
	<form action="submitCourse.jsp" onsubmit=" return valid()"
		method="post">
		<table>
			<thead>
				<tr>
					<th>S.no</th>
					<th>Courses Code</th>
					<th>Course Name</th>
					<th>Opt</th>
				</tr>
			</thead>
			<tbody>
				<%!boolean isRegister(ArrayList<Course> al, int id) {

		for (Course i : al) {
			if (i.getId() == id)
				return true;
		}
		return false;
	}%>
				<%
				st = (Student) session.getAttribute("student_details");
				if (st == null) {
					response.sendRedirect("index.html");
					return;
				}
				ArrayList<Course> alRegCourse = st.getStudentCourses();
				//int noOfCoursesRegistered=st.getStudentCourses().size();

				m = (mysql) session.getAttribute("mysql");

				for (Course cou : m.allAvailableCourses()) {
					out.println("<tr>");
					String temp = cou.getId() + "-" + cou.getCourseCode() + "-" + cou.getCourseName();
					out.println("<td>" + cou.getId() + "</td>");
					out.println("<td>" + cou.getCourseCode() + "</td>");
					out.println("<td>" + cou.getCourseName() + "</td>");
					if (isRegister(alRegCourse, cou.getId())) {
						out.println("<td class=\" enrolled \"> Enrolled </td>");

					} else {
						out.println("<td> <input type=\"checkbox\" name=\"course\" value= \" " + temp + " \" onclick=\" return fun1("
						+ (8 - alRegCourse.size()) + ")\" /> </td>");

					}
					out.println("</tr>");

				}
				%>
			</tbody>
		</table>
		<button class="btn" id="Button" type="submit">Submit</button>
	</form>
</body>
<script type="text/javascript">
	document.getElementById("Button").disabled = false;
	document.getElementById("Button").style.backgroundColor = "#99ff66";

	var funForChecked = function() {
		alert("You Are Ready Enrolled This Course ");

		return false;
	}
	var valid = function() {
		let courses = document.getElementsByName('course');
		let c = 0;
		for (let i = 0; i < courses.length; i++) {
			if (courses[i].checked == true) {
				c++;
			}
		}
		if (c == 0) {
			alert("Please select atleast one coures");
			return false;
			a
		}

		return true;
	}
	var fun1 = function(a) {
		let courses = document.getElementsByName('course');
		let c = 0;
		for (let i = 0; i < courses.length; i++) {
			if (courses[i].checked == true) {
				c++;
			}
		}
		if (c == 0) {
			document.getElementById("Button").disabled = false;
			document.getElementById("Button").style.backgroundColor = "#99ff66";

		}
		if (c > a) {
			alert("You can't enroll more than 8 course...");

			return false;
		}
		if (c >= 1) {

			document.getElementById("Button").disabled = false;
			document.getElementById("Button").style.backgroundColor = "#226600";

		}

		return true;
	}
</script>
</html>