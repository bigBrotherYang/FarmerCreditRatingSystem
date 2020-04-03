package com.yangml.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.User;
import com.yangml.service.AssessorService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("assessor")
public class AssessorController  {
    @Autowired
    private AssessorService assessorService;
   @ResponseBody
    @RequestMapping("/findAssessorInf")
    public  JsonResult<PageInfo<AssessorInf>>   findAssessorInf(int pageNumber, int pageSize){
        return assessorService.findAllAssessor(pageNumber,pageSize);
    }
}
