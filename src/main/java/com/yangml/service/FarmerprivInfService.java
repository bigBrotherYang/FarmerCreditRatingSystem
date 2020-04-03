package com.yangml.service;

import com.yangml.pojo.FarmerBasicPicture;
import com.yangml.pojo.FarmerprivInf;
import com.yangml.pojo.User;
import com.yangml.utils.JsonResult;

import java.util.List;
import java.util.Map;

public interface FarmerprivInfService {
    JsonResult saveFarmerivInf(FarmerprivInf farmerprivInf);
    JsonResult findFarmerinInfByUserId(int userId);
    JsonResult findApprovalLoanInfByFarpId(int farpId);
    int uploadPicture(FarmerBasicPicture farmerBasicPicture);
    JsonResult findBasicPictureByUserId(int userId);
    JsonResult  findAllFarmerInf(int pageNumber, int pageSize);
    JsonResult  findAllLoanFarmer(int pageNumber, int pageSize);
    JsonResult updateExamine(FarmerprivInf farmerprivInf);

    JsonResult updApprovalLoanInf(User user, FarmerprivInf farmerprivInf);
    List<FarmerprivInf> findAllFarmerInftoMonth();

    List<FarmerprivInf>  findFaremTotalScore();

    int uploadMoney(Map map);

    FarmerprivInf findFByUserId(int userId);
}
