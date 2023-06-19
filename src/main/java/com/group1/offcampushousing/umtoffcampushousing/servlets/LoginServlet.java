package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.UserDao;
import com.group1.offcampushousing.umtoffcampushousing.models.User;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = new User();
        user.setUsername(req.getParameter("uid"));
        user.setPassword(req.getParameter("pwd"));

        try {
            if (isCredentialsValid(user.getUsername(), user.getPassword())) {
                HttpSession session = req.getSession();
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", UserDao.getUserRole(user.getUsername()));
                req.getRequestDispatcher("index.jsp").forward(req, res);
            } else {
                res.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private boolean isCredentialsValid(String username, String password) throws Exception {
        Connection myConnection = DatabaseUtils.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isValid = false;
        try {
            String sql = "SELECT * FROM users WHERE uid = ? AND password = ?";
            stmt = myConnection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            isValid = rs.next();
        } catch (SQLException e) {
            throw new Exception("Database error", e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (myConnection != null) {
                myConnection.close();
            }
        }
        return isValid;
    }
}
