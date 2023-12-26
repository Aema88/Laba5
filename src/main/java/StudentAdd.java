import doroshenko.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "StudentAdd", urlPatterns = {"/StudentAdd"})
public class StudentAdd extends HttpServlet {
    private DAO studentDAO = new DAO();
    protected void processRequest(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();

        if(request.getParameter("name") != "" || request.getParameter("surname") != ""){
            Student student = new Student(request.getParameter("name"),
                                          request.getParameter("surname"),
                                          request.getParameter("email"),
                                          request.getParameter("group"),
                                          request.getParameter("faculty"));
            studentDAO.AddStudent(student);
        }
        List<Student> students = new LinkedList<Student>();
        students = studentDAO.GetStudents();
        session.setAttribute("students" , students);
        response.sendRedirect("/student.jsp");

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
