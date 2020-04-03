package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.AssessorInfMapper;
import com.yangml.dao.FarmerPublicInfMapper;
import com.yangml.dao.UserMapper;
import com.yangml.dao.UserRoleMapper;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.FarmerPublicInf;
import com.yangml.pojo.User;
import com.yangml.pojo.UserRoleKey;
import com.yangml.service.UserService;
import com.yangml.utils.JsonResult;
import com.yangml.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.beans.Transient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private AssessorInfMapper assessorInfMapper;
    @Autowired
    private FarmerPublicInfMapper farmerPublicInfMapper;

    @Override
    public JsonResult<User> checkLogin(String userName, String userPwd) {
        Map map = new HashMap();
        map.put("userName", userName);
        map.put("userPwd", MD5Utils.getSaltMD5(userPwd));
        User user = userMapper.checkLogin(map);
        JsonResult<User> result = new JsonResult<User>();
        if (null == user) {
            result.setMsg("账户或者密码错误。");
        } else {
            if (user.getAllowLogin() == 0) {
                result.setMsg("当前账户禁止登入请联系管理员");
                return result;
            }
            result.setResult(user);
            result.setUrl("/main");
        }
        return result;
    }
    @Transactional
    @Override
    public JsonResult registerUser(User user) {
        JsonResult jsonResult = new JsonResult();
        try {
            user.setUserPwd(MD5Utils.getSaltMD5(user.getUserPwd()));
             userMapper.insertSelective(user);
             if (user.getAssessorInf()!=null){
                 AssessorInf assessorInf = user.getAssessorInf();
                 assessorInf.setUserId(user.getUserId());
                 assessorInfMapper.insertSelective(assessorInf);
             }
             if (user.getFarmerPublicInf()!=null){
                 FarmerPublicInf farmerPublicInf = user.getFarmerPublicInf();
                 farmerPublicInf.setUserId(user.getUserId());
                 farmerPublicInfMapper.insertSelective(farmerPublicInf);
             }
            for (int i = 0; i < user.getRoles().length; i++) {
                UserRoleKey userRoleKey = new UserRoleKey();
                userRoleKey.setUserId(user.getUserId());
                userRoleKey.setRoleId(Integer.parseInt(user.getRoles()[i]));
                userRoleMapper.insert(userRoleKey);
            }
            jsonResult.setMsg("OK");
            jsonResult.setUrl("/findAllUser");
        } catch (Exception e) {
            jsonResult.setMsg("注册失败!");
            e.printStackTrace();
        }


        return jsonResult;
    }
    @Transactional
    @Override
    public JsonResult delUser(int userId) {
        JsonResult jsonResult = new JsonResult();
        try{
            int rows = userRoleMapper.deleteRoleByUserId(userId);
            int row = userMapper.deleteByPrimaryKey(userId);
            assessorInfMapper.deleteByPrimaryKey(userId);
            farmerPublicInfMapper.deleteFarmerPublicInf(userId);
            jsonResult.setMsg("OK");
        }catch (Exception e){
            jsonResult.setMsg("删除失败");
            throw new RuntimeException(e.getMessage());

        }
        return jsonResult;
    }

    @Override
    public JsonResult allowLogin(Map map) {
        JsonResult jsonResult = new JsonResult();
        int rows = userMapper.allowLogin(map);
        if (rows>0){
            jsonResult.setMsg("OK");
        }else{
            jsonResult.setMsg("禁用失败");
        }
        return jsonResult;
    }

    @Transactional
    @Override
    public JsonResult updUser(User user) {
        user.setUserPwd(MD5Utils.getSaltMD5(user.getUserPwd()));
        if (user.getAllowLogin()==null){
            user.setAllowLogin(0);
        }
        JsonResult jsonResult = new JsonResult();
        try{
            userRoleMapper.deleteRoleByUserId(user.getUserId());
            String[] roles = user.getRoles();
            for (int i = 0; i < roles.length; i++) {
                UserRoleKey roleKey = new UserRoleKey();
                roleKey.setUserId(user.getUserId() );
                roleKey.setRoleId(Integer.parseInt(roles[i]));
                userRoleMapper.insert(roleKey);
            }
            userMapper.updateByPrimaryKeySelective(user);
            //修改公开信息。 1管理员 2普通用户 3农户
            if (!roles[0].equals("3")){
                AssessorInf assessorInf = user.getAssessorInf();
                assessorInf.setUserId(user.getUserId());
                assessorInfMapper.updateByUserIdSelective(assessorInf);
            }else{
                FarmerPublicInf farmerPublicInf = user.getFarmerPublicInf();
                farmerPublicInf.setUserId(user.getUserId());
                if (farmerPublicInf!=null){
                    farmerPublicInfMapper.updateByUserISelective(farmerPublicInf);
                }
            }
            jsonResult.setMsg("OK");
        }catch (Exception e){
            jsonResult.setMsg("更新失败");
            throw new RuntimeException("更新失败");

        }
        return jsonResult;
    }

    @Override
    public JsonResult findAllUser(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "user_id desc");
        List<User> list = userMapper.findAllUser();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<User>> j = new JsonResult<PageInfo<User>>("OK", pageInfo, "200");
        return j;
    }
    @Transactional
    @Override
    public JsonResult<User> findUserById(Integer userId) {
        User user = userMapper.findUserById(userId);
        /**
         * 封装修改时候的 公开信息。
         */
        AssessorInf assessorInf = assessorInfMapper.findAssessorInfByUserId(userId);
        if (assessorInf!=null){
            user.setAssessorInf(assessorInf);
        }
        FarmerPublicInf farmerPublicInf = farmerPublicInfMapper.findFarmerPubInfByUserId(userId);
        if (farmerPublicInf!=null){
            user.setFarmerPublicInf(farmerPublicInf);
        }

        JsonResult jsonResult = new JsonResult();
        jsonResult.setResult(user);
        jsonResult.setMsg("OK");
        return jsonResult;
    }
}
