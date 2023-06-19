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
    <title>Current Rental Listing</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
</head>
<body class="bg-[#2f2f2f]">
<jsp:include page="Navbar.jsp" />
<div class="popular p-16">
    <h1 class="text-3xl font-bold mb-6 text-white">Current Rental Listing</h1>
    <div class="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <c:forEach var="house" items="${propertyList}">
            <div class="max-w-sm rounded overflow-hidden shadow-lg bg-white">
                <div class="bg-gray-200 h-64">
                    <c:if test="${not empty house.image}">
                        <img src="data:image/jpeg;base64,${house.image}"
                             alt="Property Image" class="object-cover h-full w-full">
                    </c:if>
                </div>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">${house.propertyName}</div>
                    <p class="text-gray-700 text-base">${house.propertyAddr}</p>
                    <a href="propertyDetails.jsp?id=${house.propertyId}"
                       class="inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-4">
                        View Details
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>
