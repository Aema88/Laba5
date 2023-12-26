import doroshenko.Student;

import javax.swing.plaf.nimbus.State;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private static final String URL = "jdbc:postgresql://localhost:5432/Java";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "postgres";
    private static Connection connection;
    static {
        try{
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Student> GetStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        Statement statement = connection.createStatement();
        String SQL = "SELECT * FROM Student";
        ResultSet resultSet = statement.executeQuery(SQL);
        while(resultSet.next()){
            Student student = new Student();
            student.setId(resultSet.getInt("id"));
            student.setName(resultSet.getString("name"));
            student.setEmail(resultSet.getString("email"));
            student.setSurname(resultSet.getString("surname"));
            student.setGroup(resultSet.getString("sgroup"));
            student.setFaculty(resultSet.getString("faculty"));
            students.add(student);
        }
        return students;
    }
    public void AddStudent(Student student) throws SQLException {
        PreparedStatement preparedStatement =
                connection.prepareStatement("INSERT INTO student VALUES (?,?,?,?,?)");
        preparedStatement.setString(1,student.getName());
        preparedStatement.setString(2,student.getSurname());
        preparedStatement.setString(3,student.getEmail());
        preparedStatement.setString(4,student.getGroup());
        preparedStatement.setString(5,student.getFaculty());
        preparedStatement.executeUpdate();
    }
    public Student FindStudent(Integer id) throws SQLException {
        PreparedStatement preparedStatement =
                connection.prepareStatement("SELECT * from student where id = ?");
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        Student student = new Student();
        while(resultSet.next()){

            student.setId(resultSet.getInt("id"));
            student.setName(resultSet.getString("name"));
            student.setEmail(resultSet.getString("email"));
            student.setSurname(resultSet.getString("surname"));
            student.setGroup(resultSet.getString("sgroup"));
            student.setFaculty(resultSet.getString("faculty"));
        }
        return student;
    }
}

