<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
    <style>
        .font-staatliches {
            font-family: Staatliches, sans-serif;
        }
    </style>
</head>
<body>
<jsp:include page="/components/Navbar.jsp"/>
<div class="w-full h-min flex flex-col justify-start items-center p-0 content-center flex-nowrap bg-[#9b72cf] absolute gap-0">
    <div class="hero box-border flex-shrink-0 w-full min-h-[800px] flex flex-col justify-center items-center bg-purple-800 overflow-hidden z-10 relative content-center flex-nowrap gap-6 rounded-none">
        <div class="cribs flex-shrink-0 w-full h-auto z-5 relative font-normal font-staatliches text-white text-[80px] tracking-wide uppercase leading-tight text-center">
            Welcome to Off Campus Housing
            <br>
            Find Your Perfect Roommate
        </div>
        <div class="menu flex-shrink-0 w-full h-auto flex justify-center items-center overflow-hidden z-10 relative content-center flex-nowrap gap-5 rounded-none">
            <span class="explore flex-shrink-0 w-auto h-auto whitespace-pre relative font-bold text-white text-base leading-tight">Explore</span>
            <span class="explore flex-shrink-0 w-auto h-auto whitespace-pre relative font-bold text-white text-base leading-tight"><c:if
                    test="${sessionScope.role != null && sessionScope.role == landlord}">
                <a href="MaintenanceServlet" class="btn btn-purple">Maintenance Form</a>
            </c:if></span>
            <span class="explore flex-shrink-0 w-auto h-auto whitespace-pre relative font-bold text-white text-base leading-tight">Explore</span>
        </div>
    </div>
    <div class="box-border flex-shrink-0 w-full h-[694px] flex flex-col justify-center items-center py-100 px-100 bg-purple-500 overflow-visible relative content-center flex-nowrap gap-5 rounded-none">
        <div class="welcome-to-campus-cribs box-border flex-shrink-0 w-full h-auto max-w-[800px] overflow-visible relative font-normal text-black text-[50px] leading-tight text-center"
             style="font-family: Bowlby One, sans-serif">
            Welcome to UMT Off-Campus Housing!
        </div>
        <div class="discover-the-best-off-campus-housing-options-and-find-your-ultimate-student-paradise-no-more-f-o-m-o-join-the-coolest-cribs-in-town box-border flex-shrink-0 w-[400px] h-auto max-w-full overflow-visible relative font-normal text-black text-[16px] leading-tight text-center"
             style="font-family: 'Schibsted Grotesk', 'Schibsted Grotesk Placeholder', sans-serif">
            Discover the best off-campus housing options and find your ultimate student paradise. No more FOMO - join
            the coolest cribs in town.
        </div>
        <a href="propertyServlet">
            <div class="box-border flex-shrink-0 w-min-[138px] h-[40px] flex flex-row justify-center items-center p-15 bg-[#c8b1e4] overflow-visible relative align-content-center flex-nowrap gap-10 rounded-md">
                <div class="flex-shrink-0 w-auto h-auto relative font-bold text-[#2f184b] p-2 text-sm leading-tight text-center font-sans">
                    Browse Listings
                </div>
            </div>
        </a>
    </div>

    <div class="box-border shrink-0 w-full h-[702px] flex flex-col justify-center items-center p-[100px] bg-[#000000] overflow-hidden relative content-center flex-nowrap gap-16">
        <div class="shrink-0 w-full h-auto relative font-medium font-staatliches text-[#b388eb] text-5xl leading-5 text-left">
            WHY CHOOSE US?
        </div>
        <div class="shrink-0 w-full grid overflow-hidden relative grid-cols-[repeat(2, minmax(100px, 2f))] content-center auto-rows-min grid-rows-2 gap-3.5">
            <div class="h-min flex flex-col justify-center items-start w-full relative justify-self-start self-start content-start flex-nowrap gap-2.5">
                <p class="w-full text-xl text-[#b388eb]">Student-Friendly</p>
                <p class="w-full max-w-[350px] text-md text-[#fdc5f5]">Student-Friendly</p>
            </div>
        </div>
    </div>
    <div class="popular h-[702px] p-[100px]">
        <h1 class="text-3xl font-bold mb-4">Current Rental Listing</h1>
        <c:set var="propertyList" value="${PropertyDAO.getAllProperty()}" scope="request"/>
        <div class="grid gap-4 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
            <c:forEach var="house" items="${propertyList}" begin="0" end="3">
                <div class="max-w-sm rounded overflow-hidden shadow-lg bg-white">
                    <div class="bg-gray-200 h-[200px]">
                        <c:if test="${not empty house.image}">
                            <img src="data:image/jpeg;base64,${house.image}"
                                 alt="Property Image" class="object-cover h-full w-full">
                        </c:if>
                    </div>
                    <div class="px-6 py-4">
                        <div class="font-bold text-xl mb-2">${house.propertyName}</div>
                        <p class="text-gray-700 text-base">${house.propertyAddr}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/components/Footer.jsp"/>
</div>
</body>
</html>
