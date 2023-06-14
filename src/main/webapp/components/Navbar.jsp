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
<header class="fixed top-0 left-0 w-full py-3 px-20 bg-transparent transition duration-1000">
  <nav class="container mx-auto flex justify-between items-center">
    <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/logoUMT.png" width="45px" alt="logo"></a>
    <ul class="flex gap-10 text-white">
      <a href="propertyServlet"><li>Housing</li></a>
      <a href="housemateFinder.jsp"><li>Roommates</li></a>
      <a href="addProperty.jsp"><li>Add a Listing</li></a>
      <a href="resources.jsp"><li>Resources</li></a>
    </ul>
  </nav>
  <c:if test="${sessionScope.username == null}">
    <!-- User is not logged in -->
    <ul class="container mx-auto flex justify-end">
      <li class="mr-4"><a href="register.jsp" class="text-white">Register</a></li>
      <li><a href="login.jsp" class="text-white">Login</a></li>
    </ul>
  </c:if>
  <c:if test="${sessionScope.username != null}">
    <!-- User is logged in -->
    <div class="container mx-auto flex justify-end">
      <p class="text-white mr-4">Hi, <a href="userProfile.jsp">${sessionScope.username}</a></p>
      <a href="logout" class="text-white">Logout</a>
    </div>
  </c:if>
</header>
</body>
</html>
