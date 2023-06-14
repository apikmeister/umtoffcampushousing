<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 4/30/2023
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body class="bg-gray-100">
<div class="container mx-auto">
    <h1 class="text-3xl text-center my-6">If you are a student, or already registered</h1>
    <div class="max-w-md mx-auto bg-white shadow-md rounded-lg px-8 py-6">
        <h2 class="text-2xl text-purple-700 font-semibold mb-4">Login</h2>
        <form action="LoginServlet" method="post">
            <div class="mb-4">
                <label for="uid" class="block text-purple-700">Username</label>
                <input type="text" id="uid" name="uid" placeholder="Enter your username"
                       class="border-purple-700 border rounded-lg px-4 py-2 w-full">
            </div>
            <div class="mb-4">
                <label for="pwd" class="block text-purple-700">Password</label>
                <input type="password" id="pwd" name="pwd" placeholder="Enter your password"
                       class="border-purple-700 border rounded-lg px-4 py-2 w-full">
            </div>
            <button type="submit"
                    class="px-6 py-2 rounded-md purple-bg text-white hover:bg-purple-800 focus:bg-purple-800 focus:outline-none">Login</button>
        </form>
    </div>
</div>
</body>
</html>
