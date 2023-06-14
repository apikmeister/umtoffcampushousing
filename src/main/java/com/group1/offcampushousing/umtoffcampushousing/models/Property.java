package com.group1.offcampushousing.umtoffcampushousing.models;

import java.io.InputStream;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Property {

    private int propertyId;
    private String propertyName;
    private String propertyOwner;
    private String propertyType;
    private String propertyAddr;
    private double propertyRate;
    private List<String> propertyImage;
    private String dateAdded;
    private InputStream is;
    private Blob blob;
    private byte[] imageData;
    private String image;

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getPropertyOwner() {
        return propertyOwner;
    }

    public void setPropertyOwner(String propertyOwner) {
        this.propertyOwner = propertyOwner;
    }

    public String getPropertyType() {
        return propertyType;
    }

    public void setPropertyType(String propertyType) {
        this.propertyType = propertyType;
    }

    public String getPropertyAddr() {
        return propertyAddr;
    }

    public void setPropertyAddr(String propertyAddr) {
        this.propertyAddr = propertyAddr;
    }

    public double getPropertyRate() {
        return propertyRate;
    }

    public void setPropertyRate(double propertyRate) {
        this.propertyRate = propertyRate;
    }

    public List<String> getPropertyImage() {
        return propertyImage;
    }

    public void setPropertyImage(List<String> propertyImage) {
        this.propertyImage = propertyImage;
    }

    public String getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
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

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
