package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.group1.offcampushousing.umtoffcampushousing.models.Property;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;
import com.group1.offcampushousing.umtoffcampushousing.utils.ImageUtils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class PropertyDAO {

    public static int createProperty(Property p) {
        int status = 0;

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                    "insert into property(propertyName, propertyOwner, propertyType, propertyAddr, propertyRate, propertyImage) values (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, p.getPropertyName());
            ps.setString(2, p.getPropertyOwner());
            ps.setString(3, p.getPropertyType());
            ps.setString(4, p.getPropertyAddr());
            ps.setDouble(5, p.getPropertyRate());
            ps.setBlob(6, p.getIs());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int updateProperty(Property p) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE property set propertyName = ?, propertyType = ?, propertyAddr = ?, propertyRate = ?, propertyImage = ?  where propertyID = ?");
            ps.setString(1, p.getPropertyName());
            ps.setString(2, p.getPropertyType());
            ps.setString(3, p.getPropertyAddr());
            ps.setDouble(4, p.getPropertyRate());
            ps.setBlob(5, p.getIs());
            ps.setInt(6, p.getPropertyId());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int deleteProperty(int id) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from property where propertyID = ?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<Property> getPropertyByOwner(String owner) {
        Property property = new Property();
        List<Property> propertyList = new ArrayList<Property>();


        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM property where propertyOwner = ?");
            ps.setString(1, owner);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                property.setPropertyId(rs.getInt(1));
                property.setPropertyName(rs.getString(2));
                property.setPropertyOwner(rs.getString(3));
                property.setPropertyType(rs.getString(4));
                property.setPropertyAddr(rs.getString(5));
                property.setPropertyRate(rs.getDouble(6));
                InputStream imageInputStream = rs.getBinaryStream(7);
                if (imageInputStream != null) {
                    String imageData = ImageUtils.convertInputStreamToBase64(imageInputStream);
                    property.setImage(imageData);
                }

                propertyList.add(property);

            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return propertyList;
    }

    public static void storeSubscriptionId(String propertyId, String rentBy) {
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE property set rentBy = ?  where propertyID = ?");
//            ps.setString(1, subscriptionId);
            ps.setString(1, rentBy);
            ps.setString(2, propertyId);

            ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public static Property getPropertyById(int id) {
        Property property = new Property();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM property where propertyID = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                property.setPropertyId(rs.getInt(1));
                property.setPropertyName(rs.getString(2));
                property.setPropertyOwner(rs.getString(3));
                property.setPropertyType(rs.getString(4));
                property.setPropertyAddr(rs.getString(5));
                property.setPropertyRate(rs.getDouble(6));
                DecimalFormat decimalFormat = new DecimalFormat("0.00");
                InputStream imageInputStream = rs.getBinaryStream(7);
                if (imageInputStream != null) {
                    String imageData = ImageUtils.convertInputStreamToBase64(imageInputStream);
                    property.setImage(imageData);
                }
                property.setRentBy(rs.getString(10));
            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return property;
    }

    public static List<Property> getAllProperty() {
        List<Property> propertyList = new ArrayList<Property>();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from property");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property property = new Property();
                property.setPropertyId(rs.getInt(1));
                property.setPropertyName(rs.getString(2));
                property.setPropertyOwner(rs.getString(3));
                property.setPropertyType(rs.getString(4));
                property.setPropertyAddr(rs.getString(5));
                property.setPropertyRate(rs.getDouble(6));
                InputStream imageInputStream = rs.getBinaryStream(7);
                if (imageInputStream != null) {
                    String imageData = ImageUtils.convertInputStreamToBase64(imageInputStream);
                    property.setImage(imageData);
                }

                propertyList.add(property);
            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return propertyList;
    }

    public static boolean hasSubscription(String username, int propertyId) {

        Property p = getPropertyById(propertyId);

        return p.getRentBy() != null && p.getRentBy().equals(username);
    }
}
