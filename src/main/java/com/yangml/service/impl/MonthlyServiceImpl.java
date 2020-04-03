package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.MonthlyScoreMapper;
import com.yangml.pojo.CreditScore;
import com.yangml.pojo.FarmerprivInf;
import com.yangml.pojo.MonthlyScore;
import com.yangml.service.FarmerprivInfService;
import com.yangml.service.FarmersInfService;
import com.yangml.service.MonthlyService;
import com.yangml.utils.JsonResult;
import com.yangml.utils.MathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class MonthlyServiceImpl implements MonthlyService {
    @Autowired
    private MonthlyScoreMapper monthlyScoreMapper;

    @Autowired
    private FarmerprivInfService farmerprivInfService;
    @Autowired
    private FarmersInfService findAllFarmersInf;

//    @Override
//    public JsonResult<PageInfo<MonthlyScore>> findAllMonthlyScore(int pageNumber, int pageSize) {
//        PageHelper.startPage(pageNumber, pageSize);
//        PageHelper.startPage(pageNumber, pageSize, "msof_id desc");
//        List<MonthlyScore> list = monthlyScoreMapper.findAllMonthlyScore();
//        PageInfo<MonthlyScore> pageInfo = new PageInfo<>(list);
//        JsonResult<PageInfo<MonthlyScore>> j = new JsonResult<PageInfo<MonthlyScore>>("OK", pageInfo, "200");
//        return j;
//    }


    @Scheduled(cron ="0 15 10 L * ?")
    @Override
    public int addMonthlyScore(MonthlyScore monthlyScore) {
        /**
         *  每个月月底查询一次 所有用户的评分 然后统计。
         */
        new Thread(new Runnable() {
            @Override
            public void run() {
                List<FarmerprivInf> allFarmerInftoMonth = farmerprivInfService.findAllFarmerInftoMonth();
                for (int i = 0; i <allFarmerInftoMonth.size() ; i++) {
                    FarmerprivInf farmerprivInf = allFarmerInftoMonth.get(i);
                    MonthlyScore ms = new MonthlyScore();
                    ms.setCreateTime(new Date());
                    ms.setMsofScore(Float.parseFloat(farmerprivInf.getTotalCreditScore()));
                    ms.setUserId(farmerprivInf.getUserId());
                    monthlyScoreMapper.insertSelective(ms);
                }
            }
        }).start();
        return 0;
    }

    @Override
    public JsonResult<List<MonthlyScore>> findMonthlyScoreByUserId(int userId) {
        List<MonthlyScore> monthlyScoreUserId = monthlyScoreMapper.findMonthlyScoreUserId(userId);
        JsonResult<List<MonthlyScore>> jsonResult = new JsonResult<>();
        jsonResult.setMsg("OK");
        jsonResult.setResult(monthlyScoreUserId);
        return jsonResult;
    }
}
