<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Property Details Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#2f2f2f]">
<jsp:include page="Navbar.jsp" />
<div class="container mx-auto p-12">
    <h1 class="text-3xl text-center text-purple-700">Property Details Form</h1>
    <form action="propertyServlet" method="post" enctype="multipart/form-data" class="max-w-md mx-auto bg-white rounded-lg shadow-md p-6 mt-8">
        <div class="mb-4">
            <label for="propertyName" class="block font-semibold text-purple-700 mb-2">Property Name:</label>
            <input type="text" id="propertyName" name="propertyName" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg">
        </div>

        <div class="mb-4">
            <label for="propertyType" class="block font-semibold text-purple-700 mb-2">Property Type:</label>
            <select name="propertyType" id="propertyType"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg">
                <option value="Terrace">Terrace</option>
            </select>
        </div>

        <div class="mb-4">
            <label for="propertyAddr" class="block font-semibold text-purple-700 mb-2">Property Address:</label>
            <textarea name="propertyAddr" id="propertyAddr" cols="30" rows="5"
                      class="w-full px-4 py-2 border border-gray-300 rounded-lg"></textarea>
        </div>

        <div class="mb-4">
            <label for="propertyRate" class="block font-semibold text-purple-700 mb-2">Property Rate (RM)/Month:</label>
            <input type="number" name="propertyRate" id="propertyRate"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg">
        </div>

        <div class="mb-4">
            <label for="image" class="block font-semibold text-purple-700 mb-2">Image:</label>
            <input type="file" name="image" id="image" required="required"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg">
        </div>

        <div class="text-center">
            <input type="submit" value="Add Property"
                   class="px-6 py-2 rounded-md text-white bg-purple-700 hover:bg-purple-800 cursor-pointer">
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
<script>
    // File preview and delete functionality
    $('#image').on('change', function (e) {
        const file = e.target.files[0];
        const reader = new FileReader();
        const preview = $('.preview');
        const deleteButton = $('.delete-button');

        reader.onloadend = function () {
            const image = $('<img>').attr('src', reader.result);
            preview.empty().append(image);
            deleteButton.show();
        };

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.empty();
            deleteButton.hide();
        }
    });

    // Handle drag and drop events for file upload
    const dropArea = $('.container');

    // Prevent default behavior for drag events
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        dropArea.on(eventName, function (e) {
            e.preventDefault();
            e.stopPropagation();
        });
    });

    // Highlight the drop area when dragging over it
    ['dragenter', 'dragover'].forEach(eventName => {
        dropArea.on(eventName, function () {
            dropArea.addClass('bg-purple-200');
        });
    });

    // Remove the highlight from the drop area when dragging leaves it
    ['dragleave', 'drop'].forEach(eventName => {
        dropArea.on(eventName, function () {
            dropArea.removeClass('bg-purple-200');
        });
    });

    // Handle the dropped file
    dropArea.on('drop', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const file = e.originalEvent.dataTransfer.files[0];
        const reader = new FileReader();
        const preview = $('.preview');
        const deleteButton = $('.delete-button');

        reader.onloadend = function () {
            const image = $('<img>').attr('src', reader.result);
            preview.empty().append(image);
            deleteButton.show();
        };

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.empty();
            deleteButton.hide();
        }
    });
</script>
<jsp:include page="Footer.jsp" />
</body>
</html>
