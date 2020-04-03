package com.yangml.service.impl;

import com.yangml.dao.RoleMapper;
import com.yangml.pojo.Role;
import com.yangml.service.RoleService;
import com.yangml.utils.JsonResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public JsonResult addRole(Role role) {
        int rows = roleMapper.insertSelective(role);
        JsonResult result = new JsonResult();
        if (1<rows){
            result.setMsg("增加失败");
        }else{
            result.setMsg("增加成功");
            result.setUrl("/findAllRole");
        }
        return result;
    }

    @Override
    public JsonResult updRole(Role role) {
        int rows = roleMapper.updateByPrimaryKeySelective(role);
        JsonResult j = new JsonResult();
        if (1<rows){
            j.setMsg("修改失败");
        }else{
            j.setMsg("修改成功");
            j.setUrl("/findAllRole");
        }
        return null;
    }

    @Override
    public JsonResult delRole(int roleId) {
        JsonResult jsonResult = new JsonResult();
        List<Integer> list = roleMapper.delcheck(roleId);
        if (!list.isEmpty()){
            jsonResult.setMsg("当前角色被其他用户使用禁止删除。");
            return jsonResult;
        }
        int rows = roleMapper.delRoleById(roleId);

        if (1<rows){
            jsonResult.setMsg("删除角色失败");
        }else{
            jsonResult.setMsg("删除角色成功");
        }
        return jsonResult;
    }

    @Override
    public JsonResult checkRole(Map map) {
        Role role = roleMapper.checkRole(map);
        JsonResult j = new JsonResult();
        if (null == role){
            j.setMsg("当前角色不存在");
        }else{
            j.setMsg("存在当前角色");
            j.setResult(role);
        }
        return j;
    }

    @Override
    public JsonResult<List<Role>> findAllRole() {
        List<Role> roleList = roleMapper.findAllRole();
        JsonResult<List<Role>> jsonResult = new JsonResult<>();
        if (roleList == null || roleList.isEmpty()){
            jsonResult.setMsg("角色为NULL");
        }else{
            jsonResult.setMsg("OK");
            jsonResult.setResult(roleList);
        }
        return jsonResult;
    }

    @Override
    public Set<Role> findRoleByUserId(@Param("userId") int userId) {
        Set<Role> roleSet = roleMapper.findRoleByUserId(userId);
        return roleSet;
    }
}
