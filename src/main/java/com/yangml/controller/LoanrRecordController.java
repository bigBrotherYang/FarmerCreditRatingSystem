package com.yangml.controller;

import com.yangml.pojo.LoanrRecord;
import com.yangml.pojo.User;
import com.yangml.service.ApplicationforloanService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("loanrrecord")
public class LoanrRecordController {

    @Autowired
    private ApplicationforloanService applicationforloanService;

    @ResponseBody
    @RequestMapping("/addLoanrRecord")
    public JsonResult addLoanrRecord(HttpServletRequest request, LoanrRecord loanrRecord) {
        User user = (User) request.getSession().getAttribute("user");
        loanrRecord.setUserId(user.getUserId());
        return applicationforloanService.addLoanrRecord(loanrRecord);
    }

    @ResponseBody
    @RequestMapping("/findAllLoanrRecord")
    public JsonResult findAllLoanrRecord(HttpServletRequest request, int pageNumber, int pageSize) {
        User user = (User) request.getSession().getAttribute("user");
        return applicationforloanService.findAllLoanrRecord(user.getUserId(),pageNumber, pageSize);
    }

}
