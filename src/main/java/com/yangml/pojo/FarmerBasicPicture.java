package com.yangml.pojo;

public class FarmerBasicPicture {
    private Integer fbpId;

    private String fbpLoanUrl;

    private String fbpProductionUrl;

    private Integer userId;

    public Integer getFbpId() {
        return fbpId;
    }

    public void setFbpId(Integer fbpId) {
        this.fbpId = fbpId;
    }

    public String getFbpLoanUrl() {
        return fbpLoanUrl;
    }

    public void setFbpLoanUrl(String fbpLoanUrl) {
        this.fbpLoanUrl = fbpLoanUrl == null ? null : fbpLoanUrl.trim();
    }

    public String getFbpProductionUrl() {
        return fbpProductionUrl;
    }

    public void setFbpProductionUrl(String fbpProductionUrl) {
        this.fbpProductionUrl = fbpProductionUrl == null ? null : fbpProductionUrl.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}