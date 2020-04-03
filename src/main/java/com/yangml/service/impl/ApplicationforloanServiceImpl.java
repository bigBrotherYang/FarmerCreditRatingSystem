package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.LoanrRecordMapper;
import com.yangml.pojo.FarmerprivInf;
import com.yangml.pojo.LoanrRecord;
import com.yangml.service.ApplicationforloanService;
import com.yangml.service.FarmerprivInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ApplicationforloanServiceImpl implements ApplicationforloanService {
    @Autowired
    private LoanrRecordMapper loanrRecordMapper;

    @Autowired
    private FarmerprivInfService infService;

    @Transactional
    @Override
    public JsonResult addLoanrRecord(LoanrRecord loanrRecord) {
        JsonResult jsonResult = new JsonResult();
        FarmerprivInf inf = infService.findFByUserId(loanrRecord.getUserId());
        loanrRecord.setExamine(inf.getExamine());
        loanrRecord.setExamineContext(inf.getExamineContext());
        loanrRecord.setExamineOperator(inf.getExamineOperator());
        loanrRecord.setExamineLoan(inf.getExamineLoan());
        loanrRecord.setExamineContextLoan(inf.getExamineContextLoan());
        loanrRecord.setExamineOperatorLoan(inf.getExamineOperatorLoan());
        loanrRecordMapper.insertSelective(loanrRecord);
        Map map = new HashMap();
        map.put("money",loanrRecord.getLrMoney());
        map.put("userId",loanrRecord.getUserId());
        map.put("examine",0);
        map.put("examineContext","无");
        map.put("examineOperator","无");
        map.put("examineLoan",0);
        map.put("examineContextLoan","无");
        map.put("examineOperatorLoan","无");
        infService.uploadMoney(map);
        jsonResult.setMsg("OK");
        return jsonResult;
    }
    @Transactional
    @Override
    public JsonResult<PageInfo<LoanrRecord>> findAllLoanrRecord(int userId,int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize, "lr_id desc");
        List<LoanrRecord> list = loanrRecordMapper.findAllLoanrRecord(userId);

        PageInfo<LoanrRecord> pageInfo = new PageInfo<>(list);
        JsonResult<PageInfo<LoanrRecord>> j = new JsonResult<PageInfo<LoanrRecord>>("OK", pageInfo, "200");
        return j;
    }
}
