package com.yangml.service;

import com.yangml.pojo.CreditScore;
import com.yangml.utils.JsonResult;

public interface CreditScoreService {
    JsonResult findAllCreditScore(int pageNumber, int pageSize);
    JsonResult findCreditByCsId(int csId);
    JsonResult addCreditScore(CreditScore creditScore);
    JsonResult updCreditScore(CreditScore creditScore);
    JsonResult delCreditScoreBycsId(int csId);

}
