<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/13/2023
  Time: 2:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PostDAO" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modalStyle.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
            integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function () {
            $('#postForm').submit(function (e) {
                e.preventDefault(); // Prevent the default form submission

                // Create a FormData object to collect the form data
                // var formData = new FormData(this);

                var formData = new FormData(this);

                // Send the form data using AJAX
                $.ajax({
                    url: '${pageContext.request.contextPath}/post', // Replace with the actual server-side endpoint to handle the post saving
                    type: 'POST',
                    data: formData,
                    processData: false, // Prevent jQuery from automatically processing the data
                    contentType: false, // Set the content type to false to let the browser set it automatically
                    enctype: 'multipart/form-data',
                    success: function (response) {
                        // Handle the response from the server
                        if (response.success) {
                            var newPostContainer = '<div id="postContainer_' + response.postId + '" class="bg-white shadow-md rounded-lg p-4 mt-4">' +
                                '<p class="text-purple-700 font-semibold">' + response.postUser + ':</p>' +
                                '<p>' + response.postContent + '</p>' +
                                '<p class="text-purple-700">Likes: <span id="likeCount_' + response.postId + '">' + response.likes + '</span></p>';

                            // Check if an image is present
                            if (response.postImage) {
                                newPostContainer += '<img src="data:image/jpeg;base64,' + response.postImage + '" alt="Tweet Image" width="200" class="my-4">';
                            }

                            newPostContainer += '<button onclick="likePost(' + response.postId + ')" class="px-4 py-2 rounded-md purple-bg text-white">Like</button>' +
                                '<form action="post" method="post" class="mt-2">' +
                                '<input type="hidden" name="tweetId" value="' + response.postId + '">' +
                                '<input type="hidden" name="action" value="like">' +
                                '<input type="hidden" name="username" value="' + response.postImage + '">' +
                                '<input type="submit" value="Like" class="px-4 py-2 rounded-md purple-bg text-white">' +
                                '</form>' +
                                '<form action="post" method="post" class="mt-2">' +
                                '<input type="hidden" name="tweetId" value="' + response.postId + '">' +
                                '<input type="hidden" name="action" value="reply">' +
                                '<input type="hidden" name="username" value="' + response.postUser + '">' +
                                '<textarea name="replyContent" rows="2" cols="30" required class="border-purple-700 rounded-lg px-4 py-2"></textarea>' +
                                '<input type="submit" value="Reply" class="px-4 py-2 rounded-md purple-bg text-white mt-2">' +
                                '</form>';

                            newPostContainer += '</div>';

                            // Prepend the new post container to the postContainer element
                            $('#postList').prepend(newPostContainer);
                        } else {
                            // Display an error message if the post saving was unsuccessful
                            alert('Failed to save the post.');
                        }
                    },
                    error: function (xhr, status, error) {
                        // Handle any errors that occur during the AJAX request
                        alert('An error occurred while processing the request.');
                        console.log(xhr.responseText);
                        console.log(status);
                        console.log(error);
                    }
                });
            });
        });
    </script>
</head>
<body class="bg-gray-100">
<jsp:include page="Navbar.jsp" />
<h1 class="text-3xl text-center my-6">Find ${sessionScope.username}</h1>
<form action="post" method="post" id="postForm" enctype="multipart/form-data" class="flex flex-col items-center">
    <input type="hidden" name="username" value="${sessionScope.username}">
    <textarea name="content" rows="4" cols="50" required class="border-purple-700 rounded-lg px-4 py-2 mt-4"></textarea>
    <input type="file" name="image" required="required"/>
    <input type="submit" value="Post" class="mt-4 px-6 py-2 rounded-md purple-bg text-white">
</form>

<c:set var="posts" value="${PostDAO.getAllPosts()}" scope="request"/>

<div id="postList">
    <c:forEach items="${posts}" var="post">
        <div id="postContainer" class="bg-white shadow-md rounded-lg p-4 mt-4">
            <p class="text-purple-700 font-semibold">${post.username}:</p>
            <p>${post.content}</p>
            <p class="text-purple-700">Likes: <span id="likeCount_${post.id}">${post.likes}</span></p>

            <c:if test="${not empty post.image}">
                <img src="data:image/jpeg;base64,${post.image}"
                     alt="Tweet Image" width="200" class="my-4">
            </c:if>

            <button onclick="likePost(${post.id})" class="px-4 py-2 rounded-md purple-bg text-white"
                    id="likeButton_${post.id}">Like
            </button>

            <c:if test="${sessionScope.username == post.username}">
                <button onclick="displayConfirmationModal(${post.id})" class="x-4 py-2 rounded-md purple-bg text-white">
                    Delete
                </button>
                <%--                <form action="post" method="post" class="mt-2">--%>
                <%--                    <input type="hidden" name="postId" value="${post.id}">--%>
                <%--                    <input type="hidden" name="action" value="delete">--%>
                <%--                    <input type="hidden" name="username" value="${username}">--%>
                <%--                    <input type="submit" value="Delete" class="px-4 py-2 rounded-md purple-bg text-white">--%>
                <%--                </form>--%>
            </c:if>

<%--            <form action="post" method="post" class="mt-2">--%>
<%--                <input type="hidden" name="postId" value="${post.id}">--%>
<%--                <input type="hidden" name="action" value="like">--%>
<%--                <input type="hidden" name="username" value="${username}">--%>
<%--                <input type="submit" value="Like" class="px-4 py-2 rounded-md purple-bg text-white">--%>
<%--            </form>--%>

            <form action="post" method="post" class="mt-2">
                <input type="hidden" name="tweetId" value="${post.id}">
                <input type="hidden" name="action" value="reply">
                <input type="hidden" name="username" value="${username}">
                <textarea name="replyContent" rows="2" cols="30" required
                          class="border-purple-700 rounded-lg px-4 py-2"></textarea>
                <input type="submit" value="Reply" class="px-4 py-2 rounded-md purple-bg text-white mt-2">
            </form>

            <c:forEach items="${post.replies}" var="reply">
                <p>${reply}</p>
            </c:forEach>

            <div id="confirmationModal" class="modal">
                <div class="modal-content">
                    <h3>Confirmation</h3>
                    <p>Are you sure you want to delete this post?</p>
                    <form id="deleteForm" method="POST">
                        <input type="hidden" id="actionInput" name="action">
                        <input type="hidden" name="postId" value="${post.id}">
                        <button type="submit">Delete</button>
                        <button type="button" onclick="closeModal()">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<jsp:include page="Footer.jsp" />
</body>
<script src="${pageContext.request.contextPath}/js/likePost.js"></script>
<script src="${pageContext.request.contextPath}/js/deleteConfirmationModal.js"></script>
</html>
