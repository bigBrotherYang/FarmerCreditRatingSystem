package com.yangml.controller;

import com.yangml.dao.RoleMapper;
import com.yangml.pojo.Role;
import com.yangml.service.RoleService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Set;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAllRoles")
    @ResponseBody
    public JsonResult findAllRoles(){
        return roleService.findAllRole();
    }

    @RequestMapping("/findRoleByUserId")
    @ResponseBody
    public JsonResult findRoleByUserId(int userId){
        Set<Role> roleSet = roleService.findRoleByUserId(userId);
        JsonResult jsonResult = new JsonResult();
        jsonResult.setResult(roleSet);
        return jsonResult;
    }
}
