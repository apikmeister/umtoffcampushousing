<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 4:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>

    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <style>
        body {
            background-color: #f6f5fb;
        }

        .profile-card {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 2rem;
            margin-top: 2rem;
        }

        .profile-card h2 {
            font-size: 1.5rem;
            color: #663399;
            margin-bottom: 1rem;
        }

        .profile-card p {
            color: #555555;
            margin-bottom: 0.5rem;
        }

        .profile-card button {
            background-color: #663399;
            color: #ffffff;
            border: none;
            padding: 0.75rem 1rem;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div class="profile-card">
    <h2>User Profile</h2>
    <div>
        <p><strong>Username:</strong> JohnDoe</p>
        <p><strong>Email:</strong> john.doe@example.com</p>
        <p><strong>Phone:</strong> +1 123-456-7890</p>
    </div>
    <div class="flex justify-center">
        <button class="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                type="button">Edit Profile</button>
    </div>
</div>
</body>
</html>
