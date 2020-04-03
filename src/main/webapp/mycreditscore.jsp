<%--
  Created by IntelliJ IDEA.
  User: YangML
  Date: 2020/4/3
  Time: 上午11:55
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
    <div id="box" style="width: 600px;height: 600px;"></div>
</div>
<script src="static/baidu/echarts.min.js"></script>
<script>

    //初始化ehcharts实例
    var myChart=echarts.init(document.getElementById("box"));
    $(function () {
        finaReportform();
    })
    function finaReportform() {
        $.ajax({
            url: "monthLy/findSelfMonthlyScoreByUserId",
            type: "post",
            success: function (data) {
                if (data.msg=="OK"){
                    var  m =   data.result;
                    var td   = new Array();
                    var score= new Array();
                    debugger
                    for (i=0;i<m.length;i++){
                        td.push("'"+m[i].createTime+"'");
                        score.push(m[i].msofScore);

                    }
                    console.log(td)
                    console.log(score)
                    var option={title:{text:'月评分统计'},toolbox:{show:true,feature:{saveAsImage:{show:true}}},legend:{data:['信用分']},xAxis:{data:td},yAxis:{},series:[{name:'销量',type:'line',data:score}]};
                    // var option={title:{text:'月评分统计'},toolbox:{show:true,feature:{saveAsImage:{show:true}}},legend:{data:['信用分']},xAxis:{data:["苹果","橘子","橙子","香蕉","菠萝","榴莲"]},yAxis:{},series:[{name:'销量',type:'line',data:[40,20,35,60,55,10]}]};
                    //使用刚刚指定的配置项和数据项显示图表
                    myChart.setOption(option);
                    $("#reportformmodal").modal("show");
                    console.log(data)
                }else{
                    alert("当前用户没有产生信用评分！")
                }
            }, error: function (data) {
                console.log(data);
            }
        })
    }
</script>
</body>
</html>
