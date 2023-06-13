package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Property;
import com.group1.offcampushousing.umtoffcampushousing.utils.CloudinaryUtils;
import io.github.cdimascio.dotenv.Dotenv;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/propertyServlet")
public class PropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Cloudinary cloudinary;
    private static final int MAX_PHOTOS = 3;

    @Override
    public void init() throws ServletException {
        Dotenv dotenv = Dotenv.configure().load();
        String cloudName = dotenv.get("CLOUDNAME");
        String apiKey = dotenv.get("CLOUDAPIKEY");
        String apiSecret = dotenv.get("CLOUDINARYSECRET");

        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", cloudName,
                "api_key", apiKey,
                "api_secret", apiSecret,
                "secure", true
        ));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        String formattedDateTime = now.format(formatter);

        Property property = new Property();
        property.setPropertyName(req.getParameter("propertyName"));
        property.setPropertyType(req.getParameter("propertyType"));
        property.setPropertyAddr(req.getParameter("propertyAddr"));
        property.setPropertyRate(req.getParameter("propertyRate"));
        property.setDateAdded(formattedDateTime);

        List<String> photoUrls = new ArrayList<>();

        try {
            List<Part> fileParts = new ArrayList<>(req.getParts());
            int numPhotos = Math.min(fileParts.size(), MAX_PHOTOS);

            for (int i = 0; i < numPhotos; i++) {
                Part filePart = fileParts.get(i);
                String photoUrl = uploadToCloudinary(filePart);
                photoUrls.add(photoUrl);
            }

            property.setPropertyImage(photoUrls);

            PropertyDAO.saveProperty(property);

            res.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }

    private String uploadToCloudinary(Part filePart) throws IOException {
        // Implement the code to upload the file to Cloudinary and return the photo URL
        // Assuming you have a CloudinaryService class to handle the Cloudinary API integration
        CloudinaryUtils cloudinaryUtils = new CloudinaryUtils();
        return cloudinaryUtils.uploadPhoto(filePart);
    }
}
