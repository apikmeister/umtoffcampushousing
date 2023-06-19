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
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f5f5f5;--%>
<%--        }--%>

<%--        .container {--%>
<%--            max-width: 400px;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 20px;--%>
<%--            background-color: #fff;--%>
<%--            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);--%>
<%--            border-radius: 4px;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            text-align: center;--%>
<%--            color: #333;--%>
<%--        }--%>

<%--        label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 10px;--%>
<%--            font-weight: bold;--%>
<%--            color: #555;--%>
<%--        }--%>

<%--        input[type="text"], input[type="email"], input[type="password"] {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border: 1px solid #ddd;--%>
<%--            border-radius: 4px;--%>
<%--            box-sizing: border-box;--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>

<%--        input[type="submit"] {--%>
<%--            background-color: #4CAF50;--%>
<%--            color: #fff;--%>
<%--            border: none;--%>
<%--            padding: 10px 20px;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            font-size: 16px;--%>
<%--        }--%>

<%--        input[type="submit"]:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>

<%--        .form-group {--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body class="bg-gray-100">
<jsp:include page="Navbar.jsp" />
<div class="container mx-auto p-6 h-full flex items-center flex-col justify-center">
    <h1 class="text-3xl text-center mb-6">Off-Campus Housing Registration</h1>
    <form action="RegistrationServlet" method="POST">
        <div class="mb-4">
            <label for="uid" class="block font-bold text-gray-700">Username:</label>
            <input type="text" id="uid" name="uid" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
        </div>

        <div class="mb-4">
            <label for="email" class="block font-bold text-gray-700">Email:</label>
            <input type="email" id="email" name="email" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
        </div>

        <div class="flex mb-4">
            <div class="w-1/2 mr-2">
                <label for="firstName" class="block font-bold text-gray-700">First Name:</label>
                <input type="text" id="firstName" name="firstName" required
                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
            </div>

            <div class="w-1/2 ml-2">
                <label for="lastName" class="block font-bold text-gray-700">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required
                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
            </div>
        </div>

        <div class="mb-4">
            <label for="password" class="block font-bold text-gray-700">Password:</label>
            <input type="password" id="password" name="password" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
        </div>

        <div class="mb-4">
            <label for="confirmPassword" class="block font-bold text-gray-700">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
        </div>

        <div class="mb-4">
            <label class="block font-bold text-gray-700">Role:</label>
            <div class="flex items-center">
                <input type="radio" id="student" name="role" value="student" required
                       class="mr-2">
                <label for="student" class="text-gray-700">Student</label>
            </div>
            <div class="flex items-center">
                <input type="radio" id="landlord" name="role" value="landlord" required
                       class="mr-2">
                <label for="landlord" class="text-gray-700">Landlord</label>
            </div>
        </div>

        <div class="mb-4 flex items-center">
            <input type="checkbox" name="agreement" id="agreement"
                   class="form-checkbox h-4 w-4 text-blue-500" required>
            <label for="agreement" class="ml-2"><a href="#" class="text-blue-500">Terms & Conditions</a></label>
        </div>

        <button type="submit"
                class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">Register</button>
    </form>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>
