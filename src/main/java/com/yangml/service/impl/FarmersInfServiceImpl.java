package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.FarmerPublicInfMapper;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.FarmerPublicInf;
import com.yangml.service.FarmersInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FarmersInfServiceImpl implements FarmersInfService {
    @Autowired
    private FarmerPublicInfMapper  farmerPublicInfMapper;
    @Override
    public JsonResult<PageInfo<FarmerPublicInf>> findAllFarmersInf(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "FARMER_ID desc");
        List<FarmerPublicInf> list = farmerPublicInfMapper.findAllFarmersInf();
        PageInfo<FarmerPublicInf> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<FarmerPublicInf>> j = new JsonResult<PageInfo<FarmerPublicInf>>("OK", pageInfo, "200");
        return j;
    }

    @Override
    public JsonResult findAllPublicFarmer() {
        JsonResult jsonResult = new JsonResult();
        List<FarmerPublicInf> list = farmerPublicInfMapper.findAllFarmersInf();
        jsonResult.setMsg("OK");
        jsonResult.setResult(list);
        return jsonResult;
    }

}
