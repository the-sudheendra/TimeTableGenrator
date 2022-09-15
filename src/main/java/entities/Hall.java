package entities;
public class Hall {

	private String hallId;
	private Course hallCourse;
	private Slots slot;
	private boolean isLab;
	int dayId;
	
	
	public Hall(String hallId, Course hallCourse, Slots slot,int dayId,
			boolean isLab) {
		super();
		this.dayId=dayId;
		this.hallId = hallId;
		this.hallCourse = hallCourse;
		this.slot = slot;
		this.isLab = isLab;
	}
	public int getDayId() {
		return dayId;
	}
	public void setDayId(int dayId) {
		this.dayId = dayId;
	}
	public boolean getIsLab() {
		return isLab;
	}
	public void setIsLab(boolean isLab) {
		this.isLab = isLab;
	}
	public String getHallId() {
		return hallId;
	}
	public void setHallId(String hallId) {
		this.hallId = hallId;
	}
	public Course getHallCourse() {
		return hallCourse;
	}
	public void setHallCourse(Course hallCourse) {
		this.hallCourse = hallCourse;
	}
	public Slots getSlot() {
		return slot;
	}
	public void setSlot(Slots slot) {
		this.slot = slot;
	}

	
	
	
}
