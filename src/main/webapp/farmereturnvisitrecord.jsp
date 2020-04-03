<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/30
  Time: 下午7:19
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
    <title>农户回访记录</title>
    <style>
        #tab-context{
            width: 90%;
            height: auto;
            margin-top: 10px;
            background-color: white;
        }
    </style>
</head>
<body>
<div id="tab-context" class="container">
    <div class="box-header with-border">
        <h3 class="box-title">农户回访记录</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="tab-data" class="table table-bordered">

        </table>
    </div>
    <!-- /.box-body -->
    <div  class="box-footer clearfix">
        <ul id="totalPage1" class="pagination pagination-sm no-margin pull-right">

        </ul>
    </div>

    <!-- 评审模态框（Modal） -->
    <div class="modal fade" id="examineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        评审
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="examineForm">
                        <div class="form-group">
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
<%--                                <tr>--%>
<%--                                    <td>抚养比</td>--%>
<%--                                    <td><font id="tab-raise"></font></td>--%>
<%--                                </tr>--%>
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
                            <img src="static/upload/no.jpg" id="img1" width="92%" height="600" class="img-responsive">
                            <img src="static/upload/no.jpg" id="img2" width="92%" height="600" class="img-responsive">
                        </div>
                        <div class="form-group">
                            <input type="hidden" id="userId" value=""/>
                            <h3>审核意见</h3>
                            <textarea class="form-control" id="examineContext" rows="3"></textarea>
                            <label>
                                <input type="radio" name="examine"  value="1" >审核通过
                            </label>
                            <label>
                                <input type="radio" name="examine"  value="3" >审核不通过
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                    <button type="button" onclick="updExamine()"  class="btn btn-primary">
                        提交审核
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<script>
    var pageNumber = 0;
    var pageSize = 10;
    $(function(){
        initData(pageNumber);
    });
    function initData(pageNumber){
        $.ajax({
            url:"self/findAllFarmerInf",
            type:"post",
            data:{"pageNumber":pageNumber,"pageSize":pageSize},
            success:function(data){
                console.log(data)
                if (data.msg=="OK"){
                    var val = data.result;
                    //***********处理下面的分页数据***********//
                    var list = "";
                    if (val.hasPreviousPage){
                        list+='<li><a href="javascript:initData('+(pageNumber-1)+')">&laquo;</a></li>';
                    }else{
                        list+='<li class="page-item disabled"><a href="javascript:void(0)"  aria-disabled="true">&laquo;</a></li>';
                    }
                    for (var i = 0;i<val.pages;i++){
                        if (val.pageNum==(i+1)){
                            list+='<li><a href="javascript:initData('+(i+1)+')">'+(i+1)+'<span class="sr-only">(current)</span></a></li>';
                        }else{
                            list+='<li><a href="javascript:initData('+(i+1)+')">'+(i+1)+'</a></li>';
                        }
                    }
                    if (val.hasNextPage){
                        list+='<li><a href="javascript:initData('+(pageNumber+1)+')">&raquo;</a></li>';

                    }else{
                        list+='<li class="page-item disabled"><a href="javascript:void(0)"  aria-disabled="true">&raquo;</a></li>';
                    }
                    $("#totalPage1").html(list);
                    //***********处理下面的分页数据***********//
                    //***********处理数据***********//
                    var m = val.list;
                    var dataMsg = '';
                    var  roleNames ='';
                    dataMsg+='<tr>';
                    dataMsg+='<th width="15%">#编号</th>';
                    dataMsg+='<th width="15%">#农户名字</th>';
                    dataMsg+='<th width="30%">#审核意见</th>';
                    dataMsg+='<th width="30%">#审核人</th>';
                    dataMsg+='<th width="40%">#评审状态</th>';
                    dataMsg+='</tr>';
                    for (j=0;j<m.length;j++){
                        dataMsg+='<tr onclick="javascript:enterExamine('+m[j].userId+')">';
                            dataMsg+='<td>'+m[j].farpId+'</td>';
                            dataMsg+='<td>'+m[j].publicInf.farmerName+'</td>';
                            dataMsg+='<td>'+m[j].examineContext+'</td>';
                            dataMsg+='<td>'+m[j].examineOperator+'</td>';
                            if (m[j].examine==0){
                                dataMsg+='<td>未审核</td>';
                            }
                            if (m[j].examine==1){
                                dataMsg+='<td>审核通过</td>';
                            }
                            if (m[j].examine==2){
                                dataMsg+='<td>需重审</td>';
                            }
                            if (m[j].examine==3){
                                dataMsg+='<td>审核不通过</td>';
                            }
                        dataMsg+='</tr>';
                    }
                    $("#tab-data").html(dataMsg)
                    //***********处理数据***********//
                }
            },
            error:function(data){
                console.log(data);
            }
        })
    }
    function enterExamine(userId) {
        $("#userId").val(userId);

        // 被执行人
        $.ajax({
            url: "self/fandUnExamineFarmerPerson",
            type: "post",
            data: {"userId":userId},
            success: function (data) {
                if (data.msg = "OK") {
                    var m = data.result;
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

                }
                console.log(data);
            }, error: function (data) {
                console.log(data);
            }
        })


        $.ajax({
            url:"self/fandUnExamineBasicpictPerson",
            type:"post",
            data: {"userId":userId},
            success: function(data) {
                if (data.msg == "OK") {
                    var m =  data.result;
                    if (m!=null){
                        $("#img1").attr("src", m.fbpLoanUrl);
                        $("#img2").attr("src", m.fbpProductionUrl);
                    }
                } else {
                    console.log(data.msg);
                }
            },
            error:function(data) {
                console.log("查询失败")
            }
        });

        $("#examineModal").modal("show");
    }
    function updExamine() {
        $.ajax({
            url:"self/updateExamine",
            type:"post",
            data: {
                    "userId":$("#userId").val(),
                    "examineContext":$("#examineContext").val(),
                    "examine":$('input[name="examine"]:checked').val()
            },
            success: function(data) {
                if (data.msg == "OK") {
                    initData(pageNumber);
                    $("#examineModal").modal("hide");
                } else {
                    console.log(data.msg);
                }
            },
            error:function(data) {
                console.log("审核失败")
            }
        });
    }
</script>

</body>
</html>
