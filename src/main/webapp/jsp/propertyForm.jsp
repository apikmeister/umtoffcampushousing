<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 5:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Property Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
</head>
<body class="bg-gray-100">
<h1 class="text-3xl text-center my-6">Property Form</h1>
<form action="MaintenanceServlet" method="post" class="max-w-md mx-auto bg-white shadow-md rounded-lg px-8 py-6">
    <input type="hidden" name="action" value="${param.action}">
    <input type="hidden" name="id" value="${param.id}">

    <div class="mb-4">
        <label for="title" class="block text-purple-700 font-semibold">Title:</label>
        <input type="text" id="title" name="title" value="${maintenance.title}"
               class="border-purple-700 border rounded-lg px-4 py-2 w-full">
    </div>

    <div class="mb-4">
        <label for="description" class="block text-purple-700 font-semibold">Description:</label>
        <textarea id="description" name="description"
                  class="border-purple-700 border rounded-lg px-4 py-2 w-full">${maintenance.description}</textarea>
    </div>

    <div class="mb-4">
        <label for="status" class="block text-purple-700 font-semibold">Status:</label>
        <input type="text" id="status" name="status" value="${maintenance.status}"
               class="border-purple-700 border rounded-lg px-4 py-2 w-full">
    </div>

    <button type="submit"
            class="px-6 py-2 rounded-md purple-bg text-white hover:bg-purple-800 focus:bg-purple-800 focus:outline-none">
        Submit
    </button>
</form>
</body>
</html>
