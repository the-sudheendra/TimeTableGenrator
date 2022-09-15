package entities;

public class TimeTable {

  private Day day;
  private Slots slot;
  private Course course;
  private boolean isLab;
  private String hallId;
  public String getHallId() {
    return hallId;
  }
  public void setHallId(String hallId) {
    this.hallId = hallId;
  }
  public boolean isLab() {
    return isLab;
  }
  public void setLab(boolean isLab) {
    this.isLab = isLab;
  }

  public TimeTable(Day day, Slots slot, Course course, boolean isLab, String hallId) {
    super();

    this.day = day;
    this.slot = slot;
    this.course = course;
    this.isLab = isLab;
    this.hallId = hallId;
  }

  public Day getDay() {
    return day;
  }
  public void setDay(Day day) {
    this.day = day;
  }
  public Slots getSlot() {
    return slot;
  }
  public void setSlot(Slots slot) {
    this.slot = slot;
  }
  public Course getCourse() {
    return course;
  }
  public void setCourse(Course course) {
    this.course = course;
  }

}