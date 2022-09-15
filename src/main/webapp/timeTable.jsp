<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@page import="entities.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Time Table</title>
<link rel="stylesheet" href="timeTable.css" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
      mysql m = (mysql) session.getAttribute("mysql");
      Student st = (Student) session.getAttribute("student_details");
      if (st == null || !st.isLogin()) {
      	
      	response.sendRedirect("index.html");
      	return;
      }
      
      if(st.getStudentCourses().size()==0)
      {
      	out.println("<h1 style=\" margin:50px \"> You enrolled 0 Courses No Time table to display</h1>");
      	return;
      }
      ArrayList<Slots> slotsAl = m.getAllSlots();
      
      ArrayList<TimeTable> timeTableAl = st.getStudentTimeTable();
      
      
      HashMap<Integer,TimeTable[]> table=new HashMap<>();
      int curDayId=0;
      String temp=LocalDate.now().getDayOfWeek().name();
      switch(temp)
      {
      case "MONDAY":curDayId=1;break;
      case "TUESDAY":curDayId=2;break;
      case "WEDNESDAY":curDayId=3;break;
      case "THURSDAY":curDayId=4;break;
      case "FRIDAY":curDayId=5;break;
      }
      
      %>
	<div id="table" class="time-table none">
		<table>
			<thead>
				<tr>
					<!-- Theory -->
					<th rowspan="2" class="left">Theory</th>
					<th class="left">Start</th>
					<%
              for (Slots s : slotsAl) {
              	if(s.getId()==7)
              	{
              		out.println("<th class=\"th_lunch\" rowspan=\" 4 \"><p>Lunch</p></th>");
              		continue;
              	}
              %>
					<th class="center"><%=s.getStart()%></th>
					<%
              }
              %>
				</tr>
				<tr>
					<th class="left">End</th>
					<%
              for (Slots s : slotsAl) {
              	if(s.getId()==7)
              	{
              		continue;
              	}
              %>
					<th class="center"><%=s.getEnd()%></th>
					<%
              }
              %>
				</tr>
				<!-- Lab -->
				<tr>
					<th rowspan="2" class="left">Lab</th>
					<th class="left">Start</th>
					<%
              for (Slots s : slotsAl) {
              	if(s.getId()==7)
              	{
              		continue;
              	}
              %>
					<th class="center"><%=s.getStart()%></th>
					<%
              }
              %>
				</tr>
				<tr>
					<th class="left">End</th>
					<%
              for (Slots s : slotsAl) {
              	if(s.getId()==7)
              	{
              		continue;
              	}
              %>
					<th class="center"><%=s.getEnd()%></th>
					<%
              }
              %>
				</tr>
			</thead>
			<tbody>
				<%
            int dayId = 1;
            TimeTable arr[] = new TimeTable[16];
            int slotId = 1;
            Arrays.fill(arr, null);
            for (TimeTable tt : timeTableAl) {
            
            	while (tt.getDay().getId() > dayId) {
            
            		while (slotId <= 15) {
            	arr[slotId] = null;
            	slotId++;
            		}
            
            		table.put(dayId, arr);
            
            		arr = new TimeTable[16];
            		dayId++;
            		slotId = 1;
            	}
            
            	if (tt.getDay().getId() == dayId) {
            
            		while (slotId < tt.getSlot().getId()) {
            	arr[slotId++] = null;
            
            		}
            		if (slotId == tt.getSlot().getId()) {
            
            	arr[slotId++] = tt;
            		}
            	}
            
            }
            
            //filling the empty slots of Lastcolumn in time Table		
            while (slotId <= 15) {
            	arr[slotId] = null;
            	slotId++;
            }
            // inserting last Day of time table in HashMap
            table.put(dayId, arr);
            dayId++;
            // INserting left days
            while (dayId <= 5) {
            
            	slotId = 1;
            	while (slotId <= 15) {
            		arr[slotId] = null;
            		slotId++;
            	}
            	table.put(dayId, arr);
            	dayId++;
            
            }
            // displaying Table:
            	boolean printLunch=true;
            
            for (int i = 1; i <= 5; i++) {
            	out.println("<tr>");
            	switch (i) {
            	case 1:
            		if(curDayId==1)
            		out.println("<td class=\"left today\"  rowspan=\"2\">Mon</td>");
            		else
            			out.println("<td class=\"left \"  rowspan=\"2\">Mon</td>");
            		break;
            	case 2:
            		if(curDayId==2)
            		out.println("<td class=\"left today\" rowspan=\"2\">Tue</td>");
            		else
            			out.println("<td class=\"left\" rowspan=\"2\">Tue</td>");
            
            			
            		break;
            	case 3:
            		if(curDayId==3)
            		out.println("<td class=\"left today\" rowspan=\"2\">Wed</td>");
            		else
            			out.println("<td class=\"left\" rowspan=\"2\">Wed</td>");
            
            		break;
            	case 4:
            		if(curDayId==4)
            		out.println("<td class=\"left today\" rowspan=\"2\">Thu</td>");
            		else
            			out.println("<td class=\"left\" rowspan=\"2\">Thu</td>");
            
            		break;
            	case 5:
            		if(curDayId==5)
            		out.println("<td class=\"left today\" rowspan=\"2\">Fri</td>");
            		else
            			out.println("<td class=\"left \" rowspan=\"2\">Fri</td>");
            
            		break;
            
            	}
            	
            
            	out.println("<td class=\"left\" >Theory</td>");
            	
            		for (int di = 1; di <= 15; di++) {
            
            			if(printLunch && di==7)
            			{
            				out.println("<td class=\"td_lunch\" rowspan=\"10\"><p>Lunch<p></td>");
            				printLunch=false;
            				continue;
            				
            			}
            			if(di==7)
            			{
            				
            				continue;
            				
            			}
            			
            			if (table.get(i)[di] != null && !table.get(i)[di].isLab())
            			{
            				out.println("<td  class=\"available\">" + table.get(i)[di].getCourse().getCourseName() +"<br>"+table.get(i)[di].getHallId() + "</td>");
            			}
            				
            			else {
            			
            				out.println("<td > - </td>");
            			}
            				}
            	
            
            		out.println("</tr>");
            		
            		out.println("<tr>");
            		out.println("<td class=\"left\">Lab</td>");
            		
            		for (int di = 1; di <= 15; di++) {
            
            			if(di==7)
            			{
            				continue;
            			}
            			
            			if (table.get(i)[di] != null && table.get(i)[di].isLab())
            			{
            				out.println("<td   class=\"available\" >" + table.get(i)[di].getCourse().getCourseName() +"<br>"+table.get(i)[di].getHallId() + "</td>");
            			}
            				
            			else {
            			
            				out.println("<td  > - </td>");
            			}
            				}
            		out.println("</tr>");
            
            
            }
            %>
			</tbody>
		</table>
	</div>
</body>
</html>