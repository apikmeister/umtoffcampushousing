package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/editProperty")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class EditPropertyServlet extends HttpServlet {

    private PropertyDAO propertyDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("delete")) {
            int propertyId = Integer.parseInt(req.getParameter("id"));
            try {
                PropertyDAO.deleteProperty(propertyId);
                req.setAttribute("deleteMessage", "Property deleted successfully");
            } catch (Exception e) {
                e.printStackTrace();
                res.sendRedirect("error.jsp");
            }
        } else {
            // Set the property as a request attribute
            req.setAttribute("propertyId", Integer.parseInt(req.getParameter("id")));

            // Forward the request to the edit property page (editProperty.jsp)
            req.getRequestDispatcher("editProperty.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();

        res.setContentType("text/html;charset=UTF-8");
        String username = (String) session.getAttribute("username");

        Property updatedProperty = new Property();
        updatedProperty.setPropertyName(req.getParameter("propertyName"));
        updatedProperty.setPropertyType(req.getParameter("propertyType"));
        updatedProperty.setPropertyAddr(req.getParameter("propertyAddr"));
        updatedProperty.setPropertyRate(Double.parseDouble(req.getParameter("propertyRate")));

        Part imagePart = req.getPart("image");
        InputStream inputStream = null;

        if (imagePart != null) {
            long fileSize = imagePart.getSize();
            String fileContent = imagePart.getContentType();
            inputStream = imagePart.getInputStream();
        }
        updatedProperty.setIs(inputStream);

        try {
            PropertyDAO.updateProperty(updatedProperty);

            res.sendRedirect("propertyListing.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }

    }
}

