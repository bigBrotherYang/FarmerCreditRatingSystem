package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.SysLogMapper;
import com.yangml.pojo.SysLog;
import com.yangml.pojo.User;
import com.yangml.service.SysLogService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysLogServiceImpl implements SysLogService {
    @Autowired
    private SysLogMapper logMapper;
    @Override
    public JsonResult findAllSysLog(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
            PageHelper.startPage(pageNumber, pageSize, "LOG_ID desc");
        List<SysLog> list = logMapper.findAllSysLog();
        PageInfo<SysLog> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<SysLog>> j = new JsonResult<PageInfo<SysLog>>("OK", pageInfo, "200");
        return j;
    }
}
