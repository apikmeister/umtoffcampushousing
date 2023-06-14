package com.group1.offcampushousing.umtoffcampushousing.controllers;

import com.group1.offcampushousing.umtoffcampushousing.DAO.PostDAO;
import com.group1.offcampushousing.umtoffcampushousing.models.Post;
import com.group1.offcampushousing.umtoffcampushousing.utils.ImageUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet("/post")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
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
            } else if (action != null && action.equals("delete")) {
                deletePost(req, res, session);
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
        res.setContentType("text/html;charset=UTF-8");
        String content = req.getParameter("content");
        String username = (String) session.getAttribute("username");

        Part imagePart = req.getPart("image");
        InputStream inputStream = null;

        if (imagePart != null) {
            long fileSize = imagePart.getSize();
            String fileContent = imagePart.getContentType();
            inputStream = imagePart.getInputStream();
        }

        if (content != null) {
            // Process the content value
            Post post = new Post();
            post.setContent(content);
            post.setUsername(username);
            post.setIs(inputStream);

            try {
                int postId = postDAO.createPost(post);

                String jsonResponse = "{ \"success\": true, \"postId\": \"" + postId + "\", \"postUser\": \"" + post.getUsername() + "\", \"postContent\": \"" + post.getContent() + "\", \"likes\": \"" + post.getLikes() + "\", \"replies\": \"" + post.getReplies() + "\", \"postImage\": \"" + ImageUtils.convertInputStreamToBase64(post.getIs()) + "\"  }";

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

                res.getWriter().write(jsonResponse);
            }
        } else {
            String jsonResponse = "{ \"success\": false }";

            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");

            res.getWriter().write(jsonResponse);
        }
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));

        PostDAO.deletePost(postId);
        response.sendRedirect("housemateFinder.jsp");

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

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");

        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf("=") + 1).trim().replace("\"", "");
            }
        }

        return "";
    }
}
