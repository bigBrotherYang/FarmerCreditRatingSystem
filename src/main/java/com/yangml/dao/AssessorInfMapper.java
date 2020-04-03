package com.yangml.dao;

import com.yangml.pojo.AssessorInf;

import java.util.List;

public interface AssessorInfMapper {
    int deleteByPrimaryKey(Integer assId);

    int insert(AssessorInf record);

    int insertSelective(AssessorInf record);

    AssessorInf selectByPrimaryKey(Integer assId);

    int updateByPrimaryKeySelective(AssessorInf record);

    int updateByPrimaryKey(AssessorInf record);

    int deleteAssessorInfByUserId(Integer userId);

    AssessorInf findAssessorInfByUserId(Integer userId);

    int updateByUserIdSelective(AssessorInf record);

    List<AssessorInf> findAllAssessor();
}