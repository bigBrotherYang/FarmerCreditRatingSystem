<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/3
  Time: 下午2:53
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
    <title>个人贷款记录</title>
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
        <h3 class="box-title">个人贷款记录</h3>
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
            url:"loanrrecord/findAllLoanrRecord",
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
                    dataMsg+='<tr>';
                    dataMsg+='<th width="5%">#编号</th>';
                    dataMsg+='<th width="10%">#姓名</th>';
                    dataMsg+='<th width="10%">#贷款金额</th>';
                    dataMsg+='<th width="10%">#资料评审</th>';
                    dataMsg+='<th width="15%">#资料评审内容</th>';
                    dataMsg+='<th width="15%">#资料评审人</th>';
                    dataMsg+='<th width="10%">#放款评审</th>';
                    dataMsg+='<th width="15%">#放款评审内容</th>';
                    dataMsg+='<th width="20%">#放款评审人</th>';
                    dataMsg+='</tr>';
                    for (j=0;j<m.length;j++){
                        dataMsg+='<tr>';
                            dataMsg+='<td>'+m[j].lrId+'</td>';
                            dataMsg+='<td>'+m[j].publicInf.farmerName+'</td>';
                            dataMsg+='<td>'+m[j].lrMoney+'</td>';

                            if(m[j].examine==1){
                                dataMsg+='<td>审核通过</td>';
                            }
                            if(m[j].examine==0){
                                dataMsg+='<td>未审核</td>';
                            }
                            if(m[j].examine==2){
                                dataMsg+='<td>待审核</td>';
                            }
                            dataMsg+='<td>'+m[j].examineContext+'</td>';
                            dataMsg+='<td>'+m[j].examineOperator+'</td>';
                            if(m[j].examineLoan==1){
                                dataMsg+='<td>审核通过</td>';
                            }
                            if(m[j].examineLoan==3){
                                dataMsg+='<td>审核不通过</td>';
                            }
                            if(m[j].examineLoan==0){
                                dataMsg+='<td>未审核</td>';
                            }
                            dataMsg+='<td>'+m[j].examineContextLoan+'</td>';
                            dataMsg+='<td>'+m[j].examineOperatorLoan+'</td>';
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
