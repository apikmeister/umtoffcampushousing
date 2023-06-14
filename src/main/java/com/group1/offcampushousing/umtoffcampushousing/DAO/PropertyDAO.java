package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.group1.offcampushousing.umtoffcampushousing.models.Property;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;
import com.group1.offcampushousing.umtoffcampushousing.utils.ImageUtils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public static int updateProperty(Property e) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("update users set email=?, password=? where username=?");
//            ps.setString(1, e.getEmail());
//            ps.setString(2, e.getPassword());

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
            PreparedStatement ps = conn.prepareStatement("delete from users where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
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
                property.setPropertyType(rs.getString(3));
                property.setPropertyAddr(rs.getString(4));
//                property.setPropertyRate(rs.getString(5));
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

}
