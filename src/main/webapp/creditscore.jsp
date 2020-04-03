<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/31
  Time: 下午12:18
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
        <h3 class="box-title">信用评分</h3>
        <button type="button" style="float:right;margin-right: 20px" data-toggle="modal" data-target="#addCreditScore"
                class="btn btn-default">增加
        </button>
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
    <div class="modal fade" id="addCreditScore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        增加农户评分
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="addCreditScoreForm">
                        <div class="form-group">
                            <label>请选择农户
                                <select name="userId" id="farmerInf">
                                </select>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="csContext">诚信行为内容</label><!--farmerPublicInf.farmerName-->
                            <textarea class="form-control" id="csContext" name="csContext" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="csScore">诚信行为得分
                                <select name="csScore" id="csScore">
                                    <option value="0" selected="selected">0</option>
                                    <option value="-2">-2</option>
                                    <option value="-8">-8</option>
                                    <option value="-12">-12</option>
                                </select>
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="addCreditScore()" class="btn btn-primary">
                        提交评分
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <!-- 修改模态框（Modal） -->
    <div class="modal fade" id="updCreditScore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        修改农户评分
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="updCreditScoreForm">
                        <div class="form-group">
                            <label>
                                <h4>
                                    <span id="farmerName"></span>
                                    <input id="csId" name="csId" type="hidden">
                                </h4>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="csContext">诚信行为内容</label><!--farmerPublicInf.farmerName-->
                            <textarea class="form-control" id="csContextUpd" name="csContext" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="csScore">诚信行为得分
                                <select name="csScore" id="csScoreUpd">
                                    <option value="0" selected="selected">0</option>
                                    <option value="-2">-2</option>
                                    <option value="-8">-8</option>
                                    <option value="-12">-12</option>
                                </select>
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="updCreditScore()" class="btn btn-primary">
                        提交评分
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
        findAllfarmerInf();
    });

    function initData(pageNumber) {
        $.ajax({
            url: "credit/findAllCreditScore",
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
                    dataMsg += '<th width="15%">#编号</th>';
                    dataMsg += '<th width="15%">#农户名字</th>';
                    dataMsg += '<th width="30%">#信用行为内容</th>';
                    dataMsg += '<th width="10%">#信用得分</th>';
                    dataMsg += '<th width="15%">#录入人</th>';
                    dataMsg += '<th width="15%">#操作</th>';
                    dataMsg += '</tr>';
                    for (j = 0; j < m.length; j++) {
                        dataMsg += '<tr>';
                        dataMsg += '<td>' + m[j].csId + '</td>';
                        dataMsg += '<td>' + m[j].publicInf.farmerName + '</td>';
                        dataMsg += '<td>' + m[j].csContext + '</td>';
                        dataMsg += '<td>' + m[j].csScore + '</td>';
                        dataMsg += '<td>' + m[j].csOperator + '</td>';
                        dataMsg += '<td>';
                        dataMsg += '<button type="button" onclick="enterUpdateDate(' + m[j].csId + ')" data-toggle="modal" data-target="#updEmpModal" class="btn btn-primary btn-default">修改</button>';
                        dataMsg += '<button type="button" onclick="delCreditScore(' + m[j].csId + ',' + "'" + m[j].publicInf.farmerName + "'" + ')" style="margin-right: 2px; margin-left: 2px" class="btn btn-warning btn-default">删除</button>';
                        dataMsg += '</td>';
                        dataMsg += '</tr>';
                    }
                    $("#tab-data").html(dataMsg)
                    //***********处理数据***********//
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }

    function findAllfarmerInf() {
        $.ajax({
            url: "credit/findAllPublicfarmerInf",
            type: "post",
            success: function (data) {
                if (data.msg == "OK") {
                    var m = data.result;
                    var dataMsg = '';
                    dataMsg += '<option>-------请选着农户-------</option>';
                    for (var i = 0; i < m.length; i++) {
                        dataMsg += '<option value="' + m[i].userId + '">' + m[i].farmerName + '</option>';
                    }
                    console.log(dataMsg)
                    $("#farmerInf").html(dataMsg);
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }

    function addCreditScore() {
        $.ajax({
            url: "credit/addCreditScore",
            type: "post",
            data: $("#addCreditScoreForm").serialize(),
            success: function (data) {
                if (data.msg == "OK") {
                    initData(pageNumber);
                    $("#addCreditScore").modal("hide");
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }

    function delCreditScore(csId, farmerName) {
        if (confirm("确认删除该[" + farmerName + "]用户的评分")) {
            //点击确定后操作
            $.ajax({
                url: "credit/delCreditScoreBycsId",
                type: "post",
                data: {"csId": csId},
                success: function (data) {
                    if (data.msg == "OK") {
                        initData(pageNumber);
                    } else {
                        alert("删除失败!请联系管理员");
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            })
        }
    }

    function enterUpdateDate(csId) {
        $("#csId").val(csId);
        $("#updCreditScore").modal("show");
        $.ajax({
            url: "credit/findCreditByCsId",
            type: "post",
            data: {"csId": csId},
            success: function (data) {
                if (data.msg == "OK") {
                    var m = data.result;
                    $("#farmerName").text(m.publicInf.farmerName);
                    $("#csContextUpd").text(m.csContext);
                    var count = $("#csScoreUpd option").length;
                    for (var i = 0; i < count; i++) {
                        var s = $("#csScoreUpd").get(0).options[i].text;
                        if ($("#csScoreUpd").get(0).options[i].text == m.csScore) {
                            $("#csScoreUpd ").get(0).options[i].selected = true;
                            break;
                        }
                    }
                } else {
                    alert("查询信息失败");
                }
            },
            error: function (data) {
                console.log(data);
            }
        })
    }

    function updCreditScore() {
        $.ajax({
            url: "credit/updCreditScore",
            type: "post",
            data: $("#updCreditScoreForm").serialize(),
            success: function (data) {
                if (data.msg == "OK") {
                    initData(pageNumber);
                    $("#updCreditScore").modal("hide");
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }
</script>
</body>
</html>
