<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/13/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Property Details</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="../css/purpleShade.css">
  <!-- Add your CSS stylesheets and other required resources here -->
</head>
<body>
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
            <p class="purple-text">Property Name: ${house.propertyName}</p>
            <p class="purple-text">Location: ${house.propertyAddr}</p>
            <p class="purple-text">Price: ${house.propertyRate}</p>
            <p class="purple-text">Bedrooms: 4</p>
            <p class="purple-text">Bathrooms: 3</p>
            <p class="purple-text">Size: 2,000 sqft</p>
            <p class="purple-text">Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
              malesuada nunc et purus aliquet, at mollis sapien feugiat.</p>
          </div>
          <div class="pt-6 text-base leading-6 font-bold text-purple-700 sm:text-lg sm:leading-7">
            <p>Contact us for more information:</p>
            <p class="purple-text">Phone: (123) 456-7890</p>
            <p class="purple-text">Email: info@purplehaven.com</p>
          </div>
        </div>
        <div class="pt-4 flex items-center space-x-4">
          <button class="purple-btn flex justify-center items-center w-full text-white px-4 py-3 rounded-md focus:outline-none">
            <span>Contact Agent</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
<%--<div class="property-details">--%>
<%--  <h3>${house.propertyName}</h3>--%>
<%--  <p>${house.propertyAddr}</p>--%>
<%--  <p>${house.propertyType}</p>--%>
<%--  <p>${house.propertyRate}</p>--%>
<%--</div>--%>

</body>
</html>

