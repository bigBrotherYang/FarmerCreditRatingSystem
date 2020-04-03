package com.yangml.dao;

import com.yangml.pojo.SysLog;

import java.util.List;

public interface SysLogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    SysLog selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);

    List<SysLog> findAllSysLog();
}