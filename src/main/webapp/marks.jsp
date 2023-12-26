<%--
    Document   : mark
    Created on : 15 дек. 2023 г., 01:19:51
    Author     : artem
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="doroshenko.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mark</title>
    <style>
        h1{
            text-align: center;
        }
        #page {
            width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        form {
            width: 400px;
            margin: 20px auto;
        }
        input[type=submit] {
            margin: auto;
        }
        .list, .list td, .list th {
            margin: auto;
            border: 1px solid black;
            border-collapse: collapse;
        }
        .list td, .list th {
            padding:10px;
        }
        body {

            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }
        #content{
            background-color: lightblue;
            width: 600px;
            margin: 20px auto;
        }
    </style>
</head>
<body>
<div id="page">

    <h1>Marks of student ID<c:out value ="${students.getId()}"/></h1>


    <table class="list">
        <tr>
            <th>Discipline</th>
            <th>Mark</th>
            <th>ECTS</th>
        </tr>
        <c:forEach var="disc" items="${marks}">
            <tr>
                <td><c:out value="${disc.getTitle()}"/></td>
                <td><c:out value="${disc.getMark_num()}"/></td>
                <td><c:out value="${disc.getMark_let()}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>