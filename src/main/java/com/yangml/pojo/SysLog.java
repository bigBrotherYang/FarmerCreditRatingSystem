package com.yangml.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class SysLog {
    private Integer logId;

    private String opeerationUser;

    private String opeerationMethod;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date opeerationTime;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getOpeerationUser() {
        return opeerationUser;
    }

    public void setOpeerationUser(String opeerationUser) {
        this.opeerationUser = opeerationUser == null ? null : opeerationUser.trim();
    }

    public String getOpeerationMethod() {
        return opeerationMethod;
    }

    public void setOpeerationMethod(String opeerationMethod) {
        this.opeerationMethod = opeerationMethod == null ? null : opeerationMethod.trim();
    }

    public Date getOpeerationTime() {
        return opeerationTime;
    }

    public void setOpeerationTime(Date opeerationTime) {
        this.opeerationTime = opeerationTime;
    }
}