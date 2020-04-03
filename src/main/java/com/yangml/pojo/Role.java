package com.yangml.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class Role implements Serializable {
    private static final long serialVersionUID = 2065067144015169288L;
    private Integer roleId;

    private String roleName;

    private String createdBy;

    private Date createdTime;

    private String updatedBy;

    private Date updatedTime;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Role role = (Role) o;
        return Objects.equals(roleId, role.roleId) &&
                Objects.equals(roleName, role.roleName) &&
                Objects.equals(createdBy, role.createdBy) &&
                Objects.equals(createdTime, role.createdTime) &&
                Objects.equals(updatedBy, role.updatedBy) &&
                Objects.equals(updatedTime, role.updatedTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(roleId, roleName, createdBy, createdTime, updatedBy, updatedTime);
    }
}