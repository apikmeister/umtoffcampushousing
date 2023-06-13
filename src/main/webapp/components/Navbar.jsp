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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
  <script src="https://code.jquery.com/jquery-3.7.0.js"
          integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/js/header.js"></script>
</head>
<body>
<header>
  <nav>
    <img src="${pageContext.request.contextPath}/img/logoUMT.png" width="45px" alt="logo">
    <ul>
      <li>Housing</li>
      <li>Roommates</li>
      <li>Add a Listing</li>
    </ul>
  </nav>
  <c:if test="${sessionScope.username == null}">
    <!-- User is not logged in -->
    <ul class="accManage">
      <li><a href="register.jsp">Register</a></li>
      <li><a href="login.jsp">Login</a></li>
    </ul>
  </c:if>
  <c:if test="${sessionScope.username != null}">
    <!-- User is logged in -->
    <p>Hi, ${sessionScope.username}</p>
    <a href="logout">Logout</a>
  </c:if>

</header>
</body>
</html>
