<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/1
  Time: 下午9:16
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
        <h3 class="box-title">Bordered Table</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="tab-data"   class="table table-bordered table-hover">

        </table>
    </div>
    <!-- /.box-body -->
    <div class="box-footer clearfix">
        <ul id="totalPage" class="pagination pagination-sm no-margin pull-right">

        </ul>
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
            url:"notic/noticList",
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
                    $("#totalPage").html(list);
                    //***********处理下面的分页数据***********//
                    //***********处理数据***********//
                    var m = val.list;
                    var dataMsg = '';
                    dataMsg+='<tr>';
                        dataMsg+='<th width="15%">#编号</th>';
                        dataMsg+='<th width="60%">#公告</th>';
                        dataMsg+='<th width="15%">#操作</th>';
                    dataMsg+='</tr>';
                    for (j=0;j<m.length;j++){

                        dataMsg+='<tr>';
                            dataMsg+='<td>'+m[j].snId+'</td>';
                            dataMsg+='<td>'+m[j].snNotice+'</td>';
                        dataMsg+='<td>';
                            dataMsg+='<button type="button" onclick="delNotic('+m[j].snId+')" data-toggle="modal" data-target="#updEmpModal" class="btn btn-primary btn-default">删除</button>';
                        dataMsg+='</td>';
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
    function delNotic(id) {
        if(confirm("确认删除该")){
            $.ajax({
                url: "notic/delNotic",
                type: "post",
                data: {"snId":id},
                success: function (data) {
                    console.log(data)
                    if (data.msg == "OK") {
                        alert("删除成功！")
                        initData(pageNumber);
                    }
                }, error: function (data) {
                    console.log(data);
                }
            })
        }
    }
</script>
</body>
</html>
