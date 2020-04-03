package com.yangml.pojo;

import java.util.Date;
import java.util.List;

public class User{
    private Integer userId;

    private String userName;

    private String userPwd;
    /*是否允许登入*/
    private Integer allowLogin;

    private AssessorInf assessorInf;

    private FarmerPublicInf farmerPublicInf;

    private String createdBy;

    private Date createdTime;

    private String updatedBy;

    private Date updatedTime;

    private String[] roles;

    private List<Role> roleList;

    public AssessorInf getAssessorInf() {
        return assessorInf;
    }

    public void setAssessorInf(AssessorInf assessorInf) {
        this.assessorInf = assessorInf;
    }

    public FarmerPublicInf getFarmerPublicInf() {
        return farmerPublicInf;
    }

    public void setFarmerPublicInf(FarmerPublicInf farmerPublicInf) {
        this.farmerPublicInf = farmerPublicInf;
    }

    public String[] getRoles() {
        return roles;
    }

    public void setRoles(String[] roles) {
        this.roles = roles;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public Integer getAllowLogin() {
        return allowLogin;
    }

    public void setAllowLogin(Integer allowLogin) {
        this.allowLogin = allowLogin;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }
}