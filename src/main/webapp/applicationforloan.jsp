<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/3
  Time: 下午12:27
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
    <form id="loanForm">
        <center>
            <label for="loan">请输入贷款金额</label>
            <input id="loan" type="text" name="lrMoney" class="form-control">
            <input type="button" onclick="applicationforloan()" value="提交">
        </center>
    </form>
</div>
<script>

    $(function () {
            //检测当前农户是否填写个人信息。
        $.ajax({
            url:"self/fandFarmerPerson",
            type:"post",
            dataType:"json",
            success:function (data) {
                if (data.msg!="OK"){
                    $("#tab-context").html("<h3>申请贷款前，请先填写个人资料。</h3>")
                }
                if (data.msg=="OK"){
                   var m = data.result;
                   debugger
                   if (m.examine==0 || m.examineLoan == 0){
                       $("#tab-context").html("<h3>当前有贷款在审核中！</h3>")
                   }
                }
            }
        })

    })



    function applicationforloan() {


        var l = $("#loan").val();
        if(!/([1-9]([0-9]+)?(.[0-9]{1,2})?$)|(^(0){1}$)|([0-9].0-9?$)/g.test(l)){
            alert("请输入正确的金额！");
            return;
        }
        if (parseFloat(l)<3000 || parseFloat(l)>90000){
            alert("贷款金额不能小于3000大于90000");
            return;
        }
        $.ajax({
            url:"loanrrecord/addLoanrRecord",
            type:"post",
            dataType:"json",
            data:$("#loanForm").serialize(),
            success:function (data) {
                if (data.msg=="OK"){
                    alert("贷款提交成功！")
                }
            }
        })
    }
</script>
</body>
</html>
