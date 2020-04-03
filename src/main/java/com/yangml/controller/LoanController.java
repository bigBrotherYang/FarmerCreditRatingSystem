package com.yangml.controller;

import com.yangml.dao.FarmerprivInfMapper;
import com.yangml.pojo.FarmerprivInf;
import com.yangml.pojo.User;
import com.yangml.service.FarmerprivInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("loan")
public class LoanController {
    @Autowired
    private FarmerprivInfService infService;

    @ResponseBody
    @RequestMapping("/findAllLoanFarmer")
    public JsonResult findAllLoanFarmer(int pageNumber, int pageSize){
        JsonResult jsonResult = infService.findAllLoanFarmer(pageNumber, pageSize);
        return jsonResult;
    }
    @RequestMapping("/findApprovalLoanInfByFarpId")
    @ResponseBody
    public JsonResult findApprovalLoanInfByFarpId(int farpId){
        JsonResult approvalLoanInfByFarpId = infService.findApprovalLoanInfByFarpId(farpId);
        return approvalLoanInfByFarpId;
    }
    @RequestMapping("/updApprovalLoanInf")
    @ResponseBody
    public JsonResult updApprovalLoanInf(HttpServletRequest request,FarmerprivInf farmerprivInf){
        User user = (User) request.getSession().getAttribute("user");
        JsonResult approvalLoanInfByFarpId = infService.updApprovalLoanInf(user,farmerprivInf);
        return approvalLoanInfByFarpId;
    }



}
