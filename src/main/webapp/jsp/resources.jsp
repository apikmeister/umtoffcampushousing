<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#2f2f2f]">
<jsp:include page="Navbar.jsp" />
<section class="flex flex-wrap mt-12 h-full">
    <nav class="w-full md:w-1/4 bg-black p-6">
        <ul class="list-none p-0">
            <li><a class="block py-2 px-4 text-white" href="resources.jsp">Home</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('localArea.jsp')">Local Area Guides</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('rentalTips.jsp')">Rental Tips and Guides</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('financialPlanning.jsp')">Budgeting and Financial Planning</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('movingChecklist.jsp')">Moving Checklist</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('safetyTips.jsp')">Safety and Security Tips</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('communitySupport.jsp')">Community Support</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('FAQ.jsp')">Frequently Asked Questions (FAQ)</a></li>
            <li><a class="block py-2 px-4 text-white" href="#" onclick="loadContent('contactUs.jsp')">Contact Us</a></li>
        </ul>
    </nav>

    <section id="content" class="w-full md:w-3/4 bg-gray-100 p-6">
        <article>
            <h1 class="text-3xl">Agreement</h1>
            <p>To proceed, please read and accept the agreement:</p>
            <a href="agreement.jsp" class="text-blue-500">View Agreement</a>
            <h1 class="text-3xl">Terms and Conditions</h1>
            <p>By accessing this page, you agree to our</p>
            <a href="terms.jsp" class="text-blue-500">Terms and Conditions</a>
        </article>
    </section>
</section>

<jsp:include page="Footer.jsp" />
<script>
    function loadContent(url) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var responseText = xhr.responseText;
                document.querySelector('#content article').innerHTML = responseText;
            }
        };
        xhr.send();
    }
</script>
</body>
</html>
