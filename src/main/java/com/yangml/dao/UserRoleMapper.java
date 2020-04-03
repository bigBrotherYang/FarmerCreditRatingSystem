package com.yangml.dao;

import com.yangml.pojo.UserRoleKey;

public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);

    int deleteRoleByUserId(int userId);
}