<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/28
  Time: 下午2:59
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
    <title>农户公开信息</title>
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
        <h3 class="box-title">农户公开信息</h3>
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
</div>
<script>
    var pageNumber = 0;
    var pageSize = 10;
    $(function(){
        initData(pageNumber);
    });
    function initData(pageNumber){
        $.ajax({
            url:"farmersInf/findFarmersInf",
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
                    dataMsg+='<th width="15%">#农户编号</th>';
                    dataMsg+='<th width="15%">#农户名字</th>';
                    dataMsg+='<th width="30%">#农户银行账号</th>';
                    dataMsg+='<th width="40%">#农户贷款信息</th>';
                    dataMsg+='</tr>';
                    for (j=0;j<m.length;j++){
                        dataMsg+='<tr>';
                            dataMsg+='<td>'+m[j].farmerId+'</td>';
                            dataMsg+='<td>'+m[j].farmerName+'</td>';
                            dataMsg+='<td>'+m[j].farmerCardId+'</td>';
                            dataMsg+='<td>'+m[j].farmerLoadInfo+'</td>';
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
</script>
</body>
</html>
