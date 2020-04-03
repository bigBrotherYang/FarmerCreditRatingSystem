package com.yangml.service;

import com.yangml.pojo.Menu;
import com.yangml.utils.JsonResult;

import java.util.List;
import java.util.Map;

public interface MenuService {
    JsonResult<List<Menu>> findMenuByRoleId(Map map);
}
