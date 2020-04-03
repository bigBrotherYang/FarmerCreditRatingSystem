package com.yangml.service;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.AssessorInf;
import com.yangml.utils.JsonResult;

import java.util.List;

public interface AssessorService {
    JsonResult<PageInfo<AssessorInf>>  findAllAssessor(int pageNumber, int pageSize);
    AssessorInf findAssessorByUserId(Integer userId);
}
