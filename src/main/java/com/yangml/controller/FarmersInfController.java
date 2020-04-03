package com.yangml.controller;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.FarmerPublicInf;
import com.yangml.service.AssessorService;
import com.yangml.service.FarmersInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("farmersInf")
public class FarmersInfController {
    @Autowired
    private FarmersInfService farmersInfService;
    @ResponseBody
    @RequestMapping("/findFarmersInf")
    public JsonResult<PageInfo<FarmerPublicInf>> findFarmersInf(int pageNumber, int pageSize){
        return farmersInfService.findAllFarmersInf(pageNumber,pageSize);
    }
}
