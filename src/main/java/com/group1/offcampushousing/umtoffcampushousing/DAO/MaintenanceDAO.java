package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.group1.offcampushousing.umtoffcampushousing.models.MaintenanceRecord;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import sun.applet.Main;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MaintenanceDAO {

    public static int createMaintenanceRecord(MaintenanceRecord m) {
        int status = 0;

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO maintenance_requests(title, description, status) VALUES (?, ?, ?)"
            );
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getDescription());
            ps.setString(3, m.getStatus());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int updateMaintenanceRecord(MaintenanceRecord m) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE maintenance_requests SET title = ?, description = ?, status = ? WHERE id = ?");
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getDescription());
            ps.setString(3, m.getStatus());
            ps.setInt(4, m.getId());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int deleteMaintenanceRecord(int maintenanceId) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM maintenance_requests WHERE id = ?");
            ps.setInt(1, maintenanceId);

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<MaintenanceRecord> getMaintenanceRecords() {
        List<MaintenanceRecord> maintenanceRecords = new ArrayList<>();

        try {
            Connection conn = DatabaseUtils.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM maintenance_requests");

            while (rs.next()) {
                MaintenanceRecord record = new MaintenanceRecord();
                record.setId(rs.getInt("id"));
                record.setTitle(rs.getString("title"));
                record.setDescription(rs.getString("description"));
                record.setStatus(rs.getString("status"));
                record.setCreated_at(rs.getString("created_at"));

                maintenanceRecords.add(record);
            }

            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return maintenanceRecords;
    }

    public static MaintenanceRecord getMaintenanceById(int maintenanceId) {
        MaintenanceRecord maintenanceRecord = new MaintenanceRecord();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM maintenance_requests where id = ?");
            ps.setInt(1, maintenanceId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    maintenanceRecord.setId(rs.getInt("id"));
                    maintenanceRecord.setTitle(rs.getString("title"));
                    maintenanceRecord.setDescription(rs.getString("description"));
                    maintenanceRecord.setStatus(rs.getString("status"));

                    return maintenanceRecord;
                }
            }

            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
