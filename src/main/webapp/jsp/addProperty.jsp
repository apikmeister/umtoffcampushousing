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
    <form action="propertyServlet" method="post">
        <label for="propertyName">Property Name :</label>
        <input type="text" id="propertyName" name="propertyName" required>

        <label for="propertyType">Property Type :</label>
        <select name="propertyType" id="propertyType">
            <option value="Terrace">Terrace</option>
        </select>

        <label for="propertyAddr">Property Address :</label>
        <textarea name="propertyAddr" id="propertyAddr" cols="30" rows="10"></textarea>

        <label for="propertyRate">Property Rate (RM)/Month :</label>
        <input type="text" name="propertyRate" id="propertyRate">


        <%--        <cl:upload fieldName="image" name="image" />--%>

        <%--        <input type="hidden" name="cdnUrl">--%>

        <input type="submit" value="Submit">
    </form>

    <form id="upload-form">
        <label for="photos">Photos:</label>
        <input type="file" id="photos" name="photos" accept="image/*" required multiple>
        <div class="preview-container"></div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
<script>
    // $('#photos').on('change', function (e) {
    //     const file = e.target.files[0];
    //     const reader = new FileReader();
    //     const preview = $('.preview');
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
    //     } else {
    //         preview.empty();
    //     }
    // });

    // $('#photos').on('change', function (e) {
    //     const files = Array.from(e.target.files);
    //     const previewContainer = $('.preview');
    //     previewContainer.empty(); // Clear the container before adding new previews
    //
    //     files.forEach(file => {
    //         const reader = new FileReader();
    //
    //         reader.onloadend = function () {
    //             const image = $('<img>').attr('src', reader.result);
    //             const preview = $('<div>').addClass('preview');
    //             preview.append(image);
    //
    //             const deleteButton = $('<button>').addClass('delete-button').text('X');
    //             deleteButton.on('click', function () {
    //                 preview.remove();
    //             });
    //             preview.append(deleteButton);
    //
    //             previewContainer.append(preview);
    //         };
    //
    //         if (file) {
    //             reader.readAsDataURL(file);
    //         }
    //     });
    // });

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


    // cloudinary
    <%--const cloudinaryConfig = {--%>
    <%--    cloudName: 'your_cloud_name',--%>
    <%--    uploadPreset: 'your_upload_preset'--%>
    <%--};--%>

    <%--const uploadToCloudinary = (file) => {--%>
    <%--    const formData = new FormData();--%>
    <%--    formData.append('file', file);--%>
    <%--    formData.append('upload_preset', cloudinaryConfig.uploadPreset);--%>

    <%--    return fetch(`https://api.cloudinary.com/v1_1/${cloudinaryConfig.cloudName}/image/upload`, {--%>
    <%--        method: 'POST',--%>
    <%--        body: formData--%>
    <%--    })--%>
    <%--        .then(response => response.json())--%>
    <%--        .then(data => data.secure_url)--%>
    <%--        .catch(error => {--%>
    <%--            console.error('Error uploading photo to Cloudinary:', error);--%>
    <%--            throw error;--%>
    <%--        });--%>
    <%--};--%>

    <%--$('form').submit(async function (event) {--%>
    <%--    event.preventDefault();--%>

    <%--    const title = $('#title').val();--%>
    <%--    const description = $('#description').val();--%>
    <%--    const photo = $('#photos')[0].files[0];--%>

    <%--    try {--%>
    <%--        const photoUrl = await uploadToCloudinary(photo);--%>
    <%--        $('<input>').attr({--%>
    <%--            type: 'hidden',--%>
    <%--            name: 'photoUrl',--%>
    <%--            value: photoUrl--%>
    <%--        }).appendTo($(this));--%>

    <%--        var cdnUrlInput = document.querySelector("input[name='cdnUrl']");--%>
    <%--        cdnUrlInput.value = cdnUrl;--%>

    <%--        this.submit();--%>
    <%--    } catch (error) {--%>
    <%--        alert('Failed to upload the photo. Please try again.');--%>
    <%--    }--%>
    <%--});--%>

    const api_key = "417981148734942"
    const cloud_name = "dk9x6bja3"
    // It's okay for these to be public on client-side JS
    // You just don't ever want to leak your API Secret

    document.querySelector("#upload-form").addEventListener("submit", async function (e) {
        e.preventDefault()

        // get signature. In reality you could store this in localstorage or some other cache mechanism, it's good for 1 hour
        const signatureResponse = await axios.get("/get-signature")

        const data = new FormData()
        data.append("file", document.querySelector("#file-field").files[0])
        data.append("api_key", api_key)
        data.append("signature", signatureResponse.data.signature)
        data.append("timestamp", signatureResponse.data.timestamp)

        const cloudinaryResponse = await axios.post(`https://api.cloudinary.com/v1_1/${cloud_name}/auto/upload`, data, {
            headers: { "Content-Type": "multipart/form-data" },
            onUploadProgress: function (e) {
                console.log(e.loaded / e.total)
            }
        })
        console.log(cloudinaryResponse.data)

        // send the image info back to our server
        const photoData = {
            public_id: cloudinaryResponse.data.public_id,
            version: cloudinaryResponse.data.version,
            signature: cloudinaryResponse.data.signature
        }

        axios.post("/do-something-with-photo", photoData)
    })

</script>
</body>
</html>

