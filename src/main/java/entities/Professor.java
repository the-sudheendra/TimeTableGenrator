package entities;

import java.util.ArrayList;

public class Professor {

  private String id;
  private String firstName;
  private String lastName;
  private String password;
  private boolean isLogin;
  private ArrayList < Course > professorCourses;
  private ArrayList < TimeTable > professorTimeTable;

  public boolean isLogin() {
    return isLogin;
  }

  public void setLogin(boolean isLogin) {
    this.isLogin = isLogin;
  }

  public ArrayList < Course > getProfessorCourses() {
    return professorCourses;
  }

  public void setProfessorCourses(ArrayList < Course > professorCourses) {
    this.professorCourses = professorCourses;
  }

  public ArrayList < TimeTable > getProfessorTimeTable() {
    return professorTimeTable;
  }

  public void setProfessorTimeTable(ArrayList < TimeTable > professorTimeTable) {
    this.professorTimeTable = professorTimeTable;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
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

  public Professor() {

  }

  public Professor(String id, String firstName, String lastName, String password) {
    super();
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.password = password;
  }

}