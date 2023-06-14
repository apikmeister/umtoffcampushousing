<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/6/2023
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://cloudinary.com/jsp/taglib" prefix="cl" %>
<!DOCTYPE html>
<html>
<head>
    <title>Property Details Form</title>
    <style>
        body {
            background-color: #f6f6f6;
            color: #333;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #663399;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #663399;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="file"] {
            margin-top: 5px;
        }

        .preview {
            position: relative;
            width: 500px;
            height: 500px;
            border: 1px solid #ccc;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .preview img {
            max-width: 100%;
            max-height: 100%;
        }

        .delete-button {
            position: absolute;
            top: 5px;
            right: 5px;
            background: #fff;
            color: #ff0000;
            border: none;
            padding: 2px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #663399;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Property Details Form</h1>
    <form action="propertyServlet" method="post" enctype="multipart/form-data">
        <label for="propertyName">Property Name :</label>
        <input type="text" id="propertyName" name="propertyName" required>

        <label for="propertyType">Property Type :</label>
        <select name="propertyType" id="propertyType">
            <option value="Terrace">Terrace</option>
        </select>

        <label for="propertyAddr">Property Address :</label>
        <textarea name="propertyAddr" id="propertyAddr" cols="30" rows="10"></textarea>

        <label for="propertyRate">Property Rate (RM)/Month :</label>
        <input type="number" name="propertyRate" id="propertyRate">

        <input type="file" name="image" required="required"/>
<%--        <label for="images">Photos:</label>--%>
<%--        <input type="file" id="images" name="images" accept="image/*" required multiple>--%>
<%--        <div class="preview-container"></div>--%>

        <input type="submit" value="Add Property">
    </form>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
<script>

    $('#photos').on('change', function (e) {
        const files = Array.from(e.target.files);

        files.forEach(file => {
            const reader = new FileReader();

            reader.onloadend = function () {
                const image = $('<img>').attr('src', reader.result);
                const preview = $('<div>').addClass('preview');
                const deleteButton = $('<button>').addClass('delete-button').text('X');
                deleteButton.on('click', function () {
                    preview.remove(); // Remove the parent preview container when delete button is clicked
                });

                preview.append(image, deleteButton);
                $('.preview-container').append(preview);
            };

            if (file) {
                reader.readAsDataURL(file);
            }
        });
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
            dropArea.addClass('highlight');
        });
    });

    // Remove the highlight from the drop area when dragging leaves it
    ['dragleave', 'drop'].forEach(eventName => {
        dropArea.on(eventName, function () {
            dropArea.removeClass('highlight');
        });
    });

    // Handle the dropped file
    // dropArea.on('drop', function (e) {
    //     e.preventDefault();
    //     e.stopPropagation();
    //
    //     const file = e.originalEvent.dataTransfer.files[0];
    //     const reader = new FileReader();
    //     const preview = $('.preview');
    //     const photoInput = $('#photos');
    //
    //     reader.onloadend = function () {
    //         const image = $('<img>').attr('src', reader.result);
    //         preview.empty().append(image);
    //
    //         const deleteButton = $('<button>').addClass('delete-button').text('X');
    //         deleteButton.on('click', function () {
    //             preview.empty();
    //         });
    //         preview.append(deleteButton);
    //     };
    //
    //     if (file) {
    //         reader.readAsDataURL(file);
    //         photoInput.prop('files', e.originalEvent.dataTransfer.files);
    //         photoInput.val(file.name);
    //     } else {
    //         preview.empty();
    //         photoInput.val('');
    //     }
    // });

    dropArea.on('drop', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const files = Array.from(e.originalEvent.dataTransfer.files);

        files.forEach(file => {
            const reader = new FileReader();

            reader.onloadend = function () {
                const image = $('<img>').attr('src', reader.result);
                const preview = $('<div>').addClass('preview');
                const deleteButton = $('<button>').addClass('delete-button').text('X');
                deleteButton.on('click', function () {
                    preview.remove(); // Remove the parent preview container when delete button is clicked
                });

                preview.append(image, deleteButton);
                $('.preview-container').append(preview);
            };

            if (file) {
                reader.readAsDataURL(file);
            }
        });
    });

</script>
</body>
</html>

