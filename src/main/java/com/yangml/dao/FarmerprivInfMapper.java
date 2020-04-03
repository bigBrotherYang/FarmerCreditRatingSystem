package com.yangml.dao;

import com.yangml.pojo.FarmerBasicPicture;
import com.yangml.pojo.FarmerprivInf;

import java.util.List;
import java.util.Map;

public interface FarmerprivInfMapper {
    int deleteByPrimaryKey(Integer farpId);

    int deleteByUserId(Integer userId);

    int insert(FarmerprivInf record);

    int insertSelective(FarmerprivInf record);

    FarmerprivInf selectByPrimaryKey(Integer farpId);

    int updateByPrimaryKeySelective(FarmerprivInf record);

    int updateByPrimaryKey(FarmerprivInf record);

    FarmerprivInf findFarmerinInfByUserId(Integer userId);

    List<FarmerprivInf> findAllFarmerInf();

    List<FarmerprivInf> findAllLoanFarmer();

    /**
     * 查询所有农户的 信息 和总评分。
     */
    List<FarmerprivInf> findFaremTotalScore();

    FarmerprivInf findApprovalLoanInfByFarpId(int farpId);

    int updateExamine(FarmerprivInf farmerprivInf);

    int updApprovalLoanInf(FarmerprivInf farmerprivInf);

    int uploadMoney(Map map);


}