<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 5/17/2023
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
</head>
<body>
<div class="popular">
    <h1>Current Rental Listing</h1>
<%--    <c:set var="propertyList" value="${PropertyDAO.getAllProperty()}" scope="request"/>--%>
    <div class="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <c:forEach var="house" items="${propertyList}">
            <div class="max-w-sm rounded overflow-hidden shadow-lg">
                <c:if test="${not empty house.image}">
                    <img src="data:image/jpeg;base64,${house.image}"
                         alt="Property Image" width="200" class="my-4">
<%--                    <c:forEach items="${house.image}" var="imageData">--%>
<%--                        <img src="data:image/jpeg;base64,${imageData}" alt="Image">--%>
<%--                    </c:forEach>--%>
                </c:if>
<%--                <c:forEach items="${house.imageData}" var="imageData">--%>
<%--                    <img src="data:image/jpeg;base64,${imageData}" alt="Image">--%>
<%--                </c:forEach>--%>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">${house.propertyName}</div>
                    <p class="text-gray-700 text-base">${house.propertyAddr}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
