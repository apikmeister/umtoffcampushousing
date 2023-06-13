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
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      text-align: center;
    }

    .modal-button {
      margin-top: 10px;
    }
  </style>
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
<body>
<h1>Maintenance View</h1>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Description</th>
    <th>Status</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach var="maintenance" items="${maintenanceList}">
    <tr>
      <td>${maintenance.id}</td>
      <td>${maintenance.title}</td>
      <td>${maintenance.description}</td>
      <td>${maintenance.status}</td>
      <td><a href="MaintenanceServlet?action=edit&id=${maintenance.id}">Edit</a></td>
      <td>
        <a href="#" onclick="displayConfirmationModal(${maintenance.id})">Delete</a>
      </td>
    </tr>
  </c:forEach>
</table>
<a href="MaintenanceServlet?action=add">Add New Maintenance</a>

<!-- Confirmation Modal -->
<div id="confirmationModal" class="modal">
  <div class="modal-content">
    <h2>Confirm Delete</h2>
    <p>Are you sure you want to delete this maintenance entry?</p>
    <div>
      <a id="deleteLink" href="#" class="modal-button">Delete</a>
      <button onclick="closeModal()" class="modal-button">Cancel</button>
    </div>
  </div>
</div>
</body>
</html>