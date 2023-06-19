<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/15/2023
  Time: 1:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.UserDao" %>
<html>
<head>
    <title>Edit User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body {
            background-color: #f6f5fb;
        }

        .profile-card {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 2rem;
            margin-top: 2rem;
        }

        .profile-card h2 {
            font-size: 1.5rem;
            color: #663399;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="bg-[#2f2f2f]">
<c:set var="username" value="${sessionScope.username}"/>
<c:set var="user" value="${UserDao.getUserByUid(username)}" scope="request"/>
<jsp:include page="Navbar.jsp"/>
<div class="p-12">
    <div class="profile-card max-w-[600px] ">
        <h2 class="text-3xl text-purple-700 mb-4">Edit Profile</h2>
        <form action="EditProfileServlet" method="post">
            <div class="mb-4">
                <label for="username" class="block text-gray-700 font-bold mb-2">Username:</label>
                <input type="text" id="username" name="username" value="${user.username}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg">
            </div>
            <div class="mb-4">
                <label for="email" class="block text-gray-700 font-bold mb-2">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg">
            </div>
            <div class="mb-4">
                <label for="firstName" class="block text-gray-700 font-bold mb-2">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="${user.firstName}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg">
            </div>
            <div class="mb-4">
                <label for="lastName" class="block text-gray-700 font-bold mb-2">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="${user.lastName}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg">
            </div>
            <div class="mb-4">
                <label for="role" class="block text-gray-700 font-bold mb-2">Role:</label>
                <input type="text" id="role" name="role" value="${user.role}" required readonly
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed">
            </div>
            <div class="flex justify-center">
                <input type="submit" value="Save Changes"
                       class="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
            </div>
        </form>
    </div>
</div>
<jsp:include page="Footer.jsp"/>
</body>
</html>
