<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/29
  Time: 下午7:33
  version:TODO
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <style>
        #tab-context, #tab-context-m {
            width: 90%;
            height: auto;
            margin-top: 10px;
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container" id="tab-context">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">农户个人信息</h3>
        </div>
    </div>
    <form id="priPersonForm">
        <div class="form-group">
            <h3>家庭基本情况</h3>
            <label for="farpAge">年龄</label>
            <input type="text" class="form-control" name="farpAge" id="farpAge" placeholder="年龄">
        </div>
        <div class="radio">
            <h4>政治面貌</h4>
            <label>
                <input type="radio" name="farpPoliticalInf" value="2">党员
            </label>
            <label>
                <input type="radio" name="farpPoliticalInf" checked="checked" value="1">非党员
            </label>
        </div>
        <div class="radio">
            <h4>婚姻状况</h4>
            <label>
                <input type="radio" name="farpMarriageInf" value="2">已婚
            </label>
            <label>
                <input type="radio" name="farpMarriageInf" checked="checked" value="1">未婚
            </label>
        </div>
        <div class="radio">
            <h4>文化程度</h4>
            <label>
                <input type="radio" name="farpCultureInf" value="0.5">文盲
            </label>
            <label>
                <input type="radio" name="farpCultureInf" value="1">小学
            </label>
            <label>
                <input type="radio" name="farpCultureInf" value="1.5">初中
            </label>
            <label>
                <input type="radio" name="farpCultureInf" value="2">高中
            </label>
            <label>
                <input type="radio" name="farpCultureInf" value="2.5">中专/职高
            </label>
            <label>
                <input type="radio" checked="checked" name="farpCultureInf" value="4">大专以上
            </label>
        </div>
        <div class="radio">
            <h4>健康状况</h4>
            <label>
                <input type="radio" name="farpHealthInf" checked="checked" value="5">健康,有劳动力
            </label>
            <label>
                <input type="radio" name="farpHealthInf" value="3">身体一般,劳动力下降
            </label>
            <label>
                <input type="radio" name="farpHealthInf" value="1">身有疾病,不能劳动
            </label>
        </div>
<%--        <div class="form-group">--%>
<%--            <label for="farpRaiseInf">抚养比</label>--%>
<%--            <input type="text" class="form-control" name="farpRaiseInf" id="farpRaiseInf" placeholder="抚养比">--%>
<%--        </div>--%>
        <div class="form-group">
            <h3>家庭资产情况</h3>
            <label for="farpFamilyIncome">家庭人均收入</label>
            <input type="text" class="form-control" name="farpFamilyIncome" id="farpFamilyIncome" placeholder="家庭人均收入">
        </div>
        <div class="radio">
            <h4>机动车辆</h4>
            <label>
                <input type="radio" name="farpVehicle" value="9">拥有
            </label>
            <label>
                <input type="radio" name="farpVehicle" checked="checked" value="5">不拥有
            </label>
        </div>
        <div class="form-group">
            <h3>农户借款情况</h3>
            <label for="farpLoanAmount">借款金额</label>
            <input type="text" class="form-control" name="farpLoanAmount" id="farpLoanAmount" placeholder="借款金额">
        </div>
        <div class="radio">
            <h4>使用用途</h4>
            <label>
                <input type="radio" name="farpUsage" checked="checked" value="6">生产用途
            </label>
            <label>
                <input type="radio" name="farpUsage" value="3">非生产用途
            </label>
        </div>
        <div class="radio">
            <h4>抵押担保</h4>
            <label>
                <input type="radio" name="farpMortgageGuarantee" value="8">有抵押担保
            </label>
            <label>
                <input type="radio" name="farpMortgageGuarantee" checked="checked" value="4">无抵押担保
            </label>
        </div>
        <div class="radio">
            <h3>生产经营情况</h3>
            <h4>自有资金出资比</h4>
            <label>
                <input type="radio" name="farpSelfFunded" value="7">70%以上
            </label>
            <label>
                <input type="radio" name="farpSelfFunded" value="5">50%-70%
            </label>
            <label>
                <input type="radio" name="farpSelfFunded" value="3">30%-50%
            </label>
            <label>
                <input type="radio" name="farpSelfFunded" checked="checked" value="2">30%一下
            </label>
        </div>
        <div class="radio">
            <h4>经营年限</h4>
            <label>
                <input type="radio" name="farpBusinessLife" checked="checked" value="2">一年以内
            </label>
            <label>
                <input type="radio" name="farpBusinessLife" value="3">1-3年
            </label>
            <label>
                <input type="radio" name="farpBusinessLife" value="4">3-5年
            </label>
            <label>
                <input type="radio" name="farpBusinessLife" value="5">5年以上
            </label>
        </div>
        <div class="radio">
            <h4>行业发展情况</h4>
            <label>
                <input type="radio" name="farpIndustryDevelopment" value="2">非常好
            </label>
            <label>
                <input type="radio" name="farpIndustryDevelopment" checked="checked" value="1.6">好
            </label>
            <label>
                <input type="radio" name="farpIndustryDevelopment" value="1.2">一般
            </label>
            <label>
                <input type="radio" name="farpIndustryDevelopment" value="0.8">不好
            </label>
            <label>
                <input type="radio" name="farpIndustryDevelopment" value="0.4">非常不好
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="button" id="btn_upd_save" value="保存" onclick="javascript:save()"
                       class="btn btn-primary"></input>
            </label>
        </div>
    </form>
</div>
<div class="container" id="tab-context-m">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">农户个人信息</h3>
            <input type="button" onclick="update()" style="float:right" VALUE="修改" class="btn btn-warning btn-xs">
        </div>

    </div>
    <table id="tbm" class="table table-bordered">
        <tr>
            <td>年龄</td>
            <td><font id="tab-age"></font></td>
        </tr>
        <tr>
            <td>政治面貌</td>
            <td><font id="tab-political"></font></td>
        </tr>
        <tr>
            <td>婚姻状况</td>
            <td><font id="tab-marriage"></font></td>
        </tr>
        <tr>
            <td>文化程度</td>
            <td><font id="tab-culture"></font></td>
        </tr>
        <tr>
            <td>健康状况</td>
            <td><font id="tab-health"></font></td>
        </tr>
<%--        <tr>--%>
<%--            <td>抚养比</td>--%>
<%--            <td><font id="tab-raise"></font></td>--%>
<%--        </tr>--%>
        <tr>
            <td>家庭人均收入</td>
            <td><font id="tab-family-income"></font></td>
        </tr>
        <tr>
            <td>机动车辆</td>
            <td><font id="tab-vehicle"></font></td>
        </tr>
        <tr>
            <td>借贷金额</td>
            <td><font id="tab-loan-amount"></font></td>
        </tr>
        <tr>
            <td>使用用途</td>
            <td><font id="tab-usage"></font></td>
        </tr>
        <tr>
            <td>抵押担保</td>
            <td><font id="tab-mortgage-guarantee"></font></td>
        </tr>
        <tr>
            <td>自有资金出资比</td>
            <td><font id="tab-self-funded"></font></td>
        </tr>
        <tr>
            <td>经营年限</td>
            <td><font id="tab-business-life"></font></td>
        </tr>
        <tr>
            <td>行业发展情况</td>
            <td><font id="tab-industry-development"></font></td>
        </tr>
    </table>
</div>
<script>
    $(function () {
        init();
    })
    function init(){
        $.ajax({
            url: "self/fandFarmerPerson",
            type: "post",
            data: $('#priPersonForm').serialize(),
            success: function (data) {
                if (data.msg = "OK") {
                    var m = data.result;
                    if (m!=null){
                        $("#tab-context-m").attr("style","display:block;");
                        $("#tab-context").attr("style","display:none;");

                    }else{
                        $("#tab-context-m").attr("style","display:none;");
                        $("#tab-context").attr("style","display:block;");
                    }
                    $("#tab-age").text(m.farpAge);
                    $("#tab-political").text(m.farpPoliticalInf);
                    $("#tab-marriage").text(m.farpMarriageInf);
                    $("#tab-culture").text(m.farpCultureInf);
                    $("#tab-health").text(m.farpHealthInf);
                    // $("#tab-raise").text(m.farpRaiseInf);
                    $("#tab-family-income").text(m.farpFamilyIncome);
                    $("#tab-vehicle").text(m.farpVehicle);
                    $("#tab-loan-amount").text(m.farpLoanAmount);
                    $("#tab-usage").text(m.farpUsage);
                    $("#tab-mortgage-guarantee").text(m.farpMortgageGuarantee);
                    $("#tab-self-funded").text(m.farpSelfFunded);
                    $("#tab-business-life").text(m.farpBusinessLife);
                    $("#tab-industry-development").text(m.farpIndustryDevelopment);
                    // alert("保存成功");
                    // $("#priPersonForm").reset();
                }
                console.log(data);
            }, error: function (data) {
                console.log(data);
            }
        })
    }
    function save() {
        var age = $("#farpAge").val();
        // var raise = $("#farpRaiseInf").val();
        var familyIncome = $("#farpFamilyIncome").val();
        var loanAmount = $("#farpLoanAmount").val();
        debugger
        if(!/^(?:[1-9][0-9]?|1[01][0-9]|120)$/g.test(age)){
            alert("你输入的年龄不合法!")
            return;
        }
        // if(raise.length<1 || parseFloat(raise)<0){
        //     alert("抚养比不能为空!且不能为负数")
        //     return;
        // }
        if (familyIncome.length<1 || parseFloat(familyIncome)<0){
            alert("家庭人均收入不能为空!且不能为负数")
            return;
        }
        if (loanAmount.length<1 || parseFloat(loanAmount)<0){
            alert("借款金额不能为空!且不能为负数")
            return;
        }

        $.ajax({
            url: "self/saveFarmerPerson",
            type: "post",
            data: $('#priPersonForm').serialize(),
            success: function (data) {
                if (data.msg = "OK") {
                    alert("保存成功");
                    init();
                }
                console.log(data);
            },
            error: function (data) {
                console.log(data);
            }
        })
    }
    function update(){
        $("#tab-context-m").attr("style","display:none;");
        $("#tab-context").attr("style","display:block;");
    }

</script>
</body>
</html>
