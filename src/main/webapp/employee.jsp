<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/27
  Time: 下午2:58
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
    <title>员工管理</title>
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
            <h3 class="box-title">Bordered Table</h3>
            <button type="button" style="float:right;margin-right: 20px" data-toggle="modal" data-target="#addEmpModal" class="btn btn-default">增加</button>
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

    <!-- 增加模态框（Modal） -->
    <div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        增加员工
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="addForm">
                        <div class="form-group">
                            <label for="userName">账号</label>
                            <input type="text" class="form-control" name="userName" id="userName" placeholder="账号">
                        </div>
                        <DIV class="far">
                            <div class="form-group" id="far1">
                                <label for="farmerName">真实姓名</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="farmerPublicInf.farmerName" id="farmerName" placeholder="真实姓名">
                            </div>
                            <div class="form-group" id="far2">
                                <label for="farmerCardId">卡号</label><!--farmerPublicInf.farmerCardId-->
                                <input type="text" class="form-control" name="farmerPublicInf.farmerCardId" id="farmerCardId" placeholder="卡号">
                            </div>
                        </DIV>
                        <div class="ass">
                            <div class="form-group">
                                <label for="assName">职工姓名</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="assessorInf.assName" id="assName" placeholder="职工姓名">
                            </div>
                            <div class="form-group" >
                                <label for="farmerName">工号</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="assessorInf.assJobNumber" id="assJobNumber" placeholder="职工工号">
                            </div>
                            <div class="form-group">
                                <label for="assJob">职务</label><!--farmerPublicInf.farmerCardId-->
                                <input type="text" class="form-control" name="assessorInf.assJob" id="assJob" placeholder="职务">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userPwd">员工密码</label>
                            <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="pwd2">确认密码</label>
                            <input type="password" class="form-control" id="pwd2" placeholder="确认密码">
                        </div>
                        <div id="roleCheckBok" class="checkbox">

                        </div>
                        <div class="checkbox">
                            <label>
                                <input value="1" name="allowLogin" type="checkbox"> 是否允许登入
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="addEmployee()"  class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <!-- 修改模态框（Modal） -->
    <div class="modal fade" id="updEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        修改员工
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="updForm">
                        <div class="form-group">
                            <input type="hidden"  id="userId" name="userId" value="">
                            <label for="userName">账号</label>
                            <input type="text" value="1"  class="form-control" name="userName" id="userNameUpd" placeholder="账号">
                        </div>
                        <div class="far">
                            <div class="form-group" >
                                <label for="farmerNameUpd">真实姓名</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="farmerPublicInf.farmerName" id="farmerNameUpd" placeholder="真实姓名">
                            </div>
                            <div class="form-group" >
                                <label for="farmerCardIdUpd">卡号</label><!--farmerPublicInf.farmerCardId-->
                                <input type="text" class="form-control" name="farmerPublicInf.farmerCardId" id="farmerCardIdUpd" placeholder="卡号">
                            </div>
                        </div>
                        <div class="ass">
                            <div class="form-group" >
                                <label for="assNameUpd">职工姓名</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="assessorInf.assName" id="assNameUpd" placeholder="职工姓名">
                            </div>
                            <div class="form-group" >
                                <label for="assJobNumberUpd">工号</label><!--farmerPublicInf.farmerName-->
                                <input type="text" class="form-control" name="assessorInf.assJobNumber" id="assJobNumberUpd" placeholder="职工工号">
                            </div>
                            <div class="form-group" >
                                <label for="assJobUpd">职务</label><!--farmerPublicInf.farmerCardId-->
                                <input type="text" class="form-control" name="assessorInf.assJob" id="assJobUpd" placeholder="职务">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userPwdUpd">员工密码</label>
                            <input type="password" class="form-control" name="userPwd" id="userPwdUpd" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="pwd2Upd">确认密码</label>
                            <input type="password" class="form-control" id="pwd2Upd" placeholder="确认密码">
                        </div>
                        <div id="roleCheckBokUpd" class="checkbox">

                        </div>
                        <div class="checkbox">
                            <label>
                                <input value="1" name="allowLogin" type="checkbox"> 是否允许登入
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="entrenUPd()"  data-dismiss="modal" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <script>
        var pageNumber = 0;
        var pageSize = 10;
        $(function(){
            initData(pageNumber);
            initRole();
        });
        function initData(pageNumber){
            $.ajax({
                url:"user/findAllUser",
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
                        var  roleNames ='';
                        dataMsg+='<tr>';
                            dataMsg+='<th width="15%">#员工编号</th>';
                            dataMsg+='<th width="15%">#员工姓名</th>';
                            dataMsg+='<th width="40%">#员工角色</th>';
                            dataMsg+='<th width="30%">#操作</th>';
                        dataMsg+='</tr>';
                        for (j=0;j<m.length;j++){
                            roleNames='';//清空原有数据
                            for (x=0;x<m[j].roleList.length;x++){
                                roleNames += m[j].roleList[x].roleName+',';
                            }
                            roleNames = roleNames.substr(0,roleNames.length-1);
                            dataMsg+='<tr>';
                                dataMsg+='<td>'+m[j].userId+'</td>';
                                    dataMsg+='<td>'+m[j].userName+'</td>';
                                    dataMsg+='<td>'+roleNames+'</td>';
                                dataMsg+='<td>';
                                    dataMsg+='<button type="button" onclick="updEmp('+m[j].userId+')" data-toggle="modal" data-target="#updEmpModal" class="btn btn-primary btn-default">修改</button>';
                                    dataMsg+='<button type="button" onclick="delUser('+m[j].userId+','+"'"+m[j].userName+"'"+')" style="margin-right: 2px; margin-left: 2px" class="btn btn-warning btn-default">删除</button>';
                                    if (m[j].allowLogin!=1){
                                        dataMsg+='<button type="button" onclick="allowLogin(1,'+"'"+m[j].userName+"'"+','+m[j].userId+')" class="btn btn-primary btn-default">启用</button>';
                                    }else{
                                        dataMsg+='<button type="button" onclick="allowLogin(0,'+"'"+m[j].userName+"'"+','+m[j].userId+')" class="btn btn-danger btn-default">禁用</button>';
                                    }
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

        function initRole(){
            $.ajax({
                url:"role/findAllRoles",
                type:"post",
                success:function(data){
                    if (data.msg=="OK") {
                        var val = data.result;
                        var d = '';
                        for (i=0;i<val.length;i++){
                              d+='<label>';
                                d+='<input value="'+val[i].roleId+'"  onclick="javascript:isShowTab('+val[i].roleId+')" name="roles" type="radio">'+val[i].roleName;
                              d+='</label>';
                        }
                        $("#roleCheckBok").html(d);
                        $("#roleCheckBokUpd").html(d);
                    }
                },
                error:function(data){
                    console.log(data);
                }
            })
        }
        function addEmployee(){

           var userName =$("#userName").val();
           var userPwd =$("#userPwd").val();
           var farmerName = $("#farmerName").val();
           var farmerCardId = $("#farmerCardId").val();
            var val=$('input:radio[name="roles"]:checked').val();
            if (val==null){
                alert("请选择一个角色，填相应的表格")
                return;
            }

           var pwd2 =$("#pwd2").val();
            if(!/^[a-zA-Z0-9]{6,10}$/g.test(userName)){
               alert("账户名只能是数字和字母且长度6~10");
                return;
            }
            if(val==3&&farmerCardId.length<1) {
                alert("请输入正确的银行卡号")
                return;
            }
            if (val==3&&farmerName.length<1){
                alert("真实姓名不能为空");
                return;
            }
            if(!/^[a-zA-Z0-9]{6,10}$/g.test(userPwd)){
                alert("密码只能是数字和字母且长度6~10");
                return;
            }

            if(userPwd!=pwd2){
                alert("两次密码不一致");
                return;
            }
            $.ajax({
                url:"user/registerUser",
                type:"post",
                data:$('#addForm').serialize(),
                success:function(data){
                    console.log(data);
                    if(data.msg=="OK") {
                        initData(pageNumber);

                    }else{
                        alert("注册失败!请联系管理员");
                    }
                    $('#addEmpModal').modal('hide');
                    $('#addEmpModal').on('hidden.bs.modal', function (){
                        document.getElementById("addForm").reset();
                    });

                },
                error:function(data){
                    console.log(data);
                }
            })
        }
        function delUser(userId,userName){
            if(confirm("确认删除该["+userName+"]用户")){
                //点击确定后操作
                $.ajax({
                    url:"user/delUser",
                    type:"post",
                    data:{"userId":userId},
                    success:function(data){
                        console.log(data);
                        if(data.msg=="OK") {
                            initData(pageNumber);
                        }else{
                            alert("删除失败!请联系管理员");
                        }
                    },
                    error:function(data){
                        console.log(data);
                    }
            })
            }
        }

        function updEmp(userId){
            $("#userId").val(userId);
            $("#userNameUpd").val('');
            $("#userPwdUpd").val('');
            $("#pwd2Upd").val('');
            $("#farmerNameUpd").val('');
            $("#farmerCardIdUpd").val('');
            $("#assNameUpd").val('');
            $("#assJobNumberUpd").val('');
            $("#assJobUpd").val('');
            $("input[name='allowLogin']").attr('checked',false);
            $.ajax({
                url:"role/findRoleByUserId",
                type:"post",
                data:{"userId":userId},
                success:function(data){
                    console.log(data);
                    var m = data.result;
                    if(data.msg=="OK") {
                        for ( i = 0;i<m.length;i++){
                            $('input[name="roles"]').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数
                                if(m[i].roleId == $(this).val()){
                                    $(this).attr('checked',true)
                                    isShowTab(m[i].roleId)
                                }
                            });
                        }
                    }else{
                        alert("获取当前要更改的角色失败！")
                        return;
                    }

                },
                error:function(data){
                    console.log(data);
                }
            })

            $.ajax({
                url:"user/findUserById",
                type:"post",
                data:{"userId":userId},
                success:function(data){
                    console.log(data);
                    if(data.msg=="OK") {
                       var m = data.result;
                        $("#userNameUpd").val(m.userName);
                        $("#userPwdUpd").val(m.userPwd);
                        $('#userId').val(m.userId);
                        if (m.allowLogin==1){
                            $("input[name='allowLogin']").attr('checked',true);
                        }
                        if(m.assessorInf!=null){
                            $("#assNameUpd").val(m.assessorInf.assName)
                            $("#assJobUpd").val(m.assessorInf.assJob)
                            $("#assJobNumberUpd").val(m.assessorInf.assJobNumber);
                        }
                        if(m.farmerPublicInf){
                            $("#farmerNameUpd").val(m.farmerPublicInf.farmerName);
                            $("#farmerCardIdUpd").val(m.farmerPublicInf.farmerCardId);
                        }

                    }else{
                        alert("获取当前用户数据失败！");
                       return;
                    }
                },
                error:function(data){
                    console.log(data);
                }
            })
        }

        function entrenUPd(){
            var userName =$("#userNameUpd").val();
            var userPwd =$("#userPwdUpd").val();
            var pwd2 =$("#pwd2Upd").val();
            if(!/^[a-zA-Z0-9]{6,10}$/g.test(userName)){
                alert("账户名只能是数字和字母且长度6~10");
                return;
            }
            if(!/^[a-zA-Z0-9]{6,10}$/g.test(userPwd)){
                alert("密码只能是数字和字母且长度6~10");
                return;
            }

            //$("input[name='allowLogin']").attr('checked',false);
            // $('input[name="roles"]').each(function(){
            //     $(this).attr('checked',false)
            // });
            if(userPwd!=pwd2){
                alert("两次密码不一致");
                return;
            }
            $.ajax({
                url:"user/updUser",
                type:"post",
                data:$('#updForm').serialize(),
                success:function(data){
                    console.log(data);
                    if(data.msg=="OK") {
                        initData(pageNumber);

                    }else{
                        alert("更改失败!请联系管理员");
                    }
                    $('#updEmpModal').modal('hide');
                    $('#updEmpModal').on('hidden.bs.modal', function (){
                        document.getElementById("updForm").reset();
                    });
                },
                error:function(data){
                    console.log(data);
                }
            })
        }
        function allowLogin(isEnable,userName,userId){
            if(isEnable==0&&!confirm("确认禁用该["+userName+"]用户")) {
                return;
            }
                $.ajax({
                    url: "user/allowLogin",
                    type: "post",
                    data: {"allowLogin": isEnable, "userId": userId},
                    success: function (data) {
                        console.log(data);
                        if (data.msg == "OK") {
                            initData(pageNumber);
                        } else {
                            alert("更改失败!请联系管理员");
                        }
                    },
                    error: function (data) {
                        console.log(data);
                    }
                })

        }
        function isShowTab(roleId){
            if(roleId==3){
                $("#farmerNameUpd").val('');
                $("#farmerCardIdUpd").val('');
                $(".ass").attr("style","display:none;");
                $(".far").attr("style","display:block;");
            }else{
                $("#assNameUpd").val('');
                $("#assJobNumberUpd").val('');
                $("#assJobUpd").val('');
                $(".far").attr("style","display:none;");
                $(".ass").attr("style","display:block;");

            }
        }


    </script>

</body>
</html>
