<%--
  Created by IntelliJ IDEA.
  User: doros
  Date: 25.10.2023
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="doroshenko.Student" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Form</title>
    <style>
        h1{
            text-align: center;
        }
        #page{
            width: 800px;
            margin: auto;
        }
        form{
            width: 400px;
            margin: auto;
        }
        input [type=submit]{
            margin: auto;
        }
    </style>
</head>

<body>
<div id="page">
    <h1>Hello world!</h1>
    <form>
        <table>
            <tbody>
            <tr>
                <td><label for="name">Name</label></td>
                <td><input id="name" type="text" name="name"></td>
            </tr>
            <tr>
                <td><label for="surname">Surname</label></td>
                <td><input id="surname" type="text" name="surname"></td>
            </tr>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input id="email" type="text" name="email"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" name="send" value="Submit">
    </form>
</div>

<% List<Student> students = (List<Student>) application.getAttribute("students"); %>
<c:if test = "${not empty param.send}">
    <%
        if(students == null){
            students = new LinkedList<Student>();
            application.setAttribute("students",students);
        }
        if(request.getParameter("name") != "" || request.getParameter("surname") != ""){
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setSurname(request.getParameter("surname"));
            student.setEmail(request.getParameter("email"));
            students.add(student);
        }
        response.sendRedirect("student.jsp");
    %>

</c:if>

<%
    if(students != null){
        out.println("<table class=\"list\"><tr><th>Name</th><th>Surname</th><th>Email</th></tr>");
        for(Student s : students){
            out.println("<tr><td>"+s.getName()+"</td><td>"+s.getSurname()+"</td><td>"+ s.getEmail()+"</td></tr>");
        }
        out.println("</table>");
    }
%>


</body>

</html>