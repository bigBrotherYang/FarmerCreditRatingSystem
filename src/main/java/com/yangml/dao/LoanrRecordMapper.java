package com.yangml.dao;

import com.yangml.pojo.LoanrRecord;

import java.util.List;

public interface LoanrRecordMapper {
    int deleteByPrimaryKey(Integer lrId);

    int insert(LoanrRecord record);

    int insertSelective(LoanrRecord record);

    LoanrRecord selectByPrimaryKey(Integer lrId);

    LoanrRecord findtopLoanrRecord();

    List<LoanrRecord> findAllLoanrRecord(Integer lrId);

    int updateByPrimaryKeySelective(LoanrRecord record);

    int updateByPrimaryKey(LoanrRecord record);
}