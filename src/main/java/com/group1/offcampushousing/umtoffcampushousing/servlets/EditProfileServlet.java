package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.UserDao;
import com.group1.offcampushousing.umtoffcampushousing.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User updatedUser = new User();
        updatedUser.setUsername(req.getParameter("userId"));
        updatedUser.setEmail(req.getParameter("email"));
        updatedUser.setFirstName(req.getParameter("firstName"));
        updatedUser.setLastName(req.getParameter("lastName"));
        HttpSession session = req.getSession();
        updatedUser.setUsername((String) session.getAttribute("username"));

        userDao.updateUser(updatedUser);

        res.sendRedirect("userProfile.jsp");
    }
}
