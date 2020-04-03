package com.yangml.service.impl;

import com.yangml.dao.MenuMapper;
import com.yangml.pojo.Menu;
import com.yangml.service.MenuService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public JsonResult<List<Menu>> findMenuByRoleId(Map map) {
        JsonResult jsonResult = new JsonResult();
        List<Menu> menus = menuMapper.findMenuByRoleId(map);
        if (menus.isEmpty()){
            jsonResult.setMsg("当前角色没有任何可执行的菜单");
        }else{
            jsonResult.setMsg("查询到菜单");
            jsonResult.setResult(menus);
        }
        return jsonResult;
    }
}
