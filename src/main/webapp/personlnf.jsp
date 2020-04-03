<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/29
  Time: 下午1:37
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
    <title>查看个人信息</title>
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
<div class="container" id="tab-context">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">个人信息</h3>
        </div>
    </div>
    <form id="updPersonForm">
        <div class="form-group">
            <input type="hidden" id="userId" name="userId" value="">
            <input value=""   name="roles" id="roles" type="hidden">
            <label for="userName">员工账号</label>
            <input type="text" class="form-control" readonly="readonly" name="userName" id="userName" placeholder="员工姓名">
        </div>
        <DIV class="far">
            <div class="form-group" id="far1">
                <label for="farmerName">真实姓名</label><!--farmerPublicInf.farmerName-->
                <input type="text" class="form-control" readonly="readonly"  name="farmerPublicInf.farmerName" id="farmerName"
                       placeholder="真实姓名">
            </div>
            <div class="form-group" id="far2">
                <label for="farmerCardId">卡号</label><!--farmerPublicInf.farmerCardId-->
                <input type="text" class="form-control" readonly="readonly"  name="farmerPublicInf.farmerCardId" id="farmerCardId"
                       placeholder="卡号">
            </div>
        </DIV>
        <div class="ass">
            <div class="form-group">
                <label for="assName">职工姓名</label><!--farmerPublicInf.farmerName-->
                <input type="text" class="form-control" readonly="readonly"  name="assessorInf.assName" id="assName" placeholder="职工姓名">
            </div>
            <div class="form-group">
                <label for="farmerName">工号</label><!--farmerPublicInf.farmerName-->
                <input type="text" class="form-control" readonly="readonly"  name="assessorInf.assJobNumber" id="assJobNumber"
                       placeholder="职工工号">
            </div>
            <div class="form-group">
                <label for="assJob">职务</label><!--farmerPublicInf.farmerCardId-->
                <input type="text" class="form-control" readonly="readonly"  name="assessorInf.assJob" id="assJob" placeholder="职务">
            </div>
        </div>
        <div class="form-group">
            <label for="userPwd">员工密码</label>
            <input type="password" class="form-control" readonly="readonly"  name="userPwd" id="userPwd" placeholder="密码">
        </div>
        <div class="form-group">
            <label for="pwd2">确认密码</label>
            <input type="password" class="form-control" readonly="readonly"  id="pwd2" placeholder="确认密码">
        </div>
        <div class="checkbox">
            <label>
                <input type="button" id="btn_upd_save" value="修改"   onclick="javascript:updPersonInf()" class="btn btn-primary"></input>
            </label>
        </div>
    </form>
</div>


<script>
var roleId =0;
    $(function () {
        initData();
    });


    function updPersonInf() {
        if ($("#btn_upd_save").val() == '修改') {
            $('#userName').removeAttr("readonly");
            $('#farmerName').removeAttr("readonly");
            $('#farmerCardId').removeAttr("readonly");
            $('#assName').removeAttr("readonly");
            $('#assJobNumber').removeAttr("readonly");
            $('#assJob').removeAttr("readonly");
            $('#pwd2').removeAttr("readonly");
            $('#userPwd').removeAttr("readonly");
            $("#btn_upd_save").val('保存');
        }else{
            var userName =$("#userName").val();
            var userPwd = $("#userPwd").val();
            var pwd2 = $("#pwd2").val();
            if(!/^[a-zA-Z0-9]{6,10}$/g.test(userName)){
                alert("账户名只能是数字和字母且长度6~10");
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
            if(roleId==3){
                if($('#farmerName').val().length<0){
                    alert("真实姓名不能为空");
                    return;
                }
                if($('#farmerCardId').val().length<0){
                    alert("银行卡不能为空");
                    return;
                }
            }else{
                if($('#assName').val().length<0){
                    alert("职工姓名不能为空");
                    return;
                }
                if($('#assJobNumber').val().length<0){
                    alert("职工编号不能为空");
                    return;
                }
                if($('#assJob').val().length<0){
                    alert("职位不能为空");
                    return;
                }
            }

            $.ajax({
                url:"user/updUser",
                type:"post",
                data:$('#updPersonForm').serialize(),
                success:function(data){
                    console.log(data);
                    if(data.msg=="OK") {
                        initData( );
                        $('#userName').attr("readonly","readonly");
                        $('#farmerName').attr("readonly","readonly");
                        $('#farmerCardId').attr("readonly","readonly");
                        $('#assName').attr("readonly","readonly");
                        $('#assJobNumber').attr("readonly","readonly");
                        $('#assJob').attr("readonly","readonly");
                        $('#pwd2').attr("readonly","readonly");
                        $('#userPwd').attr("readonly","readonly");
                        initData();
                        $("#btn_upd_save").val('修改');
                    }else{
                        alert("更改失败!请联系管理员");
                    }
                },
                error:function(data){
                    console.log(data);
                }
            })



        }
    }

    function initData() {
        $.ajax({
            url: "user/findUserById",
            type: "post",
            data: {"userId": -1},
            success: function (data) {
                debugger
                console.log(data)
                if (data.msg == "OK") {
                    var v = data.result;
                    isShowTab(v.roleList[0].roleId);

                    roleId = v.roleList[0].roleId;
                    $('#userName').val(v.userName);
                    $('#userId').val(v.userId);
                    $('#roles').val(roleId);
                    if (v.roleList[0].roleId == 3) {
                        $('#farmerName').val(v.farmerPublicInf.farmerName);
                        $('#farmerCardId').val(v.farmerPublicInf.farmerCardId);
                    } else {
                        $('#assName').val(v.assessorInf.assName);
                        $('#assJobNumber').val(v.assessorInf.assJobNumber);
                        $('#assJob').val(v.assessorInf.assJob);
                    }
                    $('#userPwd').val(v.userPwd);
                }
            },
            error: function (data) {
                console.log(data);
            }
        })
    }

    function isShowTab(roleId) {
        if (roleId == 3) {
            $("#farmerNameUpd").val('');
            $("#farmerCardIdUpd").val('');
            $(".ass").attr("style", "display:none;");
            $(".far").attr("style", "display:block;");
        } else {
            $("#assNameUpd").val('');
            $("#assJobNumberUpd").val('');
            $("#assJobUpd").val('');
            $(".far").attr("style", "display:none;");
            $(".ass").attr("style", "display:block;");

        }
    }
</script>
</body>
</html>
