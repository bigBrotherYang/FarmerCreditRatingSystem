package com.yangml.service;

import com.yangml.pojo.Role;
import com.yangml.utils.JsonResult;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface RoleService {
    JsonResult addRole(Role role);
    JsonResult updRole(Role role);
    JsonResult delRole(int roleId);
    JsonResult checkRole(Map map);
    JsonResult<List<Role>> findAllRole();
    Set<Role> findRoleByUserId(int userId);
}
