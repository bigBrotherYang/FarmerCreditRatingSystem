package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.SystemNoticeMapper;
import com.yangml.pojo.SystemNotice;
import com.yangml.service.SysNoticeSerivce;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysNoticeSerivceImpl implements SysNoticeSerivce {
    @Autowired
    private SystemNoticeMapper systemNoticeMapper;
    @Override
    public JsonResult sendNotice(SystemNotice notice) {
        JsonResult jsonResult = new JsonResult();
        int i = systemNoticeMapper.insertSelective(notice);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public JsonResult delNotice(int noticeId) {
        JsonResult jsonResult = new JsonResult();
        systemNoticeMapper.deleteByPrimaryKey(noticeId);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public JsonResult topNotic() {
        JsonResult jsonResult = new JsonResult();
        SystemNotice sn = systemNoticeMapper.topNotic();
        jsonResult.setResult(sn);
        jsonResult.setMsg("OK");
        return jsonResult;
    }
    // noticList

    @Override
    public JsonResult noticList(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "sn_id desc");
        List<SystemNotice> list = systemNoticeMapper.noticList();
        PageInfo<SystemNotice> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<SystemNotice>> j = new JsonResult<PageInfo<SystemNotice>>("OK", pageInfo, "200");
        return j;
    }
}
