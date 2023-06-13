package com.group1.offcampushousing.umtoffcampushousing.models;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Property {

    private int propertyId;
    private String propertyName;
    private String propertyType;
    private String propertyAddr;
    private String propertyRate;
    private List<String> propertyImage;
    private String dateAdded;

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

    public String getPropertyRate() {
        return propertyRate;
    }

    public void setPropertyRate(String propertyRate) {
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
}
