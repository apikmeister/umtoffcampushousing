package com.group1.offcampushousing.umtoffcampushousing.servlets;

import com.group1.offcampushousing.umtoffcampushousing.DAO.UserDao;
import com.group1.offcampushousing.umtoffcampushousing.models.User;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;
import com.group1.offcampushousing.umtoffcampushousing.utils.RateLimitedUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.ssl.SSLContextBuilder;

import javax.net.ssl.SSLContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String LOGIN_URL = "https://pelajar.mynemo.umt.edu.my/portal_login_ldap.php";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = new User();
        user.setUsername(req.getParameter("uid"));
        user.setPassword(req.getParameter("pwd"));

//        SSLUtils.disableSSLVerification();
        List<NameValuePair> payload = new ArrayList<>();
        payload.add(new BasicNameValuePair("login", "student"));
        payload.add(new BasicNameValuePair("uid", user.getUsername()));
        payload.add(new BasicNameValuePair("pwd", user.getPassword()));
        payload.add(new BasicNameValuePair("submit", "Log Masuk"));
        try {
            String ipAddress = req.getRemoteAddr();

            if (RateLimitedUtils.isRateLimited(ipAddress)) {
                // Request rate exceeded, return rate limit error response
                res.setStatus(HttpServletResponse.SC_REQUEST_TIMEOUT);
                res.getWriter().write("Rate limit exceeded. Please try again later.");
            } else {
                if (isLoginSuccessful(payload)) {
//                    res.getWriter().write("Login successful!");
                    req.setAttribute("uid", user.getUsername());
                    UserDao.save(user);
                    req.getRequestDispatcher("").forward(req, res);
                } else if (isCredentialsValid(user.getUsername(), user.getPassword())) {
                    req.setAttribute("uid", user.getUsername());
//                    res.getWriter().write("Login successful!");
                    req.getRequestDispatcher("index.jsp").forward(req, res);
                } else {
                    res.sendRedirect("login.jsp");
                    res.getWriter().write("Login failed!");
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private boolean isLoginSuccessful(List<NameValuePair> payload) throws Exception {
        SSLContext sslContext = SSLContextBuilder.create().loadTrustMaterial((chain, authType) -> true).build();

        CloseableHttpClient httpclient = HttpClients.custom()
                .setSSLContext(sslContext)
                .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE)
                .build();

        HttpPost httppost = new HttpPost(LOGIN_URL);
        httppost.setEntity(new UrlEncodedFormEntity(payload));
        HttpResponse response = httpclient.execute(httppost);
        boolean isSuccessful = false;

        System.out.println(response.getStatusLine());
        System.out.println(response.getStatusLine().getStatusCode());

        if (response.getStatusLine().getStatusCode() == 302) {
            isSuccessful = true;
        }
        response.getEntity().getContent().close();
        return isSuccessful;
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
            if (rs.next()) {
                int count = rs.getInt(1);
                isValid = count > 0;
            }
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
