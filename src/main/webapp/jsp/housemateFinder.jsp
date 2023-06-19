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
    <script src="${pageContext.request.contextPath}/js/likePost.js"></script>
    <script src="${pageContext.request.contextPath}/js/deleteConfirmationModal.js"></script>
    <script>
        $(document).ready(function () {
            $('#postForm').submit(function (e) {
                e.preventDefault(); // Prevent the default form submission

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
                            var newPostContainer = `
                                <div id="postContainer_${response.postId}" class="bg-white shadow-md rounded-lg p-4 mt-4">
                                    <p class="text-purple-700 font-semibold">${response.postUser}:</p>
                                    <p>${response.postContent}</p>
                                    <p class="text-purple-700">Likes: <span id="likeCount_${response.postId}">${response.likes}</span></p>
                            `;

                            // Check if an image is present
                            if (response.postImage) {
                                newPostContainer += `
                                    <img src="data:image/jpeg;base64,${response.postImage}" alt="Tweet Image" width="200" class="my-4">
                                `;
                            }

                            newPostContainer += `
                                <button onclick="likePost(${response.postId})" class="px-4 py-2 rounded-md purple-bg text-white">Like</button>
                                <form action="post" method="post" class="mt-2">
                                    <input type="hidden" name="tweetId" value="${response.postId}">
                                    <input type="hidden" name="action" value="like">
                                    <input type="hidden" name="username" value="${response.postImage}">
                                    <input type="submit" value="Like" class="px-4 py-2 rounded-md purple-bg text-white">
                                </form>
                            </div>
                            `;

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

        function toggleDropdown(postId) {
            const dropdown = document.getElementById(`dropdown_${postId}`);
            dropdown.classList.toggle("hidden");
        }

    </script>
</head>
<body class="bg-gray-100">
<jsp:include page="Navbar.jsp"/>
<div class="w-full h-min flex flex-col justify-start items-center p-0 content-center flex-nowrap bg-[#9b72cf] absolute gap-0 pt-12">
    <h1 class="text-3xl text-center my-6">Find your roommates here!</h1>
    <c:if test="${sessionScope.username != null}">
        <form action="post" method="post" id="postForm" enctype="multipart/form-data"
              class="flex flex-col items-center">
            <input type="hidden" name="username" value="${sessionScope.username}">
            <textarea name="content" rows="4" cols="50" required
                      class="border-purple-700 rounded-lg px-4 py-2 mt-4"></textarea>
            <input type="file" name="image" required="required" class="mt-4">
            <input type="submit" value="Post" class="mt-4 px-6 py-2 rounded-md purple-bg text-white">
        </form>
    </c:if>
    <c:set var="posts" value="${PostDAO.getAllPosts()}" scope="request"/>

    <div id="postList" class="w-full max-w-lg py-10">
        <c:forEach items="${posts}" var="post">
            <div id="postContainer_${post.id}" class="bg-white shadow-md rounded-lg p-4 m-4">
                <div class="flex flex-col">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <p class="text-purple-700 font-semibold mr-2">${post.username}</p>
                            <p class="text-gray-500">@${post.username}</p>
                        </div>
                        <div class="relative">
                            <button onclick="toggleDropdown(${post.id})"
                                    class="text-gray-400 hover:text-gray-600 focus:outline-none">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                     class="h-5 w-5">
                                    <path d="M10 12a2 2 0 100-4 2 2 0 000 4zm0 2a2 2 0 100-4 2 2 0 000 4zm0 2a2 2 0 100-4 2 2 0 000 4z"></path>
                                </svg>
                            </button>
                            <div id="dropdown_${post.id}"
                                 class="hidden absolute right-0 mt-2 w-40 bg-white rounded-md shadow-lg py-2">
                                <button onclick="likePost(${post.id})"
                                        class="block px-4 py-2 text-gray-800 hover:bg-gray-100 hover:text-gray-900 w-full text-left">
                                    Like
                                </button>
                                <button onclick="displayConfirmationModal(${post.id})"
                                        class="block px-4 py-2 text-gray-800 hover:bg-gray-100 hover:text-gray-900 w-full text-left">
                                    Delete
                                </button>
                            </div>
                        </div>
                    </div>
                    <p>${post.content}</p>

                    <div class="mt-4">
                        <c:if test="${not empty post.image}">
                            <img src="data:image/jpeg;base64,${post.image}" alt="Tweet Image" class="my-2 rounded-lg">
                        </c:if>
                    </div>


                    <div class="flex items-center mt-4">
                        <c:if test="${sessionScope.username != null}">
                            <button onclick="likePost(${post.id})"
                                    class="px-4 py-2 rounded-md purple-bg text-white mr-2"
                                    id="likeButton_${post.id}">Like
                            </button>
                        </c:if>

                        <p class="text-purple-700">Likes: <span id="likeCount_${post.id}">${post.likes}</span></p>
                    </div>
                </div>

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

    <jsp:include page="Footer.jsp"/>
</div>
</body>
</html>
