package com.group1.offcampushousing.umtoffcampushousing.models;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

public class Post {

    private int id;
    private String content;
    private String username;
    private int likes;
    private List<String> replies;
    private String image;
    private InputStream is;
    private Blob blob;

    public Post() {
    }

    public Post(String content, String username, String image) {
        this.content = content;
        this.username = username;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public List<String> getReplies() {
        return replies;
    }

    public void setReplies(List<String> replies) {
        this.replies = replies;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public InputStream getIs() {
        return is;
    }

    public void setIs(InputStream is) {
        this.is = is;
    }

    public Blob getBlob() {
        return blob;
    }

    public void setBlob(Blob blob) {
        this.blob = blob;
    }


}
