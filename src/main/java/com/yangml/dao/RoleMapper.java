package com.yangml.dao;

import com.yangml.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface RoleMapper {
    int insert(Role record);

    int insertSelective(Role record);

    int updateByPrimaryKeySelective(Role role);

    int delRoleById(int  roleId);

    Role checkRole(Map map);

    List<Role>  findAllRole();

    /**
     *
     * @param roleId
     * @return 用户信息
     *  删除当前角色时需要检查当前角色是否被使用。
     */
    List<Integer> delcheck(int roleId);

    Set<Role> findRoleByUserId(@Param("userId") int userId);
}