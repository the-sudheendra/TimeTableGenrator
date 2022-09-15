<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="regCoursesP.css" />
</head>
<body>
	<%@ include file="headerP.jsp"%>
	<%
	mysql m = (mysql) session.getAttribute("mysql");

	Professor pro = (Professor) session.getAttribute("professor_details");
	if (pro == null || !pro.isLogin()) {
		response.sendRedirect("index.html");
		return;
	}

	ArrayList<Course> allCourses = m.allAvailableCourses();

	if (session.getAttribute("isProAdd") != null) {

		boolean status = (boolean) session.getAttribute("isProAdd");
		if (status) {
	%>
	<script>
		alert("Professor Added Successfully added");
	</script>
	<%
	}
	session.setAttribute("isProAdd", false);
	}

	if (session.getAttribute("isStudentAdd") != null) {

	boolean status = (boolean) session.getAttribute("isStudentAdd");
	if (status) {
	%>
	<script>
		alert("Student Successfully added");
	</script>
	<%
	}
	session.setAttribute("isStudentAdd", false);
	}

	if (session.getAttribute("isTimeTableAdded") != null) {

	boolean status = (boolean) session.getAttribute("isTimeTableAdded");
	if (status) {
	%>
	<script>
		alert("New Slots are added Successfully");
	</script>
	<%
	}
	session.setAttribute("isTimeTableAdded", false);
	}
	if (session.getAttribute("isCourseAdded") != null) {

	boolean status = (boolean) session.getAttribute("isCourseAdded");
	if (status) {
	%>
	<script>
		alert("Course  added Successfully ");
	</script>
	<%
	}
	session.setAttribute("isCourseAdded", false);
	}
	%>
	<div class="container">
		<div class="addStudent">
			<h4>Add Student</h4>
			<form action="addStudent.jsp" method="get">
				<label>Id</label> <input type="text" name="student_id"
					placeholder="Student id" required /> <label>First Name</label> <input
					type="text" name="student_first_name" placeholder="First Name"
					required /> <label>Last Name</label> <input type="text"
					name="student_last_name" placeholder="Last Name" required /> <label>Password</label>
				<input type="password" name="student_password"
					placeholder="Password" required />
				<button type="submit">Add</button>
			</form>
		</div>
		<div class="addProfessor">
			<h4>Add Professor</h4>
			<form action="addProfessor.jsp" method="get">
				<label>Id</label> <input type="text" name="pro_id"
					placeholder="Professor id" required /> <label>First Name</label> <input
					type="text" name="pro_first_name" placeholder="First Name" required />
				<label>Last Name</label> <input type="text" name="pro_last_name"
					placeholder="Last Name" required /> <label>Password</label> <input
					type="password" name="pro_password" placeholder="Password" required />
				<button type="submit">Add</button>
			</form>
		</div>
		<div class="addCourse">
			<h4>Add Course</h4>
			<form action="addCourse.jsp" method="get">
				<label>Id</label> <input type="text" name="course_id"
					placeholder="Course id" required /> <label>Name</label> <input
					type="text" name="course_name" placeholder="Course name" required />
				<label>Course Code</label> <input type="text" name="course_code"
					placeholder="Course Code" required />
				<button type="submit">Add</button>
			</form>
		</div>
		<%
		String arr[] = { "", "Monday", "Tuesday", "Wednesday", "Thursday", "Saturday" };
		HashMap<Integer, HashSet<Integer>> hm = m.getReservedSlots();
		%>
		<div class="addTimeTable">
			<h4>Add Time table</h4>
			<form action="addTimeTable.jsp" method="get">
				<label>Select Slot</label> <select name="day_id_slotId">
					<%
					for (int dayId = 1; dayId <= 5; dayId++) {
						out.println("<optgroup  label=\"" + arr[dayId] + "\">");
						for (Slots st : m.getAllSlots()) {
							if (hm.get(dayId).contains(st.getId())) {
					%>
					<option value="<%=dayId + "-"%> <%=st.getId()%>" disabled><%=st.getStart() + " - " + st.getEnd()%></option>
					<%
					} else {
					%>
					<option value="<%=dayId + "-"%> <%=st.getId()%>"><%=st.getStart() + " - " + st.getEnd()%></option>
					<%
					}
					}
					out.println("</optgrp>");
					}
					%>
				</select> <label>Course id</label> <select name="course_id">
					<%
					for (Course cou : m.allAvailableCourses()) {
						out.println("<option  value=\" " + cou.getId() + "\">" + cou.getCourseName() + "</option>");
					}
					%>
				</select> <label> Is Lab: </label> <label for="yes">Yes</label> <input
					id="yes" type="radio" name="is_lab" value="Yes" /> <label for="no">No</label>
				<input id="no" type="radio" name="is_lab" value="No" /> <label
					for="hall_select">Lab id</label> <select id="hall_select"
					name="hall_id">
					<%
					for (String hall : m.getAllHalls()) {
						out.println("<option  value=\" " + hall + " \" >" + hall + "</option>");
					}
					%>
				</select>
				<button type="submit">Add</button>
			</form>
		</div>
	</div>
<%-- 	<div class="enrollCourseP">
			<h4>Add Course</h4>
			<form action="enrollCourseP.jsp" method="get">
				<select name="enrollCourse">
				<%
				for(Course c:m.allAvailableCourses())
				{
				%>
				<option value="<%=c.getId()%>"><%=c.getCourseName() %></option>
				<%} %>
				</select>
			</form>
		</div> --%>
</body>
</html>