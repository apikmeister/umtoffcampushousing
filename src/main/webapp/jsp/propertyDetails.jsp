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
  <!-- Add your CSS stylesheets and other required resources here -->
</head>
<body>
<div class="property-details">
  <h3>${house.propertyName}</h3>
  <p>${house.propertyAddr}</p>
  <p>${house.propertyType}</p>
  <p>${house.propertyRate}</p>
</div>

</body>
</html>

