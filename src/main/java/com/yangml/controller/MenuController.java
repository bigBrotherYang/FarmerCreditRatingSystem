package com.yangml.controller;

import com.yangml.dao.MenuMapper;
import com.yangml.dao.RoleMapper;
import com.yangml.pojo.Menu;
import com.yangml.pojo.Role;
import com.yangml.pojo.User;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @ResponseBody
    @RequestMapping("/findMenuByRole")
    public JsonResult findMenuByRole(HttpServletRequest request){
        JsonResult jsonResult = new JsonResult();
        User user = (User) request.getSession().getAttribute("user");
        Set<Role> roleSet = roleMapper.findRoleByUserId(user.getUserId());
        Map map = new HashMap();
        Iterator<Role> iterator = roleSet.iterator();
        while (iterator.hasNext()) {
            Role next = iterator.next();
            map.put(next.getRoleId(),next.getRoleId());
        }
        List<Menu> menuByRoleId = menuMapper.findMenuByRoleId(map);
        jsonResult.setResult(menuByRoleId);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

}
