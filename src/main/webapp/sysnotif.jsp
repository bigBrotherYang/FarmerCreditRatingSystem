<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/1
  Time: 下午8:36
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
<div class="container" id="tab-context">

    <form id="noticFrom">
        <div class="form-group">
            <label for="exampleInputEmail1">系统公告</label>
            <input type="hidden" class="form-control" id="exampleInputEmail1" placeholder="Email">
        </div>
        <div class="form-group">
            <label for="snNotice">请输入公告信息</label>
            <textarea class="form-control" id="snNotice" name="snNotice" rows="3"></textarea>
        </div>

        <button type="button" onclick="noticFrom()"  class="btn btn-default">提交</button>
    </form>
</div>
<script>
    function noticFrom(){
        if ($("#snNotice").val().length <1 ){
            alert("公告信息不能为空");
            return;
        }

        $.ajax({
            url: "notic/snednotic",
            type: "post",
            data: $("#noticFrom").serialize() ,
            success: function (data) {
                console.log(data)
                if (data.msg == "OK") {
                    alert("发布成功")
                    $("#noticFrom").reset();
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }
</script>
</body>
</html>
