package com.yangml.pojo;

public class FarmerprivInf {
    private Integer farpId;

    private Float farpAge; //年龄

    private Float farpPoliticalInf;//政治

    private Float farpMarriageInf;//婚姻

    private Float farpCultureInf;//文化

    private Float farpHealthInf;//健康

    private Float farpRaiseInf;//抚养

    private Float farpFamilyIncome;//家庭

    private Float farpVehicle;//机动车

    private Float farpLoanAmount;//借款金额

    private Float farpUsage;

    private Float farpMortgageGuarantee;

    private Float farpSelfFunded;

    private Float farpBusinessLife;

    private Float farpIndustryDevelopment;

    private Integer userId;

    private Integer examine;// 审核状态 0 未审核 1审核通过  2需重审 3审核不通过

    private String examineContext; //审核意见

    private String examineOperator; //审核员

    private Integer examineLoan;// 审核状态 0 未审核 1审核通过 3审核不通过

    private String examineContextLoan; //审核意见

    private String examineOperatorLoan; //审核员
    private FarmerPublicInf publicInf; //公开信息信息。
    private String totalCreditScore;

    public String getTotalCreditScore() {
        return totalCreditScore;
    }

    public void setTotalCreditScore(String totalCreditScore) {
        this.totalCreditScore = totalCreditScore;
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
        this.examineContextLoan = examineContextLoan;
    }

    public String getExamineOperatorLoan() {
        return examineOperatorLoan;
    }

    public void setExamineOperatorLoan(String examineOperatorLoan) {
        this.examineOperatorLoan = examineOperatorLoan;
    }

    public String getExamineOperator() {
        return examineOperator;
    }

    public void setExamineOperator(String examineOperator) {
        this.examineOperator = examineOperator;
    }

    public String getExamineContext() {
        return examineContext;
    }

    public void setExamineContext(String examineContext) {
        this.examineContext = examineContext;
    }

    public Integer getExamine() {
        return examine;
    }

    public void setExamine(Integer examine) {
        this.examine = examine;
    }

    public FarmerPublicInf getPublicInf() {
        return publicInf;
    }

    public void setPublicInf(FarmerPublicInf publicInf) {
        this.publicInf = publicInf;
    }

    public Integer getFarpId() {
        return farpId;
    }

    public void setFarpId(Integer farpId) {
        this.farpId = farpId;
    }

    public Float getFarpAge() {
        return farpAge;
    }

    public void setFarpAge(Float farpAge) {
        this.farpAge = farpAge;
    }

    public Float getFarpPoliticalInf() {
        return farpPoliticalInf;
    }

    public void setFarpPoliticalInf(Float farpPoliticalInf) {
        this.farpPoliticalInf = farpPoliticalInf;
    }

    public Float getFarpMarriageInf() {
        return farpMarriageInf;
    }

    public void setFarpMarriageInf(Float farpMarriageInf) {
        this.farpMarriageInf = farpMarriageInf;
    }

    public Float getFarpCultureInf() {
        return farpCultureInf;
    }

    public void setFarpCultureInf(Float farpCultureInf) {
        this.farpCultureInf = farpCultureInf;
    }

    public Float getFarpHealthInf() {
        return farpHealthInf;
    }

    public void setFarpHealthInf(Float farpHealthInf) {
        this.farpHealthInf = farpHealthInf;
    }

    public Float getFarpRaiseInf() {
        return farpRaiseInf;
    }

    public void setFarpRaiseInf(Float farpRaiseInf) {
        this.farpRaiseInf = farpRaiseInf;
    }

    public Float getFarpFamilyIncome() {
        return farpFamilyIncome;
    }

    public void setFarpFamilyIncome(Float farpFamilyIncome) {
        this.farpFamilyIncome = farpFamilyIncome;
    }

    public Float getFarpVehicle() {
        return farpVehicle;
    }

    public void setFarpVehicle(Float farpVehicle) {
        this.farpVehicle = farpVehicle;
    }

    public Float getFarpLoanAmount() {
        return farpLoanAmount;
    }

    public void setFarpLoanAmount(Float farpLoanAmount) {
        this.farpLoanAmount = farpLoanAmount;
    }

    public Float getFarpUsage() {
        return farpUsage;
    }

    public void setFarpUsage(Float farpUsage) {
        this.farpUsage = farpUsage;
    }

    public Float getFarpMortgageGuarantee() {
        return farpMortgageGuarantee;
    }

    public void setFarpMortgageGuarantee(Float farpMortgageGuarantee) {
        this.farpMortgageGuarantee = farpMortgageGuarantee;
    }

    public Float getFarpSelfFunded() {
        return farpSelfFunded;
    }

    public void setFarpSelfFunded(Float farpSelfFunded) {
        this.farpSelfFunded = farpSelfFunded;
    }

    public Float getFarpBusinessLife() {
        return farpBusinessLife;
    }

    public void setFarpBusinessLife(Float farpBusinessLife) {
        this.farpBusinessLife = farpBusinessLife;
    }

    public Float getFarpIndustryDevelopment() {
        return farpIndustryDevelopment;
    }

    public void setFarpIndustryDevelopment(Float farpIndustryDevelopment) {
        this.farpIndustryDevelopment = farpIndustryDevelopment;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}