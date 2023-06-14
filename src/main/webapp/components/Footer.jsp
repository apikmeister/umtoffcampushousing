<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 4:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purpleShade.css">
</head>
<body>
<footer class="bg-purple-900 py-8 px-6 text-white">
    <div class="container mx-auto">
        <div class="flex flex-wrap justify-between">
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 mb-8">
                <h2 class="text-lg font-semibold mb-4">Address</h2>
                <h5>Kuala Terengganu, Malaysia</h5>
                <p class="mt-2">
                    Universiti Malaysia Terengganu <br />
                    21030 Kuala Nerus, <br />
                    Terengganu, MALAYSIA.
                </p>
            </div>
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 mb-8">
                <h2 class="text-lg font-semibold mb-4">Contact Us</h2>
                <p>Nisha Farhani - <a href="tel:+60179413110">+60 17-941 3110</a></p>
                <p>Muhammad Afiq - <a href="tel:+601110992710">+60 11-1099 2710</a></p>
                <p>Anis Naziffa - <a href="tel:+60168736404">+60 16-873 6404</a></p>
            </div>
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 mb-8">
                <h2 class="text-lg font-semibold mb-4">Quick Links</h2>
                <ul class="list-none">
                    <li><a href="${pageContext.request.contextPath}" class="text-purple-400 hover:text-purple-200">Home</a></li>
                    <li><a href="about.html" class="text-purple-400 hover:text-purple-200">About</a></li>
                    <li><a href="contact.html" class="text-purple-400 hover:text-purple-200">Contact</a></li>
                </ul>
            </div>
        </div>
        <div class="mt-8 text-center">
            <p class="text-lg mb-2"><em>Housing Solutions for Students</em></p>
            <p>&copy; 2023 UMT Off-Campus Housing System. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>
