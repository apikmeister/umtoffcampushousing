package com.group1.offcampushousing.umtoffcampushousing.controllers;

import com.group1.offcampushousing.umtoffcampushousing.DAO.PostDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Post;
import org.cloudinary.json.JSONException;
import org.cloudinary.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet("/post")
public class PostController extends HttpServlet {

    private PostDAO postDAO;

    public void init() {
        postDAO = new PostDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            if (action != null && action.equals("like")) {
                handleLike(req, res);
            } else if (action != null && action.equals("reply")) {
                handleReply(req, res);
            } else {
                handlePost(req, res, session);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Post> posts = PostDAO.getAllPosts();

        req.setAttribute("posts", posts);

        req.getRequestDispatcher("housemateFinder.jsp").forward(req, res);
    }

    private void handleLike(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int postId = Integer.parseInt(req.getParameter("postId"));
        String username = req.getParameter("username");

        PostDAO postDAO = new PostDAO();
        postDAO.incrementLikes(postId);

        Post post = postDAO.getPostById(postId);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write("{ \"likes\": " + post.getLikes() + " }");
    }

    private void handleReply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tweetId = Integer.parseInt(request.getParameter("tweetId"));
        String username = request.getParameter("username");
        String replyContent = request.getParameter("replyContent");

        postDAO.addReply(tweetId, replyContent);

        // Redirect back to the home page
        response.sendRedirect(request.getContextPath() + "/home?username=" + username);
    }

    private void handlePost(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

        String content = req.getParameter("content");
        String username = (String) session.getAttribute("username");

//        Part imagePart = req.getPart("image");
//
//        byte[] imageData = null;
//        if (imagePart != null && imagePart.getSize() > 0) {
//            InputStream inputStream = imagePart.getInputStream();
//            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//            byte[] buffer = new byte[4096];
//            int bytesRead;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            imageData = outputStream.toByteArray();
//        }

//        Post post = new Post();
//
////        if (imageData != null) {
////            post.setContent(content);
////            post.setUsername(username);
////            post.setImage(imageData);
////        } else {
//        post.setContent(content);
//        post.setUsername(username);
////        }
//
//        try {
//            postDAO.createPost(post);
//
//            String jsonResponse = "{ \"success\": true, \"postContent\": \"" + post.getContent() + "\" }";
//
//            // Set the response content type and character encoding
//            res.setContentType("application/json");
//            res.setCharacterEncoding("UTF-8");
//
//            // Send the JSON response
//            res.getWriter().write(jsonResponse);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        if (content != null) {
            // Process the content value
            Post post = new Post();
            post.setContent(content);
            post.setUsername(username);

            try {
                postDAO.createPost(post);

                String jsonResponse = "{ \"success\": true, \"postContent\": \"" + post.getContent() + "\" }";

                // Set the response content type and character encoding
                res.setContentType("application/json");
                res.setCharacterEncoding("UTF-8");

                // Send the JSON response
                res.getWriter().write(jsonResponse);
            } catch (IOException e) {
                e.printStackTrace();

                String jsonResponse = "{ \"success\": false }";

                // Set the response content type and character encoding
                res.setContentType("application/json");
                res.setCharacterEncoding("UTF-8");

                // Send the JSON response
                res.getWriter().write(jsonResponse);
            }
        } else {
            String jsonResponse = "{ \"success\": false }";

            // Set the response content type and character encoding
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");

            // Send the JSON response
            res.getWriter().write(jsonResponse);
        }

        // Redirect back to the home page
//        res.sendRedirect(req.getContextPath() + "/home?username=" + username);
    }

    private String readContentFromInputStream(InputStream inputStream) throws IOException {
        StringBuilder contentBuilder = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                contentBuilder.append(line);
            }
        }

        return contentBuilder.toString();
    }
}
