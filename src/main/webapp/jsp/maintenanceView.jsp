<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/13/2023
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Maintenance View</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    /* Modal styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      background-color: #fff;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 400px;
      border-radius: 8px;
    }

    .modal-button {
      display: inline-block;
      padding: 8px 16px;
      margin-right: 10px;
      background-color: #7E57C2;
      color: #fff;
      border-radius: 4px;
      text-decoration: none;
      cursor: pointer;
    }
  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
  <script>
    // Function to display the confirmation modal
    function displayConfirmationModal(id) {
      var modal = document.getElementById("confirmationModal");
      modal.style.display = "block";

      var deleteLink = document.getElementById("deleteLink");
      deleteLink.href = "MaintenanceServlet?action=delete&id=" + id;
    }

    // Function to close the confirmation modal
    function closeModal() {
      var modal = document.getElementById("confirmationModal");
      modal.style.display = "none";
    }
  </script>
</head>
<body class="bg-gray-100">
<h1 class="text-3xl text-center my-6">Maintenance View</h1>
<table class="mx-auto max-w-3xl bg-white shadow-md rounded-lg overflow-hidden">
  <thead class="purple-bg">
  <tr>
    <th class="px-4 py-2 text-white">ID</th>
    <th class="px-4 py-2 text-white">Name</th>
    <th class="px-4 py-2 text-white">Description</th>
    <th class="px-4 py-2 text-white">Status</th>
    <th class="px-4 py-2 text-white">Edit</th>
    <th class="px-4 py-2 text-white">Delete</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="maintenance" items="${maintenanceList}">
    <tr>
      <td class="px-4 py-2">${maintenance.id}</td>
      <td class="px-4 py-2">${maintenance.title}</td>
      <td class="px-4 py-2">${maintenance.description}</td>
      <td class="px-4 py-2">${maintenance.status}</td>
      <td class="px-4 py-2">
        <a href="MaintenanceServlet?action=edit&id=${maintenance.id}" class="text-purple-700 underline">Edit</a>
      </td>
      <td class="px-4 py-2">
        <a href="#" onclick="displayConfirmationModal(${maintenance.id})" class="text-purple-700 underline">Delete</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<a href="MaintenanceServlet?action=add" class="block mt-6 mx-auto w-max px-4 py-2 rounded-md purple-bg text-white">Add New Maintenance</a>

<!-- Confirmation Modal -->
<div id="confirmationModal" class="modal">
  <div class="modal-content">
    <h2 class="text-2xl text-purple-700 font-semibold mb-4">Confirm Delete</h2>
    <p class="text-gray-700 mb-4">Are you sure you want to delete this maintenance entry?</p>
    <div>
      <a id="deleteLink" href="#" class="modal-button">Delete</a>
      <button onclick="closeModal()" class="modal-button">Cancel</button>
    </div>
  </div>
</div>
</body>
</html>