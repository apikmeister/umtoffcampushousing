package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.group1.offcampushousing.umtoffcampushousing.models.User;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;

import java.util.*;
import java.sql.*;

public class UserDao {

    public static int save(User e) {
        int status = 0;

        try {
            Connection con = DatabaseUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "insert into users(uid, email, password) values (?, ?, ?)"
            );
            ps.setString(1, e.getUsername());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getPassword());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(con);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int update(User e) {
        int status = 0;
        try {
            Connection con = DatabaseUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("update users set email=?, password=? where username=?");
            ps.setString(1, e.getEmail());
            ps.setString(2, e.getPassword());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(con);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int delete(int id) {
        int status = 0;
        try {
            Connection con = DatabaseUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from users where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static User getUserById(int id) {
        User e = new User();

        try {
            Connection con = DatabaseUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
//                e.setId(rs.getInt(1));
                e.setUsername(rs.getString(2));
                e.setPassword(rs.getString(3));
//                e.setRole(rs.getString(4));
            }
            DatabaseUtils.closeConnection(con);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public static List<User> getAllUsers() {
        List<User> list = new ArrayList<User>();

        try {
            Connection con = DatabaseUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User e = new User();
//                e.setId(rs.getInt(1));
                e.setUsername(rs.getString(2));
                e.setPassword(rs.getString(3));
//                e.setRole(rs.getString(4));
                list.add(e);
            }
            DatabaseUtils.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
