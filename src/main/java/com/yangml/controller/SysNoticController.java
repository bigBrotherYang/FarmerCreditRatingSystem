package com.yangml.controller;

import com.yangml.pojo.SystemNotice;
import com.yangml.service.SysNoticeSerivce;
import com.yangml.utils.JsonResult;
import com.yangml.utils.MathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("notic")
public class SysNoticController {
    @Autowired
    private SysNoticeSerivce noticeSerivce;

    @ResponseBody
    @RequestMapping("/snednotic")
    public JsonResult snednotic(SystemNotice notice) {
        JsonResult jsonResult = noticeSerivce.sendNotice(notice);
        MathUtils.isShowNots=true;
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/delNotic")
    public JsonResult delNotic(int snId) {
        JsonResult jsonResult = noticeSerivce.delNotice(snId);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/topNotic")
    public JsonResult topNotic() {
        JsonResult jsonResult = noticeSerivce.topNotic();
        if (MathUtils.isShowNots){
            jsonResult.setMsg("OK");
            MathUtils.isShowNots = false;
        }else{
            jsonResult.setMsg("NO");
            return jsonResult;
        }

        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/noticList")
    public JsonResult noticList(int pageNumber, int pageSize) {
        JsonResult jsonResult = noticeSerivce.noticList(pageNumber, pageSize);
        return jsonResult;
    }
}
