<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="components/Navbar.jsp" />
<div class="hero">
    <div class="text-header">
        <h1>Welcome to</h1>
        <h2>UMT Off Campus Housing</h2>
        <a href="">View Rentals</a>
    </div>
    <img src="${pageContext.request.contextPath}/img/canselori.png" alt="api">
</div>
<div class="popular">
    <h1>Current Rental Listing</h1>
    <%--    <c:forEach var="house" items="searchResult">--%>
    <%--        <tr>--%>
    <%--            <td>${house.houseId}</td>--%>
    <%--            <td>${house.address}</td>--%>
    <%--            <td>${house.rooms}</td>--%>
    <%--            <td>${house.rent}</td>--%>
    <%--            <td>${house.facilities}</td>--%>
    <%--        </tr>--%>
    <%--    </c:forEach>--%>
</div>
<footer>
    <div class="info-section">
        <div class="footer-section">
            <h3>About</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore
                magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                commodo
                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim
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
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore
                magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                commodo
                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim
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