package entities;

public class Course {
  private int id;
  private String courseCode;
  private String courseName;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public Course(int id, String courseCode, String courseName) {
    super();
    this.id = id;
    this.courseCode = courseCode;
    this.courseName = courseName;
  }

  public Course() {

  }

  public String getCourseCode() {
    return courseCode;
  }

  public void setCourseCode(String courseCode) {
    this.courseCode = courseCode;
  }

  public String getCourseName() {
    return courseName;
  }

  public void setCourseName(String courseName) {
    this.courseName = courseName;
  }

}