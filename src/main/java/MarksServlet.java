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

@WebServlet(name = "MarksServlet", urlPatterns = {"/marks"})
public class MarksServlet extends HttpServlet {
    private final DAO studentDAO = new DAO();
    protected void processRequest(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("id"));
        List<Grade> grades = studentDAO.FindMarks(id);
        session.setAttribute("students" , studentDAO.FindStudent(id));
        session.setAttribute("marks" , grades);
        response.sendRedirect("/marks.jsp");
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
