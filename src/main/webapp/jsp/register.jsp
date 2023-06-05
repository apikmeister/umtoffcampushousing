<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/5/2023
  Time: 2:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Off-Campus Housing Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Off-Campus Housing Registration</h1>
    <form action="RegistrationServlet" method="POST">
        <label for="uid">Username:</label>
        <input type="text" id="uid" name="uid" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

<%--        <div class="form-group">--%>
<%--            <div>--%>
<%--                <label for="firstname">First Name:</label>--%>
<%--                <input type="text" id="firstname" name="firstname" required>--%>
<%--            </div>--%>

<%--            <div>--%>
<%--                <label for="lastname">Last Name:</label>--%>
<%--                <input type="text" id="lastname" name="lastname" required>--%>
<%--            </div>--%>
<%--        </div>--%>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <input type="checkbox" name="agreement" id="agreement">
        <label for="agreement"><a href="#">Terms</a></label>

        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
