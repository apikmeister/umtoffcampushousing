<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/5/2023
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/header.js"></script>
</head>
<body>
<header class="fixed top-0 left-0 w-full py-3 bg-transparent transition duration-1000 z-50 flex items-center content-between">
    <nav class="navbar container mx-auto flex items-center">
        <div class="w-1/4">
            <a href="${pageContext.request.contextPath}">
                <img src="${pageContext.request.contextPath}/img/logoUMT.png" width="45px" alt="logo"></a>
        </div>
        <div class="w-1/2">
            <ul class="flex text-white text-center justify-around">
                <a href="propertyServlet">
                    <li>Browse Listing</li>
                </a>
                <a href="housemateFinder.jsp">
                    <li>Find Roommates</li>
                </a>
                <c:if test="${sessionScope.role != null && sessionScope.role == 'landlord'}">
                    <a href="addProperty.jsp">
                        <li>Add a Listing</li>
                    </a>
                </c:if>
                <a href="resources.jsp">
                    <li>Resources</li>
                </a>
            </ul>
        </div>
        <div class="w-1/4 text-white">
            <c:if test="${sessionScope.username == null}">
                <!-- User is not logged in -->
                <ul class="flex justify-end gap-3">
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.username != null}">
                <!-- User is logged in -->
                <div class="flex justify-end gap-3">
                    <p>Hi, <a href="userProfile.jsp" class="underline">${sessionScope.username}</a></p>
                    <a href="logout">Logout</a>
                </div>
            </c:if>
        </div>
    </nav>
</header>
</body>
</html>
