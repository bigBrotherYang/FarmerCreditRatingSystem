<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/25
  Time: 下午6:20
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="static/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="static/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="static/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body>
<div class="login-box">
    <div class="login-logo">
        <a href="javascript:void(0)"><b>Admin</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登入开始使用</p>

        <form id="form1" onclick="return false" method="post">
            <div class="form-group has-feedback">
                <input type="text" placeholder="账号" name="userName" value="admin" class="form-control" >
                <font id="username" color="red"></font>
                <span class="glyphicon glyphicon-envelope form-control-feedback">
                </span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" value="123456" name="userPwd" placeholder="密码">
                <font id="userpwd" color="red"></font>
                <span class="glyphicon glyphicon-lock form-control-feedback">
                </span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <span>
                                <font id="msg" color="red">${msg}</font>
                            </span>
<%--                            <input type="checkbox"><font disabled="disabled" hidden="hidden"> Remember Me</font>--%>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" onclick="javascipt:clecklogin()" class="btn btn-primary btn-block btn-flat">登&nbsp;&nbsp;&nbsp;入</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="static/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="static/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="static/iCheck/icheck.min.js"></script>


<script>
    function clecklogin(){
        //$("#form1").serialize(),
        var username = $("[name='userName']").val();
        var userpwd = $("[name='userPwd']").val();
        if (username==null||username.length==0){
            $("#username").html("账户不能为空")
            return;
        }
        if (userpwd==null||userpwd.length==0){
            $("#userpwd").html("密码不能为空")
            return;
        }

        $.ajax({
            url:"user/checkLogin",
            type:"post",
            data:{"userName":username,"userPwd":userpwd},
            success:function(data){
                if (data.url!=null&&data.url.length>0){
                    window.location.href="user"+data.url;
                }else{
                    $("#msg").html(data.msg);
                }
            },
            error:function(data){
                console.log(data);
            }
        })

    }
    // $(function () {
        // $('input').iCheck({
        //     checkboxClass: 'icheckbox_square-blue',
        //     radioClass: 'iradio_square-blue',
        //     increaseArea: '20%' // optional
        // });
    // });
</script>
</body>
</html>
