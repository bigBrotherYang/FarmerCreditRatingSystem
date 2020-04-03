package com.yangml.dao;

import com.yangml.pojo.FarmerBasicPicture;

public interface FarmerBasicPictureMapper {
    int deleteByPrimaryKey(Integer fbpId);

    int insert(FarmerBasicPicture record);

    int insertSelective(FarmerBasicPicture record);

    FarmerBasicPicture selectByPrimaryKey(Integer fbpId);

    int updateByUserIdSelective(FarmerBasicPicture record);


    int updateByPrimaryKey(FarmerBasicPicture record);


    FarmerBasicPicture findPictureByuserId(Integer userId);
}