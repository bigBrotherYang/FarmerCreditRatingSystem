package com.yangml.controller;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.FarmerPublicInf;
import com.yangml.pojo.MonthlyScore;
import com.yangml.pojo.User;
import com.yangml.service.FarmersInfService;
import com.yangml.service.MonthlyService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("monthLy")
public class MonthLyController {

    @Autowired
    private MonthlyService monthlyService;

    @Autowired
    private FarmersInfService farmersInfService;

    @ResponseBody
    @RequestMapping("/findAllFarmersInf")
    public JsonResult findAllFarmersInf(int pageNumber, int pageSize){
        JsonResult<PageInfo<FarmerPublicInf>> allMonthlyScore = farmersInfService.findAllFarmersInf(pageNumber, pageSize);
        return allMonthlyScore;
    }

    @ResponseBody
    @RequestMapping("/findMonthlyScoreByUserId")
    public JsonResult findMonthlyScoreByUserId(int userId){
        JsonResult<List<MonthlyScore>> allMonthlyScore = monthlyService.findMonthlyScoreByUserId(userId);
        return allMonthlyScore;
    }


    @ResponseBody
    @RequestMapping("/findSelfMonthlyScoreByUserId")
    public JsonResult findSelfMonthlyScoreByUserId(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        JsonResult<List<MonthlyScore>> allMonthlyScore = monthlyService.findMonthlyScoreByUserId(user.getUserId());
        return allMonthlyScore;
    }
}
