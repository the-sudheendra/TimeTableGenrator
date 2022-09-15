package database;

import entities.*;
import java.util.*;

import java.sql.*;

public class mysql {

  static String dbName = "college";
  static String port = "3306";
  static String hostname = "database-1.ckmwbrm2zkd4.us-east-1.rds.amazonaws.com";
  static String password = "kanna123456";
  static String userName = "admin";
  static String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" +
    password;
  static Statement st = null;
  static PreparedStatement pst = null;
  static Connection con = null;

  static {
    try {
      Class.forName("com.mysql.jdbc.Driver");

      con = DriverManager.getConnection(jdbcUrl);

      st = con.createStatement();

    } catch (Exception e) {
      System.out.println(e.getMessage());
    }

  }

  public Student getStudentDetails(String id) throws ClassNotFoundException, SQLException {

    String q1 = "select * from students where id=" + id;
    ResultSet rs = st.executeQuery(q1);
    Student stu = new Student();
    while (rs.next()) {

      stu.setId(rs.getInt("id"));
      stu.setFirstName(rs.getString("f_name"));
      stu.setLastName(rs.getString("l_name"));
      stu.setPassword(rs.getString("password"));

    }
    return stu;

  }

  public boolean checkValidUser(String id, String psw) throws ClassNotFoundException, SQLException {

    ResultSet rs = st.executeQuery("select password from students where id = " + id);

    if (rs.next()) {

      String abc = rs.getString("password");

      if (abc.equals(psw)) {
        return true;
      }
    }
    return false;
  }

  public ArrayList < Course > getCourses(Student stu) throws SQLException {
    String q = "select id, CourseCode, CourseName from subjects where id in\r\n" +
      "( select DISTINCT(subject_id) from student_alloc where student_id = " + stu.getId() + ")";

    ResultSet rs = st.executeQuery(q);
    ArrayList < Course > al = new ArrayList < > ();
    while (rs.next()) {
      al.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(1)));
    }
    return al;

  }

  public ArrayList < TimeTable > getStudentTimeTable(Student stu) throws SQLException {

    String q = "select d.id , d.name as Day , sl.id, sl.start , sl.end  , sub.id as sub_id, sub.CourseCode ,sub.CourseName,tt.is_Lab, tt.hall_id  from time_table as tt \n" +
      " join days as d on d.id=tt.day_id join slots as sl on sl.id=tt.slot_id \n" +
      " join subjects as sub on sub.id=tt.sub_id \n" +
      " where sub_id  in (select subject_id from student_alloc where student_id= " + stu.getId() +
      " ) order by d.id , sl.id";

    ResultSet rs = st.executeQuery(q);
    ArrayList < TimeTable > al = new ArrayList < > ();

    while (rs.next()) {
      Day d = new Day(rs.getInt(1), rs.getString(2));
      Slots sl = new Slots(rs.getInt(3), rs.getString(4), rs.getString(5));
      Course c = new Course(rs.getInt(6), rs.getString(7), rs.getString(8));
      TimeTable tt = new TimeTable(d, sl, c, rs.getInt(9) == 0 ? false : true, rs.getString(10));
      al.add(tt);
    }

    return al;

  }

  public ArrayList < Slots > getAllSlots() throws SQLException {
    ResultSet rs = st.executeQuery("select * from slots");
    ArrayList < Slots > al = new ArrayList < > ();
    while (rs.next()) {
      al.add(new Slots(rs.getInt(1), rs.getString(2), rs.getString(3)));
    }
    return al;
  }
  public ArrayList < String > getAllHalls() throws SQLException {
    ResultSet rs = st.executeQuery("select * from hall");
    ArrayList < String > al = new ArrayList < > ();
    while (rs.next()) {
      al.add(rs.getString(1));
    }
    return al;
  }

  public ArrayList < Course > allAvailableCourses() throws SQLException {
    String q = "select * from subjects order by id";
    ResultSet rs = st.executeQuery(q);
    ArrayList < Course > al = new ArrayList < > ();
    while (rs.next()) {
      al.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3)));
    }

    return al;
  }

  public Student addCourse(Student st, String arr[]) throws SQLException {

    if (arr != null) {

      String q = "insert into student_alloc values (?,?)";

      ArrayList < Course > tempCourseAl = new ArrayList < Course > ();
      ArrayList < Course > stuCourse = st.getStudentCourses();
      for (int i = 0; i < arr.length; i++) {
        String temp[] = arr[i].split("-");
        int courseId = Integer.parseInt(temp[0].trim());
        pst = con.prepareStatement(q);
        pst.setInt(1, st.getId());
        pst.setInt(2, courseId);
        if (pst.executeUpdate() >= 1) {

          Course tempCourse = new Course(courseId, temp[1], temp[2]);
          tempCourseAl.add(tempCourse);
        }
        stuCourse.addAll(tempCourseAl);

      }

      st.setStudentCourses(stuCourse);

    }
    return st;

  }

  public boolean checkValidProfessor(String id, String psw) throws SQLException {
    ResultSet rs = st.executeQuery("select password from professors where id = " + id);

    if (rs.next()) {

      String abc = rs.getString("password");

      if (abc.equals(psw)) {
        return true;
      }
    }
    return false;
  }

  public Professor getProfessorDetails(String id) throws ClassNotFoundException, SQLException {

    String q1 = "select * from professors where id=" + id;
    ResultSet rs = st.executeQuery(q1);
    Professor pro = new Professor();
    while (rs.next()) {

      pro.setId(rs.getInt("id") + "");
      pro.setFirstName(rs.getString("f_name"));
      pro.setLastName(rs.getString("l_name"));
      pro.setPassword(rs.getString("password"));

    }
    return pro;

  }

  public ArrayList < TimeTable > getProfessorTimeTable(Professor pro) throws SQLException {

    String q = "select d.id , d.name as Day , sl.id, sl.start , sl.end  , sub.id as sub_id, sub.CourseCode ,sub.CourseName,tt.is_Lab, tt.hall_id  from time_table as tt \n" +
      " join days as d on d.id=tt.day_id join slots as sl on sl.id=tt.slot_id \n" +
      " join subjects as sub on sub.id=tt.sub_id \n" +
      " where sub_id  in (select subject_id from professor_alloc where professor_id= " + pro.getId() +
      " ) order by d.id , sl.id";

    ResultSet rs = st.executeQuery(q);
    ArrayList < TimeTable > al = new ArrayList < > ();

    while (rs.next()) {
      Day d = new Day(rs.getInt(1), rs.getString(2));
      Slots sl = new Slots(rs.getInt(3), rs.getString(4), rs.getString(5));
      Course c = new Course(rs.getInt(6), rs.getString(7), rs.getString(8));
      TimeTable tt = new TimeTable(d, sl, c, rs.getInt(9) == 0 ? false : true, rs.getString(10));
      al.add(tt);
    }

    return al;

  }

  public ArrayList < Course > getProCourses(Professor pro) throws SQLException {
    String q = "select id, CourseCode, CourseName from subjects where id in\r\n" +
      "( select DISTINCT(subject_id) from professor_alloc where professor_id = " + pro.getId() + ")";

    ResultSet rs = st.executeQuery(q);
    ArrayList < Course > al = new ArrayList < > ();
    while (rs.next()) {
      al.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(1)));
    }
    return al;

  }

  public boolean addCourse(int courseId, String courseCode, String courseName) throws SQLException {

    String q = "insert into subjects values (?, ?, ?)";

    PreparedStatement pst = con.prepareStatement(q);
    pst.setInt(1, courseId);
    pst.setString(2, courseCode);
    pst.setString(3, courseName);

    return pst.executeUpdate() > 0 ? true : false;
  }
  public boolean addStudent(int stuId, String firstName, String lastName, String psw) throws SQLException {

    String q = "insert into students values (? ,?, ?, ?)";

    PreparedStatement pst = con.prepareStatement(q);
    pst.setInt(1, stuId);
    pst.setString(2, firstName);
    pst.setString(3, lastName);
    pst.setString(4, psw);

    return pst.executeUpdate() > 0 ? true : false;
  }
  public boolean addProfessor(int proId, String firstName, String lastName, String psw) throws SQLException {

	    String q = "insert into professors values (? ,?, ?, ?)";

	    PreparedStatement pst = con.prepareStatement(q);
	    pst.setInt(1, proId);
	    pst.setString(2, firstName);
	    pst.setString(3, lastName);
	    pst.setString(4, psw);

	    return pst.executeUpdate() > 0 ? true : false;
	  }

  public boolean addTimeTable(int dayId, int slotId, int subId, int isLab, String hall_id) throws SQLException {

    String q = "insert into time_table values (?, ?, ?,?,?)";

    PreparedStatement pst = con.prepareStatement(q);
    pst.setInt(1, dayId);
    pst.setInt(2, slotId);
    pst.setInt(3, subId);
    pst.setInt(4, isLab);
    pst.setString(5, hall_id);

    return pst.executeUpdate() > 0 ? true : false;
  }

  public HashMap < Integer, HashSet < Integer >> getReservedSlots() throws SQLException {

    String q = "select day_id, slot_id from time_table order by day_id";

    ResultSet rs = st.executeQuery(q);

    HashMap < Integer, HashSet < Integer >> hm = new HashMap < > ();
    int dayId = 1;
    while (rs.next()) {
      while (dayId < rs.getInt(1)) {
        if (!hm.containsKey(dayId)) {
          hm.put(dayId, new HashSet < > ());
        }

        dayId++;

      }
      if (dayId == rs.getInt(1)) {
        if (hm.containsKey(dayId)) {

          HashSet < Integer > temp = hm.get(dayId);

          temp.add(rs.getInt(2));
          hm.put(dayId, temp);

        } else {
          HashSet < Integer > temp = new HashSet < > ();
          temp.add(rs.getInt(2));
          hm.put(dayId, temp);
        }

      }
    }

    return hm;
  }
  public ArrayList < Hall > getHallDetails(String hID) throws SQLException {
	     String q = "select day_id, sl.id, sl.start, sl.end, tt.hall_id , sub.id  ,sub.CourseCode, sub.CourseName,  tt.is_lab from time_table as tt\r\n"
	     		+ "join  subjects as sub on  sub.id=tt.sub_id \r\n"
	     		+ "join slots as sl on sl.id=tt.slot_id \r\n"
	     		+ "where hall_id= \""+hID+"\" order by day_id,slot_id ";
	     		
	     	
	     	
	     		
	    		 
	     ArrayList < Hall > alHall = new ArrayList < > ();
	     ResultSet rs = st.executeQuery(q);
	     while (rs.next()) {
	    	 
	         String hallId = rs.getString(5);
	         Course tempCourse = new Course(rs.getInt(6), rs.getString(7), rs.getString(8));
	         Slots tempSlot = new Slots(rs.getInt(2), rs.getString(3), rs.getString(4));
	         int isLab = rs.getInt(9);
	         Hall tempHall = new Hall(hallId, tempCourse, tempSlot,rs.getInt(1), isLab==1?true:false);
	         alHall.add(tempHall);

	     }
	     return alHall;

	 }

}