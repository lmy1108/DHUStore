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
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-cookie-1.4.1.js"></script>
    <script type="text/javascript" src="js/requests.js"></script>
    <script type="text/javascript" src="layui.js"></script>
    <link id="layuicss-layer" rel="stylesheet" href="css/layer.css" media="all"></head>

<body>
<jsp:include page="userSideBar.jsp"/>
<div class="layui-body">
    <br/>
    <br/>
    <br/>
    <br/><br/>


    <fieldset class="layui-elem-field layui-field-title">
        <legend>个人信息</legend>
    </fieldset>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md3 layui-col-sm12 layui-col-xs12">
                <div class="layui-row" id="headpicWrapper">
                    <img id="headPic" src="/upload/${user.imagepath}">
                </div>
                <%--<div class="layui-row">
                    <div class="layui-row">
                        <div id="level"><span><i class="fa fa-child fa-fw"></i>等级：LV</span><span class="info"></span></div>
                        <!--<div id="levelRank"><span>排行：</span><span class="info">10000</span></div>-->
                    </div>
                    <div class="layui-progress layui-progress-big barMargin" lay-showpercent="true" id="levelBar">
                        <div class="layui-progress-bar layui-bg-orange" lay-percent="0%"></div>
                    </div>
                </div>--%>
                <div class="layui-row">
                    <div class="layui-row">
                        <div id="credit"><span><i class="fa fa-male fa-fw"></i>信用：LV</span><span class="info"></span></div>
                        <!--<div id="creditRank"><span>排行：</span><span class="info">10000</span></div>-->
                    </div>
                    <div class="layui-progress layui-progress-big barMargin" lay-showpercent="true" id="creditBar">
                        <div class="layui-progress-bar layui-bg-orange" lay-percent="0%"></div>
                    </div>
                </div>
                <%--<div class="layui-row">
                    <div class="layui-row">
                        <div id="userLevelStar"><span><i class="fa fa-star fa-fw"></i>用户评星：</span><span class="info"></span>
                        </div>
                    </div>
                    <div class="layui-progress layui-progress-big barMargin" lay-showpercent="true" id="userLevelStarBar">
                        <div class="layui-progress-bar layui-bg-orange" lay-percent="0%"></div>
                    </div>
                </div>--%>
                <div class="layui-row" id="toolBar">
                    <div class="layui-col-xs3 layui-col-xs-offset2">
                        <button class="layui-btn layui-btn-primary layui-btn-sm">
                            <i class="layui-icon"></i><span class="info" id="userHighOpinion"></span>
                        </button>
                    </div>
                    <div class="layui-col-xs3 layui-col-xs-offset2">
                        <button class="layui-btn layui-btn-primary layui-btn-sm">
                            <i class="layui-icon"></i><span class="info" id="userLowOpinion"></span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4 layui-col-sm6 layui-col-xs12 layui-col-md-offset1">
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-user fa-fw"></i>用户名：${user.username}<span class="info" id="username"></span>
                </blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-pencil fa-fw"></i>个性签名：<span class="info" id="userSignature"></span></blockquote>--%>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-male fa-fw"></i>姓名：${user.realname}<span class="info" id="userRealName"></span>
                </blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-mars fa-fw"></i>性别：<span class="info" id="userSex"></span>--%>
                </blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-birthday-cake fa-fw"></i>生日：<span class="info" id="userBirthday"></span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-university fa-fw"></i>大学：<span class="info" id="userSchool"></span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-map-marker fa-fw"></i>地址：<span class="info" id="userAddress"></span></blockquote>--%>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-phone fa-fw"></i>手机号：${user.telephone}<span class="info" id="userTel"></span>
                </blockquote>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-envelope fa-fw"></i>邮箱：${user.email}<span class="info" id="userEmail"></span></blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-qq fa-fw"></i>Q Q：<span class="info" id="userQq"></span>--%>
                </blockquote>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-wechat fa-fw"></i>微信：${user.wechat}<span class="info" id="userWechat"></span>
                </blockquote>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-credit-card fa-fw"></i>支付宝：${user.alipay}<span class="info" id="userAlipay"></span></blockquote>
            </div>
            <div class="layui-col-md3 layui-col-sm5 layui-col-xs12 layui-col-md-offset1 layui-col-sm-offset1">
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-calendar fa-fw"></i>注册日期：${user.regtime}<span class="info" id="userCredate"></span></blockquote>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-cart-plus fa-fw"></i>购买次数：${userAmount}<span class="info" id="buyNum"></span></blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-rmb fa-fw"></i>购买总额：<span class="info" id="buyMoney"></span><span class="info">元</span></blockquote>--%>
                <blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-rmb fa-fw"></i>购买总额：${userPrice}<span class="info" id="sellMoney"></span><span class="info">元</span></blockquote>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-eye fa-fw"></i>关注数：<span class="info">未开放</span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-heart fa-fw"></i>粉丝数：<span class="info">未开放</span>--%>
                <%--</blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-hourglass-half fa-fw"></i>任务进度：<span class="info">1-1</span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-trophy fa-fw"></i>达成成就：<span class="info">0</span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-balance-scale fa-fw"></i>综合指数：<span class="info">未开放</span></blockquote>--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm"><i class="fa fa-line-chart fa-fw"></i>指数排行：<span class="info">未开放</span></blockquote>--%>
            </div>
        </div>
    </div>
</div>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/userInfo.js"></script>

<script>
    <%--alert(JSON.stringify(${user}));--%>
</script>
<ul class="layui-fixbar" style="right: 15px; bottom: 10px;"><li class="layui-icon" lay-type="bar1" style=""></li><li class="layui-icon" lay-type="bar2" style=""></li><li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li></ul></body></html>