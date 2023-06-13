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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
            integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function () {
            $('#postForm').submit(function (e) {
                e.preventDefault(); // Prevent the default form submission

                // Create a FormData object to collect the form data
                // var formData = new FormData(this);

                var formData = $(this).serialize();

                // Send the form data using AJAX
                $.ajax({
                    url: '${pageContext.request.contextPath}/post', // Replace with the actual server-side endpoint to handle the post saving
                    type: 'POST',
                    data: formData,
                    // processData: false, // Prevent jQuery from automatically processing the data
                    // contentType: false, // Set the content type to false to let the browser set it automatically
                    // enctype: 'application/x-www-form-urlencoded',
                    success: function (response) {
                        // Handle the response from the server
                        if (response.success) {
                            // Update the page content to display the new post
                            var newPost = '<div>' + response.postContent + '</div>';
                            $('#postContainer').prepend(newPost);
                        } else {
                            // Display an error message if the post saving was unsuccessful
                            alert('Failed to save the post.');
                            console.log(response);
                        }
                    },
                    error: function () {
                        // Handle any errors that occur during the AJAX request
                        alert('An error occurred while processing the request.');
                    }
                });
            });
        });

    </script>
</head>
<body>
<h1>Find ${sessionScope.username}</h1>
<form action="post" method="post" id="postForm">
    <input type="hidden" name="username" value="${sessionScope.username}">
    <textarea name="content" rows="4" cols="50" required></textarea><br>
    <input type="submit" value="Post">
</form>

<%-- Display existing post --%>
<c:set var="posts" value="${PostDAO.getAllPosts()}" scope="request"/>
<c:forEach items="${posts}" var="post">
    <div id="postContainer">
        <p>${post.username}:</p>
        <p>${post.content}</p>
            <%--    <p>Likes: ${post.likes}</p>--%>
        <p>Likes: <span id="likeCount_${post.id}">${post.likes}</span></p>
        <c:if test="${not empty post.image}">
            <img src="data:image/png;base64,${javax.xml.bind.DatatypeConverter.printBase64Binary(post.image)}"
                 alt="Tweet Image" width="200">
        </c:if>
        <button onclick="likePost(${post.id})">Like</button>

            <%-- Like button --%>
        <form action="post" method="post">
            <input type="hidden" name="tweetId" value="${post.id}">
            <input type="hidden" name="action" value="like">
            <input type="hidden" name="username" value="${username}">
            <input type="submit" value="Like">
        </form>

            <%-- Reply form --%>
        <form action="post" method="post">
            <input type="hidden" name="tweetId" value="${post.id}">
            <input type="hidden" name="action" value="reply">
            <input type="hidden" name="username" value="${username}">
            <textarea name="replyContent" rows="2" cols="30" required></textarea>
            <input type="submit" value="Reply">
        </form>

            <%-- Display replies for the tweet --%>
        <c:forEach items="${post.replies}" var="reply">
            <p>${reply}</p>
        </c:forEach>
    </div>
</c:forEach>
<p></p>
</body>
</html>
