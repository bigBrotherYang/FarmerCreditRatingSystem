package com.yangml.controller;

import com.yangml.service.SysLogService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("sysLog")
public class SysLogController {
    @Autowired
    private SysLogService logService;

    @ResponseBody
    @RequestMapping("/findAllSysLog")
    public JsonResult findAllSysLog(int pageNumber, int pageSize) {
        return logService.findAllSysLog(pageNumber, pageSize);
    }
}
