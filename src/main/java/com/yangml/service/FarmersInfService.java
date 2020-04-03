package com.yangml.service;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.FarmerPublicInf;
import com.yangml.utils.JsonResult;

public interface FarmersInfService {
    JsonResult<PageInfo<FarmerPublicInf>> findAllFarmersInf(int pageNumber, int pageSize);
    JsonResult findAllPublicFarmer();
}
