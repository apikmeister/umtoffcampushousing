package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.group1.offcampushousing.umtoffcampushousing.models.User;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;

import java.util.*;
import java.sql.*;

public class UserDao {

    public static int save(User e) {
        int status = 0;

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                    "insert into users(uid, email, firstName, lastName, role, password) values (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, e.getUsername());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getFirstName());
            ps.setString(4, e.getLastName());
            ps.setString(5, e.getRole());
            ps.setString(6, e.getPassword());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int updateUser(User e) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET email = ?, firstName = ?, lastName = ? WHERE uid = ?");
            ps.setString(1, e.getEmail());
            ps.setString(2, e.getFirstName());
            ps.setString(3, e.getLastName());
            ps.setString(4, e.getUsername());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int delete(int id) {
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

    public static String getUserRole(String uid) {
        User e = new User();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("select role from users where uid = ?");
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setRole(rs.getString("role"));
            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e.getRole();
    }

    public static User getUserByUid(String uid) {
        User e = new User();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from users where uid = ?");
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setUsername(rs.getString(1));
                e.setEmail(rs.getString(2));
                e.setFirstName(rs.getString(3));
                e.setLastName(rs.getString(4));
                e.setRole(rs.getString(5));
                e.setPassword(rs.getString(6));
            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public static List<User> getAllUsers() {
        List<User> list = new ArrayList<User>();

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from users");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User e = new User();
//                e.setId(rs.getInt(1));
                e.setUsername(rs.getString(2));
                e.setPassword(rs.getString(3));
//                e.setRole(rs.getString(4));
                list.add(e);
            }
            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
