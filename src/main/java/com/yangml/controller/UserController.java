package com.yangml.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.pojo.User;
import com.yangml.service.UserService;
import com.yangml.utils.JsonResult;
import com.yangml.utils.MathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/checkLogin")
    public JsonResult checkLogin(HttpServletRequest request, User uses) {
        JsonResult<User> userJsonResult = userService.checkLogin(uses.getUserName(), uses.getUserPwd());
        User result = userJsonResult.getResult();
        if (result != null) {
            MathUtils.isShowNots=true;
            request.getSession().setAttribute("user", result);
        }
        return userJsonResult;
    }

    @ResponseBody
    @RequestMapping("/registerUser")
    public JsonResult registerUser(User user) {
        JsonResult<User> userJsonResult = userService.registerUser(user);
        return userJsonResult;
    }

    @ResponseBody
    @RequestMapping("/delUser")
    public JsonResult delUser(int userId) {
        JsonResult jsonResult = userService.delUser(userId);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/updUser")
    public JsonResult updUser(User user) {
        return userService.updUser(user);
    }

    @ResponseBody
    @RequestMapping("/findAllUser")
    public JsonResult findAllUser(int pageNumber, int pageSize) {
        return userService.findAllUser(pageNumber, pageSize);
    }

    @ResponseBody
    @RequestMapping("/allowLogin")
    public JsonResult allowLogin(int allowLogin, int userId) {
        Map map = new HashMap();
        map.put("allowLogin", allowLogin);
        map.put("userId", userId);
        return userService.allowLogin(map);
    }

    @ResponseBody
    @RequestMapping("/findUserById")
    public JsonResult findUserById(HttpServletRequest request,Integer userId) {
        //个人信息查询
        if (userId == -1){
            User user = (User) request.getSession().getAttribute("user");
            userId = user.getUserId();
        }

        return userService.findUserById(userId);
    }



    @RequestMapping("/main")
    public String main() {

        return "index";
    }
}
