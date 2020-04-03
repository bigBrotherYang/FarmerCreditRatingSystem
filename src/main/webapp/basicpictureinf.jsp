<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/3/30
  Time: 下午2:21
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
        #tab-context-m {
            width: 90%;
            height: auto;
            margin-top: 10px;
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container" id="tab-context-m">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">基础图片信息</h3>
        </div>

    </div>
    <div>
        <a href="javascript:void(0)" onclick="uploadPhoto()">上传借贷情况图片</a>
        <input type="file" id="photoFile" style="display: none;" onchange="upload()">
        <img src="static/upload/no.jpg" id="img1" width="92%" height="600" class="img-responsive">
    </div>
    <div>
        <a href="javascript:void(0)"   onclick="uploadPhoto1()">上传经营情况图片</a>
        <input type="file" id="photoFile1" style="display: none;" onchange="upload1()">
        <img src="static/upload/no.jpg" id="img2" width="92%" height="600" class="img-responsive">

    </div>
</div>
<script>
    $(function () {
        $.ajax({
            url:"self/fandBasicpictPerson",
            type:"post",
            success: function(data) {
                if (data.msg == "OK") {
                    var m =  data.result;
                    if (m!=null){
                        $("#img1").attr("src", m.fbpLoanUrl);
                        $("#img2").attr("src", m.fbpProductionUrl);
                    }

                } else {
                    alert(data.msg);
                }
            },
            error:function(data) {
                console.log("查询失败")
            }
        });
    })

    function uploadPhoto1() {
        $("#photoFile1").click();
    }

    function uploadPhoto() {
        $("#photoFile").click();
    }
    function upload() {
        if ($("#photoFile").val() == '') {
            return;
        }
        var formData = new FormData();
        formData.append('photo', document.getElementById('photoFile').files[0]);
        $.ajax({
            url:"self/uploadPhotoLoan",
            type:"post",
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                if (data.msg == "OK") {
                    $("#img1").attr("src", data.url);
                } else {
                    alert(data.msg);
                }
            },
            error:function(data) {
                alert("上传失败")
            }
        });
    }
    function upload1() {
        if ($("#photoFile1").val() == '') {
            return;
        }
        var formData = new FormData();
        formData.append('photo', document.getElementById('photoFile1').files[0]);
        $.ajax({
            url:"self/uploadPhotoProduction",
            type:"post",
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                if (data.msg == "OK") {
                    $("#img2").attr("src", data.url);
                } else {
                    alert(data.msg);
                }
            },
            error:function(data) {
                alert("上传失败")
            }
        });
    }
</script>
</body>
</html>
