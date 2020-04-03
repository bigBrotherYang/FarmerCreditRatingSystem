package com.yangml.pojo;

public class CreditScore {
    private Integer csId;

    private String csContext;

    private Integer csScore;

    private Integer userId;

    private String csOperator;


    private FarmerPublicInf publicInf;

    public String getCsOperator() {
        return csOperator;
    }

    public void setCsOperator(String csOperator) {
        this.csOperator = csOperator;
    }

    public FarmerPublicInf getPublicInf() {
        return publicInf;
    }

    public void setPublicInf(FarmerPublicInf publicInf) {
        this.publicInf = publicInf;
    }

    public Integer getCsId() {
        return csId;
    }

    public void setCsId(Integer csId) {
        this.csId = csId;
    }

    public String getCsContext() {
        return csContext;
    }

    public void setCsContext(String csContext) {
        this.csContext = csContext == null ? null : csContext.trim();
    }

    public Integer getCsScore() {
        return csScore;
    }

    public void setCsScore(Integer csScore) {
        this.csScore = csScore;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}