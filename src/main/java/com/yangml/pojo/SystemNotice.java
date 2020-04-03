package com.yangml.pojo;

import java.util.Date;

public class SystemNotice {
    private Integer snId;

    private String snNotice;

    private Date createTime;

    public Integer getSnId() {
        return snId;
    }

    public void setSnId(Integer snId) {
        this.snId = snId;
    }

    public String getSnNotice() {
        return snNotice;
    }

    public void setSnNotice(String snNotice) {
        this.snNotice = snNotice == null ? null : snNotice.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}