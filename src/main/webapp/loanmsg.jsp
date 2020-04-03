<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/31
  Time: 下午5:13
  version:TODO
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h3 class="box-title">放款审批管理</h3>
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
    <div class="modal fade" id="approvalloanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        审核贷款
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="approvalLoanForm">
                        <div class="form-group">
                            <input type="hidden" id="farpId" name="farpId" />
                            <font id="farmerName"></font>
                        </div>
                        <div class="form-group">
                            <label for="loan">借款金额</label>
                            <font id="loan"></font>
                        </div>
                        <div class="form-group">
                            <label for="totalCreditScore">总评分</label>
                            <input type="text" readonly="readonly" id="totalCreditScore" name="totalCreditScore" value="">
                        </div>
                        <div class="form-group">
                            <label>
                                审批通过
                                <input type="radio" value="1" name="examineLoan" >
                            </label>
                            <label>
                                审批不通过
                                <input type="radio" value="3" name="examineLoan" >
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="examineContextLoan">审批意见</label><!--farmerPublicInf.farmerName-->
                            <textarea class="form-control" id="examineContextLoan" name="examineContextLoan" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="subApprovalLoan()" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>

<script>
    var pageNumber = 0;
    var pageSize = 10;
    $(function () {
        initData(pageNumber);
    });

    function initData(pageNumber) {
        $.ajax({
            url: "loan/findAllLoanFarmer",
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
                    dataMsg += '<th width="20%">#借贷金额</th>';
                    dataMsg += '<th width="10%">#信用得分</th>';
                    dataMsg += '<th width="10%">#审核</th>';
                    dataMsg += '<th width="25%">#审核意见</th>';
                    dataMsg += '<th width="20%">#审核放款人</th>';
                    dataMsg += '</tr>';
                    for (j = 0; j < m.length; j++) {
                        dataMsg += '<tr onclick="javascript:approvalLoan('+m[j].farpId+')">';
                            dataMsg += '<td>' + m[j].farpId + '</td>';
                            dataMsg += '<td>' + m[j].publicInf.farmerName + '</td>';
                            dataMsg += '<td>' + m[j].farpLoanAmount + '￥</td>';
                            dataMsg += '<td>' + m[j].totalCreditScore + '</td>';
                            if (m[j].examineLoan==0){
                                dataMsg += '<td>未审核</td>';
                            }
                            if (m[j].examineLoan==1){
                                dataMsg += '<td>审核通过</td>';
                            }
                            if (m[j].examineLoan==3){
                                dataMsg += '<td>审核不通过</td>';
                            }
                            dataMsg += '<td>' + m[j].examineContextLoan + '</td>';
                            dataMsg += '<td>' + m[j].examineOperatorLoan + '</td>';
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
    function approvalLoan(farpId) {
        $.ajax({
            url: "loan/findApprovalLoanInfByFarpId",
            type: "post",
            data: {"farpId":farpId},
            success: function (data) {
                console.log(data)
                if (data.msg == "OK") {
                    var m = data.result;
                    $("#farmerName").text(m.publicInf.farmerName);
                    $("#loan").text(m.farpLoanAmount+"￥");
                    $("#farpId").val(m.farpId);
                    $("#totalCreditScore").val(m.totalCreditScore);
                    if (m.examineLoan==1){
                        $("input:radio[name='marriageStatus'][value='1']").attr('checked','true');
                    }
                    if (m.examineLoan==3){
                        $("input:radio[name='marriageStatus'][value='3']").attr('checked','true');
                    }
                    $("#examineContextLoan").val(m.examineContextLoan);
                    $("#approvalloanModal").modal("show");
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
