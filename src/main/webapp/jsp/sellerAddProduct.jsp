<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>个人信息</title>
    <link rel="shortcut icon" href="http://www.goudden.cn/images/icons/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/layui.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/userInfo.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-cookie-1.4.1.js"></script>
    <script type="text/javascript" src="js/requests.js"></script>
    <script type="text/javascript" src="layui.js"></script>
    <link id="layuicss-layer" rel="stylesheet" href="css/layer.css" media="all"></head>

<body>

<script>

    $(function(){
        var w=document.body.clientWidth;
        var h=document.body.clientHeight;
        $("#innerPage").css("position","absolute").css("left",0).css("top",70).css("width",w).css("height",h-120);
        $("#innerPage").css("border","none");
    });

    // window.onresize = function(){
    //     var w=document.body.clientWidth;
    //     var h=document.body.clientHeight;
    //     $("#innerPage").css("left",0).css("top",0).css("width",w).css("height",h);
    // };
</script>
<jsp:include page="sellerSideBar.jsp"/>


<iframe src="sellerAddInner" id="innerPage" scrolling="yes"  name="page">

</iframe>

<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<![endif]-->


<ul class="layui-fixbar" style="left: 15px; bottom: 14px;"><li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li></ul></body></html>