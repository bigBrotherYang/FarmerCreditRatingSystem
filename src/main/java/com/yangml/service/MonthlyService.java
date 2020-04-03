package com.yangml.service;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.MonthlyScore;
import com.yangml.utils.JsonResult;

import java.util.List;

public interface MonthlyService {
//    JsonResult<PageInfo<MonthlyScore>> findAllMonthlyScore(int pageNumber, int pageSize);

    int addMonthlyScore(MonthlyScore monthlyScore);
    JsonResult<List<MonthlyScore>> findMonthlyScoreByUserId(int userId);



}
