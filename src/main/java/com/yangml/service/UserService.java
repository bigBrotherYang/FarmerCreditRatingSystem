package com.yangml.service;

import com.yangml.pojo.User;
import com.yangml.utils.JsonResult;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;


public interface UserService {

        JsonResult<User> checkLogin(String userName, String userPwd);
        JsonResult  registerUser(User user);
        JsonResult  delUser(int userId);
        JsonResult  allowLogin(Map map);
        JsonResult  updUser(User user);
        JsonResult findAllUser(int  pageNumber,int pageSize);
        JsonResult<User> findUserById(Integer userId);

}
