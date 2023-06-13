package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.MaintenanceDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.MaintenanceRecord;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MaintenanceServlet")
public class MaintenanceServlet extends HttpServlet {
    private MaintenanceDAO maintenanceDAO;

    public void init() {
        maintenanceDAO = new MaintenanceDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }

        switch (action) {
            case "view":
                viewMaintenanceList(request, response);
                break;
            case "add":
                showMaintenanceForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteMaintenance(request, response);
                break;
            default:
                viewMaintenanceList(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addMaintenance(request, response);
                break;
            case "edit":
                updateMaintenance(request, response);
                break;
            default:
                viewMaintenanceList(request, response);
        }
    }

    private void viewMaintenanceList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MaintenanceRecord> maintenanceList = maintenanceDAO.getMaintenanceRecords();
        request.setAttribute("maintenanceList", maintenanceList);
        request.getRequestDispatcher("maintenanceView.jsp").forward(request, response);
    }

    private void showMaintenanceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MaintenanceRecord maintenance = new MaintenanceRecord();

        request.setAttribute("maintenance", maintenance);
        request.getRequestDispatcher("maintenanceForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        MaintenanceRecord maintenance = maintenanceDAO.getMaintenanceById(id);
        request.setAttribute("maintenance", maintenance);
        request.setAttribute("action", action);
        request.getRequestDispatcher("maintenanceForm.jsp").forward(request, response);
    }

    private void addMaintenance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MaintenanceRecord maintenance = new MaintenanceRecord();

        maintenance.setTitle(request.getParameter("title"));
        maintenance.setDescription(request.getParameter("description"));
        maintenance.setStatus(request.getParameter("status"));

        maintenanceDAO.createMaintenanceRecord(maintenance);

        response.sendRedirect("MaintenanceServlet");
    }

    private void updateMaintenance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MaintenanceRecord maintenance = new MaintenanceRecord();

        maintenance.setId(id);
        maintenance.setTitle(request.getParameter("title"));
        maintenance.setDescription(request.getParameter("description"));
        maintenance.setStatus(request.getParameter("status"));

        maintenanceDAO.updateMaintenanceRecord(maintenance);
        response.sendRedirect("MaintenanceServlet");
    }

    private void deleteMaintenance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        maintenanceDAO.deleteMaintenanceRecord(id);
        response.sendRedirect("MaintenanceServlet");
    }
}

