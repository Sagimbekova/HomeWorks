package models;

public class Group {
    private int id;
    private String code;
    private int facultyID;

    public Group(int id, String code, int facultyID) {
        this.id = id;
        this.code = code;
        this.facultyID = facultyID;
    }

    public Group() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    @Override
    public String toString() {
        return "Group{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", facultyID=" + facultyID +
                '}';
    }
}
