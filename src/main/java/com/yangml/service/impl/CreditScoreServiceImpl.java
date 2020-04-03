package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.CreditScoreMapper;
import com.yangml.pojo.CreditScore;
import com.yangml.service.CreditScoreService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CreditScoreServiceImpl implements CreditScoreService {



    @Autowired
    private CreditScoreMapper scoreMapper;

    @Override
    public JsonResult findAllCreditScore(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "cs_id desc");
        List<CreditScore> list = scoreMapper.findAllCreditScore();
        PageInfo<CreditScore> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<CreditScore>> j = new JsonResult<PageInfo<CreditScore>>("OK", pageInfo, "200");
        return j;
    }

    @Override
    public JsonResult findCreditByCsId(int csId) {
        JsonResult jsonResult = new JsonResult();
        CreditScore creditByCsId = scoreMapper.findCreditByCsId(csId);
        jsonResult.setResult(creditByCsId);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public JsonResult addCreditScore(CreditScore creditScore) {
        JsonResult jsonResult = new JsonResult();
        scoreMapper.insert(creditScore);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public JsonResult updCreditScore(CreditScore creditScore) {
        JsonResult jsonResult = new JsonResult();
        scoreMapper.updCreditScore(creditScore);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public JsonResult delCreditScoreBycsId(int csId) {
        JsonResult jsonResult = new JsonResult();
        scoreMapper.deleteByPrimaryKey(csId);
        jsonResult.setMsg("OK");
        return jsonResult;
    }
}
