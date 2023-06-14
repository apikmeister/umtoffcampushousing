package com.group1.offcampushousing.umtoffcampushousing.DAO;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.group1.offcampushousing.umtoffcampushousing.models.Post;
import com.group1.offcampushousing.umtoffcampushousing.utils.DatabaseUtils;
import com.group1.offcampushousing.umtoffcampushousing.utils.ImageUtils;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    public static int createPost(Post p) {

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO post(content, username, likes, replies, image) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, p.getContent());
            ps.setString(2, p.getUsername());
            ps.setInt(3, p.getLikes());
            ps.setObject(4, p.getReplies());
            ps.setBlob(5, p.getIs());

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    int postId = rs.getInt(1);
                    p.setId(postId);
                    return postId;
                }
            }

            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return -1;
    }

    public static int updatePost(Post p) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE post SET content = ? WHERE id = ? AND username = ?");
            ps.setString(1, p.getContent());
            ps.setInt(2, p.getId());
            ps.setString(3, p.getUsername());

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int deletePost(int postId) {
        int status = 0;
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM post WHERE id = ?");
            ps.setInt(1, postId);

            status = ps.executeUpdate();
            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();

        try {
            Connection conn = DatabaseUtils.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM post ORDER BY id DESC");

            ObjectMapper objectMapper = new ObjectMapper();

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setContent(rs.getString("content"));
                post.setUsername(rs.getString("username"));
                post.setLikes(rs.getInt("likes"));
                InputStream imageInputStream = rs.getBinaryStream("image");
                if (imageInputStream != null) {
                    String imageData = ImageUtils.convertInputStreamToBase64(imageInputStream);
                    post.setImage(imageData);
                }

                String repliesJson = rs.getString("replies");
                if (repliesJson != null && !repliesJson.isEmpty()) {
                    List<String> replies = objectMapper.readValue(repliesJson, new TypeReference<List<String>>() {
                    });
                    post.setReplies(replies);
                }

                posts.add(post);
            }

            DatabaseUtils.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return posts;
    }

    public static Post getPostById(int postId) {

        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM post where id = ?");
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setContent(rs.getString("content"));
                    post.setUsername(rs.getString("username"));
                    post.setLikes(rs.getInt("likes"));
                    post.setBlob(rs.getBlob("image"));

                    return post;
                }
            }

            DatabaseUtils.closeConnection(conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void incrementLikes(int postId) {
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE post SET likes = likes + 1 WHERE id = ?");
            ps.setInt(1, postId);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addReply(int postId, String reply) {
        try {
            Connection conn = DatabaseUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE post SET replies = JSON_ARRAY_APPEND(replies, '$', ?) WHERE id = ?");
            ps.setString(1, reply);
            ps.setInt(2, postId);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
