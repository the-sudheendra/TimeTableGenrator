package entities;

import java.util.*;

public class Student {

  private int id;
  private String firstName;
  private String lastName;
  private String password;
  private boolean isLogin;
  private ArrayList < Course > studentCourses;
  private ArrayList < TimeTable > studentTimeTable;

  public ArrayList < TimeTable > getStudentTimeTable() {
    return studentTimeTable;
  }

  public void setStudentTimeTable(ArrayList < TimeTable > studentTimeTable) {
    this.studentTimeTable = studentTimeTable;
  }

  public ArrayList < Course > getStudentCourses() {
    return studentCourses;
  }

  public void setStudentCourses(ArrayList < Course > studentCourses) {
    this.studentCourses = studentCourses;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public boolean isLogin() {
    return isLogin;
  }

  public void setLogin(boolean isLogin) {
    this.isLogin = isLogin;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Student() {

  }

  public Student(int id, String firstName, String lastName, String password) {
    super();
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.password = password;
  }

}