package com.yangml.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yangml.dao.FarmerBasicPictureMapper;
import com.yangml.dao.FarmerPublicInfMapper;
import com.yangml.dao.FarmerprivInfMapper;
import com.yangml.dao.LoanrRecordMapper;
import com.yangml.pojo.*;
import com.yangml.service.AssessorService;
import com.yangml.service.FarmerprivInfService;
import com.yangml.service.RoleService;
import com.yangml.utils.JsonResult;
import com.yangml.utils.MathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class FarmerprivInfServiceImpl implements FarmerprivInfService {

    @Autowired
    private FarmerBasicPictureMapper farmerBasicPictureMapper;


    @Autowired
    private FarmerprivInfMapper farmerprivInfMapper;

    @Autowired
    private AssessorService assessorService;

    @Autowired
    private RoleService roleService;
    @Autowired
    private LoanrRecordMapper loanrRecordMapper;


    @Transactional
    @Override
    public JsonResult saveFarmerivInf(FarmerprivInf farmerprivInf) {
        JsonResult jsonResult = new JsonResult();
        farmerprivInfMapper.deleteByUserId(farmerprivInf.getUserId());
        farmerprivInfMapper.insertSelective(farmerprivInf);
        jsonResult.setMsg("Ok");
        return jsonResult;
    }

    @Override
    public JsonResult findFarmerinInfByUserId(int userId) {
        JsonResult jsonResult = new JsonResult();
        try {
            FarmerprivInf farmerprivInf = farmerprivInfMapper.findFarmerinInfByUserId(userId);
            if (farmerprivInf!=null){
                jsonResult.setResult(farmerprivInf);
                jsonResult.setMsg("OK");
            }else{
                jsonResult.setMsg("NO");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonResult;
    }

    @Override
    public JsonResult findApprovalLoanInfByFarpId(int farpId) {
        JsonResult jsonResult = new JsonResult();
        FarmerprivInf approvalLoanInfByFarpId = farmerprivInfMapper.findApprovalLoanInfByFarpId(farpId);
        if (null!=approvalLoanInfByFarpId){
            jsonResult.setMsg("OK");
            jsonResult.setResult(MathUtils.farmerprivInfCose(approvalLoanInfByFarpId));
        }
        else
            jsonResult.setMsg("没有查到该用户！");

        return jsonResult;
    }

    @Override
    public int uploadPicture(FarmerBasicPicture farmerBasicPicture) {
        int rows = 0;
        FarmerBasicPicture pictureByuserId = farmerBasicPictureMapper.findPictureByuserId(farmerBasicPicture.getUserId());
        if (pictureByuserId != null) {
            rows = farmerBasicPictureMapper.updateByUserIdSelective(farmerBasicPicture);
        } else {
            rows = farmerBasicPictureMapper.insertSelective(farmerBasicPicture);
        }
        return rows;
    }

    @Override
    public JsonResult findBasicPictureByUserId(int userId) {
        FarmerBasicPicture picture = farmerBasicPictureMapper.findPictureByuserId(userId);
        JsonResult jsonResult = new JsonResult();
        jsonResult.setResult(picture);
        return jsonResult;
    }

    @Override
    public JsonResult<PageInfo<FarmerprivInf>> findAllFarmerInf(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "farp_id desc");
        List<FarmerprivInf> farmerInf = farmerprivInfMapper.findAllFarmerInf();
        PageInfo<FarmerprivInf> pageInfo = new PageInfo<>(farmerInf);
        JsonResult<PageInfo<FarmerprivInf>> j = new JsonResult<PageInfo<FarmerprivInf>>("OK", pageInfo, "200");
        return j;
    }

    @Override
    public JsonResult findAllLoanFarmer(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize, "farp_id desc");
        List<FarmerprivInf> farmerInf = farmerprivInfMapper.findAllLoanFarmer();
        PageInfo<FarmerprivInf> pageInfo = new PageInfo<>(MathUtils.farmerprivInfList(farmerInf));
        JsonResult<PageInfo<FarmerprivInf>> j = new JsonResult<PageInfo<FarmerprivInf>>("OK", pageInfo, "200");
        return j;
    }
    @Transactional
    @Override
    public JsonResult updateExamine(FarmerprivInf farmerprivInf) {
        JsonResult jsonResult = new JsonResult();
        farmerprivInfMapper.updateExamine(farmerprivInf);
        LoanrRecord loanrRecord = loanrRecordMapper.findtopLoanrRecord();
        loanrRecord.setExamine(farmerprivInf.getExamine());
        loanrRecord.setExamineContext(farmerprivInf.getExamineContext());
        loanrRecord.setExamineOperator(farmerprivInf.getExamineOperator());
        loanrRecordMapper.updateByPrimaryKeySelective(loanrRecord);
        jsonResult.setMsg("OK");
        return jsonResult;
    }
    @Transactional
    @Override
    public JsonResult updApprovalLoanInf(User user, FarmerprivInf farmerprivInf) {
        JsonResult jsonResult = new JsonResult();
        int  roleId = 0;
        Set<Role> roles = roleService.findRoleByUserId(user.getUserId());
        Iterator<Role> iterator = roles.iterator();
        if (iterator.hasNext()){
            Role role = iterator.next();
            roleId = role.getRoleId();
        }
        if (Float.parseFloat(farmerprivInf.getTotalCreditScore())<60&& roleId!=1){
            jsonResult.setMsg("当前农户评分小于60分需要管理员才能审批！");
            return jsonResult;
        }
        AssessorInf assessor = assessorService.findAssessorByUserId(user.getUserId());
        farmerprivInf.setExamineOperatorLoan(assessor.getAssName());
        farmerprivInfMapper.updApprovalLoanInf(farmerprivInf);
        LoanrRecord loanrRecord = loanrRecordMapper.findtopLoanrRecord();
        loanrRecord.setExamineLoan(farmerprivInf.getExamineLoan());
        loanrRecord.setExamineContextLoan(farmerprivInf.getExamineContextLoan());
        loanrRecord.setExamineOperatorLoan(farmerprivInf.getExamineOperatorLoan());
        loanrRecordMapper.updateByPrimaryKeySelective(loanrRecord);
        jsonResult.setMsg("OK");
        return jsonResult;
    }

    @Override
    public List<FarmerprivInf> findAllFarmerInftoMonth() {
        return farmerprivInfMapper.findAllFarmerInf();
    }

    /**
     *
     * @return 含总评分的农户信息。
     */
    @Override
    public List<FarmerprivInf> findFaremTotalScore() {
        return MathUtils.farmerprivInfList(farmerprivInfMapper.findFaremTotalScore());
    }

    /**
     * 个人信息里面添加 贷款金额。
     * 根据用户去添加
     * @param map
     * @return
     */
    @Override
    public int uploadMoney(Map map) {
        int i = farmerprivInfMapper.uploadMoney(map);
        return i;
    }

    @Override
    public FarmerprivInf findFByUserId(int userId) {
        FarmerprivInf farmerprivInf = null;
        try {
              farmerprivInf = farmerprivInfMapper.findFarmerinInfByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return farmerprivInf;
    }

//    @Override
//    public int findCreditByCsUserId(int userId) {
//
//        int totalCredit = findCreditByCsUserId(userId);
//        return totalCredit;
//    }
}
