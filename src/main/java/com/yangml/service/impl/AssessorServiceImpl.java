package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.AssessorInfMapper;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.User;
import com.yangml.service.AssessorService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssessorServiceImpl implements AssessorService {
    @Autowired
    private AssessorInfMapper assessorInfMapper;

    @Override
    public JsonResult<PageInfo<AssessorInf>> findAllAssessor(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "ASS_ID desc");
        List<AssessorInf> list = assessorInfMapper.findAllAssessor();
        PageInfo<AssessorInf> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<AssessorInf>> j = new JsonResult<PageInfo<AssessorInf>>("OK", pageInfo, "200");
        return j;
    }

    @Override
    public AssessorInf findAssessorByUserId(Integer userId) {
        AssessorInf assessorInfByUserId = assessorInfMapper.findAssessorInfByUserId(userId);
        return assessorInfByUserId;
    }
}
