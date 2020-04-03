package com.yangml.pojo;

import java.util.Date;

public class FarmerPublicInf {
    private Integer farmerId;

    private String farmerName;

    private String farmerCardId;

    private String farmerLoadInfo;

    private Date createdTime;

    private Date updatedTime;

    private Integer userId;

    public Integer getFarmerId() {
        return farmerId;
    }

    public void setFarmerId(Integer farmerId) {
        this.farmerId = farmerId;
    }

    public String getFarmerName() {
        return farmerName;
    }

    public void setFarmerName(String farmerName) {
        this.farmerName = farmerName == null ? null : farmerName.trim();
    }

    public String getFarmerCardId() {
        return farmerCardId;
    }

    public void setFarmerCardId(String farmerCardId) {
        this.farmerCardId = farmerCardId == null ? null : farmerCardId.trim();
    }

    public String getFarmerLoadInfo() {
        return farmerLoadInfo;
    }

    public void setFarmerLoadInfo(String farmerLoadInfo) {
        this.farmerLoadInfo = farmerLoadInfo == null ? null : farmerLoadInfo.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}