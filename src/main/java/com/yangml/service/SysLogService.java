package com.yangml.service;

import com.yangml.utils.JsonResult;

public interface SysLogService {
    JsonResult findAllSysLog(int pageNumber, int pageSize);
}
