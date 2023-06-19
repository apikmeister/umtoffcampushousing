<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/15/2023
  Time: 2:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>

<c:set var="username" value="${sessionScope.username}"/>
<c:set var="property" value="${PropertyDAO.getPropertyByOwner(username)}" scope="request"/>
<div class="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
    <c:forEach var="house" items="${property}">
        <div class="max-w-sm rounded overflow-hidden shadow-lg bg-white">
            <div class="bg-gray-200 h-[200px]">
                <c:if test="${not empty house.image}">
                    <img src="data:image/jpeg;base64,${house.image}"
                         alt="Property Image" class="object-cover h-full w-full">
                </c:if>
            </div>
            <div class="px-6 py-4">
                <div class="font-bold text-xl mb-2">${house.propertyName}</div>
                <p class="text-gray-700 text-base">${house.propertyAddr}</p>
            </div>
            <div class="px-6 py-4">
                <a href="editProperty?id=${house.propertyId}" class="text-purple-600 hover:underline">Edit Property</a>
            </div>
            <div class="px-6 py-4">
                <a href="editProperty?id=${house.propertyId}&action=delete" class="text-purple-600 hover:underline">Delete Property</a>
            </div>
        </div>
    </c:forEach>
</div>
<a href="addProperty.jsp">Add Property</a>

