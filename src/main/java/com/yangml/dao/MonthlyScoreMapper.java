package com.yangml.dao;

import com.yangml.pojo.MonthlyScore;

import java.util.List;

public interface MonthlyScoreMapper {
    int deleteByPrimaryKey(Integer msofId);

    int insert(MonthlyScore record);

    int insertSelective(MonthlyScore record);

    MonthlyScore selectByPrimaryKey(Integer msofId);

    int updateByPrimaryKeySelective(MonthlyScore record);

    int updateByPrimaryKey(MonthlyScore record);

    List<MonthlyScore> findAllMonthlyScore();

    List<MonthlyScore> findMonthlyScoreUserId(int userId);
}