package com.yangml.dao;

import com.yangml.pojo.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MenuMapper {
    int insert(Menu record);

    int insertSelective(Menu record);

    List<Menu> findMenuByRoleId(@Param("roleMap")Map roleMap);
}