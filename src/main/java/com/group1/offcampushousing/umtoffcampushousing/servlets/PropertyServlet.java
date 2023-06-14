package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.PostDAO;
import com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Post;
import com.group1.offcampushousing.umtoffcampushousing.models.Property;
import com.group1.offcampushousing.umtoffcampushousing.utils.CloudinaryUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

@WebServlet("/propertyServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class PropertyServlet extends HttpServlet {

    private PropertyDAO propertyDAO;

    @Override
    public void init() throws ServletException {
        propertyDAO = new PropertyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Property> propertyList = PropertyDAO.getAllProperty();

        req.setAttribute("propertyList", propertyList);

        req.getRequestDispatcher("houseListing.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        res.setContentType("text/html;charset=UTF-8");
        String username = (String) session.getAttribute("username");

        Property property = new Property();
        property.setPropertyOwner(username);
        property.setPropertyName(req.getParameter("propertyName"));
        property.setPropertyType(req.getParameter("propertyType"));
        property.setPropertyAddr(req.getParameter("propertyAddr"));
        property.setPropertyRate(Double.parseDouble(req.getParameter("propertyRate")));

//        List<Part> imageParts = new ArrayList<>();

//        Collection<Part> parts = req.getParts();
//        for (Part part : parts) {
//            if (part.getName().equals("images[]")) {
//                imageParts.add(part);
//            }
//        }
//
//        for (Part imagePart : imageParts) {
//            InputStream inputStream = null;
//            if (imagePart != null) {
//                long fileSize = imagePart.getSize();
//                String fileContent = imagePart.getContentType();
//                inputStream = imagePart.getInputStream();
//
//                byte[] imageData = toByteArray(inputStream);
//                System.out.println(Arrays.toString(imageData));
//                property.setImageData(imageData);
//            }
//        }

        Part imagePart = req.getPart("image");
        InputStream inputStream = null;

        if (imagePart != null) {
            long fileSize = imagePart.getSize();
            String fileContent = imagePart.getContentType();
            inputStream = imagePart.getInputStream();
        }
        property.setIs(inputStream);

        try {
            PropertyDAO.createProperty(property);

            doGet(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }

    private byte[] toByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        return output.toByteArray();
    }
}
