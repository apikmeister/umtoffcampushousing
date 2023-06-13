<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/13/2023
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Maintenance Form</title>
</head>
<body>
<h1>Maintenance Form</h1>
<form action="MaintenanceServlet" method="post">
    <input type="hidden" name="action" value="${param.action}">
    <input type="hidden" name="id" value="${param.id}">

    <label for="title">Title:</label>
    <input type="text" id="title" name="title" value="${maintenance.title}">
    <br>
    <label for="description">Description:</label>
    <textarea id="description" name="description">${maintenance.description}</textarea>
    <br>
    <label for="status">Status:</label>
    <input type="text" id="status" name="status" value="${maintenance.status}">
    <br>
    <button type="submit">Submit</button>
</form>
</body>
</html>
