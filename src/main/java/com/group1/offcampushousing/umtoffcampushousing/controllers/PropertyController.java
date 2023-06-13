package com.group1.offcampushousing.umtoffcampushousing.controllers;

import com.group1.offcampushousing.umtoffcampushousing.DAO.PostDAO;
import com.group1.offcampushousing.umtoffcampushousing.DAO.PropertyDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/property/*")
public class PropertyController extends HttpServlet {

    private PropertyDAO propertyDAO;

    public void init() {
        propertyDAO = new PropertyDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); // Get the remaining path after "/property/"
        if (pathInfo != null) {
            String propertyId = pathInfo.substring(1); // Remove the leading slash
            // Retrieve the house details based on the propertyId from your data source
            Property property = propertyDAO.getPropertyById(Integer.parseInt(propertyId));
            request.setAttribute("house", property);
            request.getRequestDispatcher("/propertyDetails.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
