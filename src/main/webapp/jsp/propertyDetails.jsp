<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/13/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Property Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../css/purpleShade.css">
</head>
<body class="bg-[#2f2f2f]">
<jsp:include page="Navbar.jsp"/>
<c:set var="propertyId" value="${param.id}"/>
<c:set var="property" value="${PropertyDAO.getPropertyById(propertyId)}" scope="request"/>
<div class="min-h-screen py-6 flex flex-col justify-center sm:py-12">
    <div class="relative py-3 sm:max-w-xl sm:mx-auto">
        <div class="relative px-4 py-10 bg-white mx-8 md:mx-0 shadow rounded-3xl sm:p-10">
            <div class="max-w-md mx-auto">
                <div class="flex items-center space-x-5">
                    <div class="block pl-2 font-semibold text-xl self-start text-gray-700">
                        <h2 class="leading-relaxed">Property Details</h2>
                    </div>
                </div>
                <div class="divide-y divide-gray-200">
                    <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
                        <!-- Property information goes here -->
                        <c:if test="${not empty property.image}">
                            <img src="data:image/jpeg;base64,${property.image}"
                                 alt="Property Image" class="object-cover h-full w-full">
                        </c:if>
                        <p class="purple-text">Property Name: ${property.propertyName}</p>
                        <p class="purple-text">Location: ${property.propertyAddr}</p>
                        <p class="purple-text">Type: ${property.propertyType}</p>
                        <p class="purple-text">Owned by: ${property.propertyOwner}</p>
                        <p class="purple-text">Rate per month: ${property.propertyRate}</p>
                        <%--            <p class="purple-text">Bedrooms: 4</p>--%>
                        <%--            <p class="purple-text">Bathrooms: 3</p>--%>
                        <%--            <p class="purple-text">Size: 2,000 sqft</p>--%>
                        <%--            <p class="purple-text">Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur--%>
                        <%--              malesuada nunc et purus aliquet, at mollis sapien feugiat.</p>--%>
                        <%--          </div>--%>
                        <%--                        <div class="pt-6 text-base leading-6 font-bold text-purple-700 sm:text-lg sm:leading-7">--%>
                        <%--                            <p>Contact us for more information:</p>--%>
                        <%--                            <p class="purple-text">Phone: (123) 456-7890</p>--%>
                        <%--                            <p class="purple-text">Email: info@purplehaven.com</p>--%>
                        <%--                        </div>--%>
                    </div>
                    <div class="pt-4 flex items-center space-x-4">
                        <a href="propertyOwner.jsp?name=${property.propertyOwner}">
                            <button class="purple-btn flex justify-center items-center w-full text-white px-4 py-3 rounded-md focus:outline-none">
                                <span>Contact Agent</span>
                            </button>
                        </a>
                        <form action="propertyRent" method="post">
                            <input type="hidden" name="propertyId" value="${propertyId}"/>
                            <input type="hidden" name="userSession" value="${sessionScope.username}">
                            <button class="purple-btn flex justify-center items-center w-full text-white px-4 py-3 rounded-md focus:outline-none"
                                    type="submit">
                                <span>Rent Property</span>
                            </button>
                        </form>
                        <%--                        <form action="payment" method="post">--%>
                        <%--                            <input type="hidden" name="propertyId" value="${propertyId}"/>--%>
                        <%--                            <button class="purple-btn flex justify-center items-center w-full text-white px-4 py-3 rounded-md focus:outline-none"--%>
                        <%--                                    type="submit">--%>
                        <%--                                <span>Rent Property</span>--%>
                        <%--                            </button>--%>
                        <%--                        </form>--%>
                        <%--                        <form action="checkout" method="POST">--%>
                        <%--                            <input type="hidden" name="propertyId" value="${propertyId}">--%>
                        <%--                            <input type="hidden" name="lookup_key" value="{{PRICE_LOOKUP_KEY}}" />--%>
                        <%--                            <button id="checkout-and-portal-button" type="submit">Checkout</button>--%>
                        <%--                        </form>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp"/>
</body>
</html>

