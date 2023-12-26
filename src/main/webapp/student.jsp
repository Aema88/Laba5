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
    <h1>Servlet</h1>
    <form method="post" action="StudentAdd">
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
            <tr>
                <td><label for="group">Group</label></td>
                <td><input id="group" type="text" name="group"></td>
            </tr>
            <tr>
                <td><label for="faculty">Faculty</label></td>
                <td><input id="faculty" type="text" name="faculty"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" name="send" value="Submit">
    </form>
</div>

<c:if test="${students.size() > 0}">
    <table class="list">
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Group</th>
            <th>Faculty</th>
        </tr>
        <c:forEach var ="student" items="${students}">
            <tr>
                <td><c:out value="${student.getName()}"/> </td>
                <td><c:out value="${student.getSurname()}"/> </td>
                <td><c:out value="${student.getEmail()}"/> </td>
                <td><c:out value="${student.getGroup()}"/> </td>
                <td><c:out value="${student.getFaculty()}"/> </td>
                <td>
                    <a href="/marks?id=${student.getId()}">Marks</a>
                </td>
            </tr>

        </c:forEach>
    </table>
</c:if>


</body>

</html>