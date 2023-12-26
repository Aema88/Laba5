public class Grade {
    public Integer id;
    public Integer student;
    public String discipline;
    public String ects;
    public Integer regular;

    public Grade(Integer id, Integer student, String discipline, String ects, Integer regular) {
        this.id = id;
        this.student = student;
        this.discipline = discipline;
        this.ects = ects;
        this.regular = regular;
    }
    public Grade(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudent() {
        return student;
    }

    public void setStudent(Integer student) {
        this.student = student;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    public String getEcts() {
        return ects;
    }

    public void setEcts(String ects) {
        this.ects = ects;
    }

    public Integer getRegular() {
        return regular;
    }

    public void setRegular(Integer regular) {
        this.regular = regular;
    }
}
