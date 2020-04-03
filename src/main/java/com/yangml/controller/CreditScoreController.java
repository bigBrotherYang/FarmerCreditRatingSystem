package com.yangml.controller;

import com.yangml.pojo.AssessorInf;
import com.yangml.pojo.CreditScore;
import com.yangml.pojo.User;
import com.yangml.service.AssessorService;
import com.yangml.service.CreditScoreService;
import com.yangml.service.FarmersInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("credit")
public class CreditScoreController {

    @Autowired
    private CreditScoreService creditScoreService;

    @Autowired
    private FarmersInfService farmersInfService;

    @Autowired
    private AssessorService assessorService;

    @ResponseBody
    @RequestMapping("/findAllPublicfarmerInf")
    public JsonResult findAllPublicfarmerInf() {
        JsonResult jsonResult = farmersInfService.findAllPublicFarmer();
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/findAllCreditScore")
    public JsonResult findAllCreditScore(int pageNumber, int pageSize) {
        JsonResult jsonResult = creditScoreService.findAllCreditScore(pageNumber, pageSize);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/addCreditScore")
    public JsonResult addCreditScore(HttpServletRequest request, CreditScore creditScore) {
        User user = (User) request.getSession().getAttribute("user");
        AssessorInf ass = assessorService.findAssessorByUserId(user.getUserId());
        creditScore.setCsOperator(ass.getAssName());
        JsonResult jsonResult = creditScoreService.addCreditScore(creditScore);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/delCreditScoreBycsId")
    public JsonResult delCreditScoreBycsId(int csId) {
        JsonResult jsonResult = creditScoreService.delCreditScoreBycsId(csId);
        return jsonResult;
    }
    @ResponseBody
    @RequestMapping("/findCreditByCsId")
    public JsonResult findCreditByCsId(int csId) {
        JsonResult jsonResult = creditScoreService.findCreditByCsId(csId);
        return jsonResult;
    }
    @ResponseBody
    @RequestMapping("/updCreditScore")
    public JsonResult updCreditScore(HttpServletRequest request, CreditScore creditScore) {
        User user = (User) request.getSession().getAttribute("user");
        AssessorInf ass = assessorService.findAssessorByUserId(user.getUserId());
        creditScore.setCsOperator(ass.getAssName());
        JsonResult jsonResult = creditScoreService.updCreditScore(creditScore);
        return jsonResult;
    }

}
