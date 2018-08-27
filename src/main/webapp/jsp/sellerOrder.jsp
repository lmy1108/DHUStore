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
    <link id="layuicss-layer" rel="stylesheet" href="css/layer.css" media="all">
</head>

<body style="">
<jsp:include page="sellerSideBar.jsp"/>
<div class="layui-body">
    <br/>
    <br/>
    <br/>
    <br/><br/>


    <fieldset class="layui-elem-field layui-field-title">
        <legend>订单管理</legend>
    </fieldset>
    <div class="layui-container" id="ManageProduct">
        <div class="layui-tab layui-tab-brief" lay-filter="statusChange">
            <ul class="layui-tab-title">
                <li class="layui-this"><i class="layui-icon"></i> 未发货</li>
                <li><i class="layui-icon"></i> 已发货</li>
                <li><i class="layui-icon"></i> 已收货</li>
                <%--<li><i class="layui-icon"></i> 已售出</li>--%>
                <%--<li><i class="layui-icon"></i> 回收站</li>--%>
            </ul>
            <div class="layui-tab-content">
                <!--待发布-->
                <div class="layui-tab-item layui-show">
                    <div class="layui-row topWrapper">
                        <div class="layui-col-xs12 layui-col-sm3">
                            <blockquote class="layui-elem-quote layui-quote-nm">
                                <span class="layui-badge-dot"></span><span> 发布前请保证信息的正确完整</span><br>
                                <span class="layui-badge-dot layui-bg-orange"></span><span> 待发布商品删除时将彻底删除</span><br>
                            </blockquote>
                        </div>
                        <!--<div class="layui-col-xs12 layui-col-sm2 layui-col-sm-offset1 marginTop">-->
                        <!--<button class="layui-btn">-->
                        <!--<i class="layui-icon">&#xe640;</i> 一键删除-->
                        <!--</button>-->
                        <!--</div>-->
                        <div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">
                            <div class="layui-row">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test1' name="minTime1"
                                               placeholder="开始时间">
                                    </div>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test2' name="maxTime1"
                                               placeholder="结束时间">
                                    </div>
                                </div>
                                <button class="layui-btn" id="reload1" data-type="reload1">
                                    <i class="layui-icon"></i> 搜索
                                </button>
                            </div>
                        </div>
                    </div>
                    <table lay-filter="itemStatus1" id="itemStatus1"></table>

                </div>
                <!--已发布-->
                <div class="layui-tab-item">
                    <div class="layui-row topWrapper">
                        <div class="layui-col-xs12 layui-col-sm3">
                            <blockquote class="layui-elem-quote layui-quote-nm">
                                <span class="layui-badge-dot"></span><span> 点击商品名可以查看商品详情</span><br>
                                <span class="layui-badge-dot layui-bg-orange"></span><span> 已发布商品删除时将彻底删除</span><br>
                            </blockquote>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">
                            <div class="layui-row">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test3' name="minTime2"
                                               placeholder="开始时间">
                                    </div>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test4' name="maxTime2"
                                               placeholder="结束时间">
                                    </div>
                                </div>
                                <button class="layui-btn" id="reload2" data-type="reload1">
                                    <i class="layui-icon"></i> 搜索
                                </button>
                            </div>
                        </div>
                    </div>
                    <table lay-filter="itemStatus2" id="itemStatus2"></table>
                </div>
                <!--待交易-->
                <div class="layui-tab-item">
                    <div class="layui-row topWrapper">
                        <div class="layui-col-xs12 layui-col-sm3">
                            <blockquote class="layui-elem-quote layui-quote-nm">
                                <span class="layui-badge-dot"></span><span> 点击商品名可以查看商品详情</span><br>
                                <span class="layui-badge-dot layui-bg-orange"></span><span> 点击订单号可以查看订单详情</span>
                            </blockquote>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">
                            <div class="layui-row">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test5' name="minTime3"
                                               placeholder="开始时间">
                                    </div>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id='test6' name="maxTime3"
                                               placeholder="结束时间">
                                    </div>
                                </div>
                                <button class="layui-btn" id="reload3" data-type="reload1">
                                    <i class="layui-icon"></i> 搜索
                                </button>
                            </div>
                        </div>
                    </div>
                    <table lay-filter="itemStatus3" id="itemStatus3"></table>
                </div>
                <!--已售出-->
                <%--<div class="layui-tab-item">--%>
                <%--<div class="layui-row topWrapper">--%>
                <%--<div class="layui-col-xs12 layui-col-sm3">--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm">--%>
                <%--<span class="layui-badge-dot"></span><span> 点击商品名可以查看商品详情</span><br>--%>
                <%--<span class="layui-badge-dot layui-bg-orange"></span><span> 点击订单号可以查看订单详情</span>--%>
                <%--</blockquote>--%>
                <%--</div>--%>
                <%--<!--<div class="layui-col-xs12 layui-col-sm2 layui-col-sm-offset1 marginTop">-->--%>
                <%--<!--<button class="layui-btn">-->--%>
                <%--<!--<i class="layui-icon">&#xe640;</i> 一键删除-->--%>
                <%--<!--</button>-->--%>
                <%--<!--</div>-->--%>
                <%--<div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">--%>
                <%--<div class="layui-row">--%>
                <%--<div class="layui-inline">--%>
                <%--<input type="text" class="layui-input" id="date4" autocomplete="off" placeholder="请选择日期 ">--%>
                <%--</div>--%>
                <%--<button class="layui-btn" data-type="reload">--%>
                <%--<i class="layui-icon"></i> 搜索--%>
                <%--</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<table lay-filter="itemStatus4" id="itemStatus4"></table>--%>
                <%--</div>--%>
                <!--回收站-->
                <%--<div class="layui-tab-item">--%>
                <%--<div class="layui-row topWrapper">--%>
                <%--<div class="layui-col-xs12 layui-col-sm3">--%>
                <%--<blockquote class="layui-elem-quote layui-quote-nm">--%>
                <%--<span class="layui-badge-dot"></span><span> 点击商品名可以查看商品详情</span><br>--%>
                <%--</blockquote>--%>
                <%--</div>--%>
                <%--<!--<div class="layui-col-xs12 layui-col-sm2 layui-col-sm-offset1 marginTop">-->--%>
                <%--<!--<button class="layui-btn">-->--%>
                <%--<!--<i class="layui-icon">&#xe640;</i> 彻底删除-->--%>
                <%--<!--</button>-->--%>
                <%--<!--</div>-->--%>
                <%--<div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">--%>
                <%--<div class="layui-row">--%>
                <%--<div class="layui-inline">--%>
                <%--<input type="text" class="layui-input" id="date5" autocomplete="off" placeholder="请选择日期 ">--%>
                <%--</div>--%>
                <%--<button class="layui-btn" data-type="reload">--%>
                <%--<i class="layui-icon"></i> 搜索--%>
                <%--</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<table lay-filter="itemStatus5" id="itemStatus5"></table>--%>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/html" id="waitLaunchOperate">
    <div class="layui-btn-group marginLeft">
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">
            <i class="layui-icon">&#xe642;</i>
        </button>
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="launch">
            <i class="layui-icon">&#xe609;</i>
        </button>
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">
            <i class="layui-icon">&#xe640;</i>
        </button>
    </div>
</script>
<script type="text/html" id="launchedOperate">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="Launch">
            确认发货
        </button>

    </div>
</script>
<script type="text/html" id="finishOperate">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="finish">
            完成订单
        </button>
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">
            <i class="layui-icon">&#xe640;</i>
        </button>
    </div>
</script>

<script type="text/html" id="binOperate">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="restore">
            <i class="layui-icon">ဂ</i>
        </button>
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">
            <i class="layui-icon">&#xe640;</i>
        </button>
    </div>
</script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js "></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js "></script>
<![endif]-->
<script type="text/javascript" src="js/orderManage.js"></script>


<ul class="layui-fixbar" style="right: 15px; bottom: 10px;">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
</ul>
</body>
</html>