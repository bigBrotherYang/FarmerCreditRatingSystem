package com.yangml.dao;

import com.yangml.pojo.SystemNotice;

import java.util.List;

public interface SystemNoticeMapper {
    int deleteByPrimaryKey(Integer snId);

    int insert(SystemNotice record);

    int insertSelective(SystemNotice record);

    SystemNotice selectByPrimaryKey(Integer snId);

    int updateByPrimaryKeySelective(SystemNotice record);

    int updateByPrimaryKey(SystemNotice record);

    SystemNotice topNotic();

    List<SystemNotice> noticList();
}