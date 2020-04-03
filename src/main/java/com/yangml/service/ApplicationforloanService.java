package com.yangml.service;

import com.github.pagehelper.PageInfo;
import com.yangml.pojo.LoanrRecord;
import com.yangml.utils.JsonResult;

public interface ApplicationforloanService {

    JsonResult addLoanrRecord(LoanrRecord loanrRecord);
    JsonResult<PageInfo<LoanrRecord>>  findAllLoanrRecord(int userId, int pageNumber, int pageSize);

}
