package com.yangml.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class MonthlyScore {
    private Integer msofId;

    private Float msofScore;
    @JsonFormat(pattern = "yyyy-MM")
    private Date createTime;

    private Integer userId;

    private FarmerPublicInf publicInf;

    public FarmerPublicInf getPublicInf() {
        return publicInf;
    }

    public void setPublicInf(FarmerPublicInf publicInf) {
        this.publicInf = publicInf;
    }

    public Integer getMsofId() {
        return msofId;
    }

    public void setMsofId(Integer msofId) {
        this.msofId = msofId;
    }

    public Float getMsofScore() {
        return msofScore;
    }

    public void setMsofScore(Float msofScore) {
        this.msofScore = msofScore;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}