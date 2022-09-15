package entities;

public class Slots {

  private int id;
  private String start;
  private String end;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getStart() {
    return start;
  }

  public void setStart(String start) {
    this.start = start;
  }

  public String getEnd() {
    return end;
  }

  public void setEnd(String end) {
    this.end = end;
  }

  public Slots(int id, String start, String end) {
    super();
    this.id = id;
    this.start = start;
    this.end = end;
  }

  public Slots() {

  }

}