package com.yangml.utils;

import com.yangml.pojo.FarmerprivInf;

import java.util.ArrayList;
import java.util.List;

public class MathUtils {
    public static   boolean isShowNots = true;
    private static final float XMAX = 90000;
    private static final float XMIN = 3000;

    /**
     * //(XI-XMAX)/(XMIN-XMAX)*2 年龄
     * //(XI-XMAX)/(XMIN-XMAX)*6 抚养比
     * //(XI-XMAX)/(XMIN-XMAX)*34 家庭人均收入
     * //(XI-XMAX)/(XMIN-XMAX)*4 借贷金额
     */
    public static float getMathVal(float xi, float weight) {
        return (xi-XMIN)/(XMAX-XMIN) * weight;
    }

    /**
     * 得到总评分
     * @param infList
     * @return
     */
    public static List<FarmerprivInf> farmerprivInfList(List<FarmerprivInf> infList) {
        List<FarmerprivInf> m = new ArrayList<>();
        for (int i = 0; i < infList.size(); i++) {
            FarmerprivInf farmerprivInf = infList.get(i);
            m.add(farmerprivInfCose(farmerprivInf));
        }
        return m;
    }
    public static  FarmerprivInf farmerprivInfCose(FarmerprivInf farmerprivInf){
        float f = 0;

        f = 1.64f/*getMathVal(farmerprivInf.getFarpLoanAmount(), 4)*/
                + getMathVal(farmerprivInf.getFarpFamilyIncome(), 36)
                + 3.54f/*getMathVal(farmerprivInf.getFarpRaiseInf(), 6)*/
                + 1.43f/*getMathVal(farmerprivInf.getFarpAge(), 2)*/
                + farmerprivInf.getFarpBusinessLife()
                + farmerprivInf.getFarpCultureInf()
                + farmerprivInf.getFarpHealthInf()
                + farmerprivInf.getFarpIndustryDevelopment()
                + farmerprivInf.getFarpMarriageInf()
                + farmerprivInf.getFarpMortgageGuarantee()
                + farmerprivInf.getFarpPoliticalInf()
                + farmerprivInf.getFarpSelfFunded()
                + farmerprivInf.getFarpUsage()
                + farmerprivInf.getFarpVehicle()
                + Float.parseFloat(farmerprivInf.getTotalCreditScore());
        farmerprivInf.setTotalCreditScore(f+"");
        return farmerprivInf;
    }
}
