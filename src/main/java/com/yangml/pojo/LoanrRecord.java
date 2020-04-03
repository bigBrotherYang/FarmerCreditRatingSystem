package com.yangml.pojo;

public class LoanrRecord {
    private Integer lrId;

    private String lrName;

    private Float lrMoney;

    private Integer examine;

    private String examineContext;

    private String examineOperator;

    private Integer examineLoan;

    private String examineContextLoan;

    private String examineOperatorLoan;

    private Integer userId;

    private FarmerPublicInf publicInf;

    public FarmerPublicInf getPublicInf() {
        return publicInf;
    }

    public void setPublicInf(FarmerPublicInf publicInf) {
        this.publicInf = publicInf;
    }

    public Integer getLrId() {
        return lrId;
    }

    public void setLrId(Integer lrId) {
        this.lrId = lrId;
    }

    public String getLrName() {
        return lrName;
    }

    public void setLrName(String lrName) {
        this.lrName = lrName == null ? null : lrName.trim();
    }

    public Float getLrMoney() {
        return lrMoney;
    }

    public void setLrMoney(Float lrMoney) {
        this.lrMoney = lrMoney;
    }

    public Integer getExamine() {
        return examine;
    }

    public void setExamine(Integer examine) {
        this.examine = examine;
    }

    public String getExamineContext() {
        return examineContext;
    }

    public void setExamineContext(String examineContext) {
        this.examineContext = examineContext == null ? null : examineContext.trim();
    }

    public String getExamineOperator() {
        return examineOperator;
    }

    public void setExamineOperator(String examineOperator) {
        this.examineOperator = examineOperator == null ? null : examineOperator.trim();
    }

    public Integer getExamineLoan() {
        return examineLoan;
    }

    public void setExamineLoan(Integer examineLoan) {
        this.examineLoan = examineLoan;
    }

    public String getExamineContextLoan() {
        return examineContextLoan;
    }

    public void setExamineContextLoan(String examineContextLoan) {
        this.examineContextLoan = examineContextLoan == null ? null : examineContextLoan.trim();
    }

    public String getExamineOperatorLoan() {
        return examineOperatorLoan;
    }

    public void setExamineOperatorLoan(String examineOperatorLoan) {
        this.examineOperatorLoan = examineOperatorLoan == null ? null : examineOperatorLoan.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}