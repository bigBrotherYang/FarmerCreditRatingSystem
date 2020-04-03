package com.yangml.dao;

import com.yangml.pojo.FarmerPublicInf;

import java.util.List;

public interface FarmerPublicInfMapper {
    int deleteByPrimaryKey(Integer farmerId);

    int insert(FarmerPublicInf record);

    int insertSelective(FarmerPublicInf record);

    FarmerPublicInf selectByPrimaryKey(Integer farmerId);

    int updateByPrimaryKeySelective(FarmerPublicInf record);

    int updateByPrimaryKey(FarmerPublicInf record);

    int deleteFarmerPublicInf(Integer userId);

    FarmerPublicInf findFarmerPubInfByUserId (Integer userId);

    int updateByUserISelective(FarmerPublicInf record);

    List<FarmerPublicInf> findAllFarmersInf();

}