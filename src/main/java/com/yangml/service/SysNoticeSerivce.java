package com.yangml.service;

import com.yangml.pojo.SystemNotice;
import com.yangml.utils.JsonResult;

public interface SysNoticeSerivce {
    public JsonResult sendNotice(SystemNotice notice);
    public JsonResult delNotice(int noticeId);
    public JsonResult topNotic();
    JsonResult noticList(int pageNumber, int pageSize);
}
