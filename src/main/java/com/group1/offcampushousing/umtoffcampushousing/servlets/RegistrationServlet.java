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

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        User user = new User();
        user.setUsername(req.getParameter("uid"));
        user.setEmail(req.getParameter("email"));
        user.setFirstName(req.getParameter("firstName"));
        user.setLastName(req.getParameter("lastName"));
        user.setRole(req.getParameter("role"));
        user.setPassword(req.getParameter("password"));
        HttpSession session = req.getSession();
        session.setAttribute("uid", user.getUsername());
        session.setAttribute("role", req.getParameter("role"));

        UserDao.save(user);
        res.sendRedirect("login.jsp");
    }
}
