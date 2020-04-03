<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/2
  Time: 下午7:41
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
    #tab-context {
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
        <h3 class="box-title">农户评分报表</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="tab-data" class="table table-bordered">

        </table>
    </div>
    <!-- /.box-body -->
    <div class="box-footer clearfix">
        <ul id="totalPage1" class="pagination pagination-sm no-margin pull-right">

        </ul>
    </div>

    <!-- 增加模态框（Modal） -->
    <div class="modal fade" id="reportformmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        审核贷款
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="box" style="width: 600px;height: 600px;"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>

</div>
<script src="static/baidu/echarts.min.js"></script>
<script>
    //初始化ehcharts实例
    var myChart=echarts.init(document.getElementById("box"));
    var pageNumber = 0;
    var pageSize = 10;
    $(function () {
        initData(pageNumber);
    });

    function initData(pageNumber) {
        $.ajax({
            url: "monthLy/findAllFarmersInf",
            type: "post",
            data: {"pageNumber": pageNumber, "pageSize": pageSize},
            success: function (data) {
                console.log(data)
                if (data.msg == "OK") {
                    var val = data.result;
                    //***********处理下面的分页数据***********//
                    var list = "";
                    if (val.hasPreviousPage) {
                        list += '<li><a href="javascript:initData(' + (pageNumber - 1) + ')">&laquo;</a></li>';
                    } else {
                        list += '<li class="page-item disabled"><a href="javascript:void(0)"  aria-disabled="true">&laquo;</a></li>';
                    }
                    for (var i = 0; i < val.pages; i++) {
                        if (val.pageNum == (i + 1)) {
                            list += '<li><a href="javascript:initData(' + (i + 1) + ')">' + (i + 1) + '<span class="sr-only">(current)</span></a></li>';
                        } else {
                            list += '<li><a href="javascript:initData(' + (i + 1) + ')">' + (i + 1) + '</a></li>';
                        }
                    }
                    if (val.hasNextPage) {
                        list += '<li><a href="javascript:initData(' + (pageNumber + 1) + ')">&raquo;</a></li>';

                    } else {
                        list += '<li class="page-item disabled"><a href="javascript:void(0)"  aria-disabled="true">&raquo;</a></li>';
                    }
                    $("#totalPage1").html(list);
                    //***********处理下面的分页数据***********//
                    //***********处理数据***********//
                    var m = val.list;
                    var dataMsg = '';
                    dataMsg += '<tr>';
                    dataMsg += '<th width="5%">#编号</th>';
                    dataMsg += '<th width="15%">#农户名字</th>';
                    dataMsg += '<th width="20%">#操作</th>';
                    dataMsg += '</tr>';
                    for (j = 0; j < m.length; j++) {
                        dataMsg += '<tr>';
                            dataMsg += '<td>' + m[j].farmerId + '</td>';
                            dataMsg += '<td>' + m[j].farmerName + '</td>';
                            dataMsg += '<td><input type="button" value="查看信用月报表"  class="btn-default" onclick="finaReportform('+m[j].userId+')"/></td>';
                        dataMsg += '</tr>';
                    }
                    $("#tab-data").html(dataMsg);
                    //***********处理数据***********//
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }
    function finaReportform(userId) {
        $.ajax({
            url: "monthLy/findMonthlyScoreByUserId",
            type: "post",
            data: {"userId":userId},
            success: function (data) {
                if (data.msg=="OK"){
                  var  m =   data.result;
                  var td   = new Array();
                  var score= new Array();
                    debugger
                  for (i=0;i<m.length;i++){
                      td.push("'"+m[i].createTime+"'");
                      score.push(m[i].msofScore);

                  }
                    console.log(td)
                    console.log(score)
                var option={title:{text:'月评分统计'},toolbox:{show:true,feature:{saveAsImage:{show:true}}},legend:{data:['信用分']},xAxis:{data:td},yAxis:{},series:[{name:'销量',type:'line',data:score}]};
                    // var option={title:{text:'月评分统计'},toolbox:{show:true,feature:{saveAsImage:{show:true}}},legend:{data:['信用分']},xAxis:{data:["苹果","橘子","橙子","香蕉","菠萝","榴莲"]},yAxis:{},series:[{name:'销量',type:'line',data:[40,20,35,60,55,10]}]};
                //使用刚刚指定的配置项和数据项显示图表
                myChart.setOption(option);


                $("#reportformmodal").modal("show");
                console.log(data)
                }else{
                    alert("当前用户没有产生信用评分！")
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }

    function subApprovalLoan() {
        $.ajax({
            url: "loan/updApprovalLoanInf",
            type: "post",
            data:$("#approvalLoanForm").serialize(),
            success: function (data) {
                console.log(data)
                if (data.msg == "OK") {
                    initData(pageNumber);
                    $("#approvalloanModal").modal("hide");
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }
</script>

</body>
</html>
