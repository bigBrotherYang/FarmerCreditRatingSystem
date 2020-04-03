package com.yangml.pojo;

import java.util.Date;

public class AssessorInf {
    private Integer assId;

    private String assName;

    private String assJobNumber;

    private String assJob;

    private Date createdTime;

    private Date updatedTime;

    private Integer userId;

    public Integer getAssId() {
        return assId;
    }

    public void setAssId(Integer assId) {
        this.assId = assId;
    }

    public String getAssName() {
        return assName;
    }

    public void setAssName(String assName) {
        this.assName = assName == null ? null : assName.trim();
    }

    public String getAssJobNumber() {
        return assJobNumber;
    }

    public void setAssJobNumber(String assJobNumber) {
        this.assJobNumber = assJobNumber == null ? null : assJobNumber.trim();
    }

    public String getAssJob() {
        return assJob;
    }

    public void setAssJob(String assJob) {
        this.assJob = assJob == null ? null : assJob.trim();
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