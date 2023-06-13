package com.group1.offcampushousing.umtoffcampushousing.utils;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import io.github.cdimascio.dotenv.Dotenv;

import java.util.Map;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.HashMap;

public class CloudinaryUtils {
    private Cloudinary cloudinary;

    public CloudinaryUtils() {
        // Initialize the Cloudinary instance with your cloud name and API key/secret
        Dotenv dotenv = Dotenv.load();
        cloudinary = new Cloudinary(dotenv.get("CLOUDINARY_URL"));
        cloudinary.config.secure = true;
        System.out.println(cloudinary.config.cloudName);
    }

    public String uploadPhoto(Part filePart) throws IOException {
        // Extract the file name from the Part
        String fileName = getFileName(filePart);

        // Upload the file to Cloudinary and get the resulting photo URL
        Map<String, Object> uploadResult = cloudinary.uploader().upload(filePart.getInputStream(), ObjectUtils.asMap(
                "off_campus", "property_photos", // Specify the folder in Cloudinary where the photos will be stored
                "public_id", "property_photos/" + fileName // Specify the folder and file name in Cloudinary
        ));

        return uploadResult.get("secure_url").toString();
    }

    private String getFileName(Part filePart) {
        String contentDisposition = filePart.getHeader("content-disposition");
        String[] parts = contentDisposition.split(";");
        for (String part : parts) {
            if (part.trim().startsWith("filename")) {
                return part.substring(part.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}
