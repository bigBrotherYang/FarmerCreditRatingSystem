package com.yangml.dao;

import com.yangml.pojo.CreditScore;
import com.yangml.utils.JsonResult;

import java.util.List;

public interface CreditScoreMapper {
    int deleteByPrimaryKey(Integer csId);

    int insert(CreditScore record);

    int insertSelective(CreditScore record);

    CreditScore selectByPrimaryKey(Integer csId);

    CreditScore findCreditByCsId(Integer csId);

    int updateByPrimaryKeySelective(CreditScore record);

    int updateByPrimaryKey(CreditScore record);


    int updCreditScore(CreditScore record);

    List<CreditScore> findAllCreditScore();
    //返回频分总和
    int findCreditByCsUserId(int userId);
}