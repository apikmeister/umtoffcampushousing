<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 4:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.UserDao" %>

<html>
<head>
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-[#2f2f2f]">
<jsp:include page="Navbar.jsp" />
<c:set var="username" value="${sessionScope.username}" />
<c:set var="user" value="${UserDao.getUserByUid(username)}" scope="request" />
<div class="flex h-full">
    <div class="bg-gray-800 text-white w-64 flex-shrink-0 pt-12">
        <div class="p-4">
            <h2 class="text-xl font-bold mb-4 text-center">Menu</h2>
            <ul class="space-y-2">
                <li>
                    <a href="userProfile.jsp" class="block py-2 px-4 rounded hover:bg-gray-700">User Profile</a>
                </li>
                <c:if test="${sessionScope.role == 'landlord'}">
                    <li>
                        <a href="#" onclick="loadContent('propertyListing.jsp')" class="block py-2 px-4 rounded hover:bg-gray-700">Property
                            Listing</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.role != 'landlord'}">
                    <li>
                        <a href="#" onclick="loadContent('propertyListing.jsp')" class="block py-2 px-4 rounded hover:bg-gray-700">Rental Listing</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <div class="flex-grow p-12" id="main-content">
        <div class="max-w-md mx-auto bg-white shadow-md rounded p-8 mt-8">
            <h2 class="text-2xl font-bold mb-4">User Profile</h2>
            <div>
                <p class="mb-2"><strong>Username:</strong> ${username}</p>
                <p class="mb-2"><strong>Email:</strong> ${user.email}</p>
                <p class="mb-2"><strong>First Name:</strong> ${user.firstName}</p>
                <p class="mb-2"><strong>Last Name:</strong> ${user.lastName}</p>
                <p class="mb-2"><strong>Role:</strong> ${user.role}</p>
            </div>
            <div class="mt-4">
                <a href="editUserProfile.jsp">
                    <button class="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Edit Profile
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp" />
<script>
    function loadContent(url) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var responseText = xhr.responseText;
                document.querySelector('#main-content').innerHTML = responseText;
            }
        };
        xhr.send();
    }
</script>
</body>
</html>
