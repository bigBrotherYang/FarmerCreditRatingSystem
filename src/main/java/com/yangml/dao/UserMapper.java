package com.yangml.dao;

import com.yangml.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


    User checkLogin(Map map);


    List<User> findAllUser();

    User findUserById(Integer userId);

    int  allowLogin(Map map);
}