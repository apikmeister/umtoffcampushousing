<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<%--    <link rel="stylesheet" href="../css/card.css">--%>
<%--    <link rel="stylesheet" href="../css/purpleShade.css">--%>
    <script src="https://cdn.tailwindcss.com"></script>
<%--    <script src="${pageContext.request.contextPath}/js/header.js"></script>--%>
</head>
<body>
<jsp:include page="/components/Navbar.jsp"/>
<div class="bg-purple-900 text-white py-16">
    <div class="text-header container mx-auto text-center">
        <h1 class="text-4xl font-bold mb-4">Welcome to</h1>
        <h2 class="text-2xl font-bold mb-8">UMT Off Campus Housing</h2>
        <a href="#" class="btn btn-purple mr-4">View Rentals</a>
        <a href="housemateFinder.jsp" class="btn btn-purple mr-4">Find Housemates</a>
        <a href="MaintenanceServlet" class="btn btn-purple">Maintenance Form</a>
    </div>
    <img src="${pageContext.request.contextPath}/img/canselori.png" alt="api" class="mx-auto mt-8">
</div>
<div class="popular">
    <h1 class="text-3xl font-bold mb-4">Current Rental Listing</h1>
    <c:if test="${sessionScope.username != null}">
        <p class="mb-4">Welcome, ${sessionScope.username}!</p>
        <!-- Display content for logged-in users -->
    </c:if>
    <c:if test="${sessionScope.username == null}">
        <p class="mb-4">Please log in to continue.</p>
        <!-- Display content for non-logged-in users -->
    </c:if>
    <c:set var="propertyList" value="${PropertyDAO.getAllProperty()}" scope="request"/>
    <div class="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <c:forEach var="house" items="${propertyList}">
            <div class="max-w-sm rounded overflow-hidden shadow-lg">
                <img class="w-full" src="/img/card-top.jpg" alt="Sunset in the mountains">
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">${house.propertyName}</div>
                    <p class="text-gray-700 text-base">${house.propertyAddr}</p>
                </div>
                <div class="px-6 pt-4 pb-2">
                    <a href="property/${house.propertyId}" class="rounded-md bg-green-500 text-white py-2 px-4 hover:bg-green-600">Book Now</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="/components/Footer.jsp"/>
</body>
</html>