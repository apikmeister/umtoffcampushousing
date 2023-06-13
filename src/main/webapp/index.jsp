<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/card.css">
</head>
<body>
<jsp:include page="components/Navbar.jsp"/>
<div class="hero">
    <div class="text-header">
        <h1>Welcome to</h1>
        <h2>UMT Off Campus Housing</h2>
        <a href="">View Rentals</a>
<%--        <a href="housemateFinder.jsp;jsessionid=${pageContext.session.id}">Find Housemates</a>--%>
        <a href="housemateFinder.jsp">Find Housemates</a>
        <a href="maintenanceView.jsp">MaintenanceForm</a>
    </div>
    <img src="${pageContext.request.contextPath}/img/canselori.png" alt="api">
</div>
<div class="popular">
    <h1>Current Rental Listing</h1>
    <c:if test="${sessionScope.username != null}">
    <p>Welcome, ${sessionScope.username}!</p>
    <!-- Display content for logged-in users -->
    </c:if>
    <c:if test="${sessionScope.username == null}">
    <p>Please log in to continue.</p>
    <!-- Display content for non-logged-in users -->
    </c:if>
    <c:set var="propertyList" value="${PropertyDAO.getAllProperty()}" scope="request"/>
    <div class="card-container">
        <c:forEach var="house" items="${propertyList}">
            <div class="property-card">
                <img src="property-image.jpg" alt="Property Image">
                <div class="property-details">
                    <h3>${house.propertyName}</h3>
                    <p>${house.propertyAddr}</p>
                    <p>${house.propertyType}</p>
                    <p>${house.propertyRate}</p>
                    <a href="property/${house.propertyId}" class="btn">Book Now</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <footer>
        <div class="info-section">
            <div class="footer-section">
                <h3>About</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                    et
                    dolore
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                    ea
                    commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                    nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim
                    id
                    est
                    laborum.</p>
            </div>
            <div class="footer-section">
                <h3>Useful Links</h3>
                <uL>
                    <li>Test1</li>
                    <li>Test2</li>
                    <li>Test3</li>
                </uL>

            </div>
            <div class="footer-section">
                <h3>Subscribe</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                    et
                    dolore
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                    ea
                    commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                    nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim
                    id
                    est
                    laborum.</p>
            </div>
        </div>
        <hr>
        <div class="copyright-section">
            <p>&copy;Afiq</p>
        </div>
    </footer>
</body>
</html>