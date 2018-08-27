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


<style>
    .layui-table-cell{
        height: 65px;
        line-height: 65px;
    }

</style>

<body style="">
<jsp:include page="sellerSideBar.jsp"/>
<div class="layui-body">
<br/>
    <br/>
    <br/>
    <br/><br/>


    <fieldset class="layui-elem-field layui-field-title">
    <legend>商品管理</legend>
</fieldset>
<div class="layui-container" id="ManageProduct">
    <div class="layui-tab layui-tab-brief" lay-filter="statusChange">
        <ul class="layui-tab-title">
            <li class="layui-this"><i class="layui-icon"></i> 待交易</li>
            <li><i class="layui-icon"></i> 已完成</li>
            <%--<li><i class="layui-icon"></i> 待交易</li>--%>
            <%--<li><i class="layui-icon"></i> 已售出</li>--%>
            <%--<li><i class="layui-icon"></i> 回收站</li>--%>
        </ul>
        <div class="layui-tab-content">
            <!--待发布-->
            <div class="layui-tab-item layui-show">
                <div class="layui-row topWrapper">
                    <div class="layui-col-xs12 layui-col-sm3">
                        <blockquote class="layui-elem-quote layui-quote-nm">
                            <span class="layui-badge-dot"></span><span> 点击商品描述可以查看</span><br>
                            <span class="layui-badge-dot layui-bg-orange"></span><span> 商品删除时将彻底删除</span><br>
                        </blockquote>
                    </div>
                    <!--<div class="layui-col-xs12 layui-col-sm2 layui-col-sm-offset1 marginTop">-->
                    <!--<button class="layui-btn">-->
                    <!--<i class="layui-icon">&#xe640;</i> 一键删除-->
                    <!--</button>-->
                    <!--</div>-->

                </div>
                <table lay-filter="itemStatus1" id="itemStatus1"></table><div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-2" style=" "><div class="layui-table-box"><div class="layui-table-header"><table cellspacing="0" cellpadding="0" border="0" class="layui-table"><thead><tr><th data-field="itemName"><div class="layui-table-cell laytable-cell-2-itemName"><span>商品名</span></div></th><th data-field="itemPrice"><div class="layui-table-cell laytable-cell-2-itemPrice"><span>价格</span><span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"></i><i class="layui-edge layui-table-sort-desc"></i></span></div></th><th data-field="supportBargain"><div class="layui-table-cell laytable-cell-2-supportBargain"><span>议价</span></div></th><th data-field="itemRange"><div class="layui-table-cell laytable-cell-2-itemRange"><span>范围</span><span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"></i><i class="layui-edge layui-table-sort-desc"></i></span></div></th><th data-field="saveTime"><div class="layui-table-cell laytable-cell-2-saveTime"><span>保存时间</span><span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"></i><i class="layui-edge layui-table-sort-desc"></i></span></div></th><th data-field="5"><div class="layui-table-cell laytable-cell-2-5" align="center"><span>操作</span></div></th></tr></thead></table></div><div class="layui-table-body layui-table-main"><div class="layui-none">返回的数据状态异常</div></div><div class="layui-table-fixed layui-table-fixed-r"><div class="layui-table-header"><table cellspacing="0" cellpadding="0" border="0" class="layui-table"><thead><tr><th data-field="5"><div class="layui-table-cell laytable-cell-2-5" align="center"><span>操作</span></div></th></tr></thead></table><div class="layui-table-mend"></div></div><div class="layui-table-body"><table cellspacing="0" cellpadding="0" border="0" class="layui-table"><tbody></tbody></table></div></div></div><div class="layui-table-page"><div id="layui-table-page2"></div></div><style>.laytable-cell-2-itemName{ width: 190px; }.laytable-cell-2-itemPrice{ width: 80px; }.laytable-cell-2-supportBargain{ width: 60px; }.laytable-cell-2-itemRange{ width: 80px; }.laytable-cell-2-saveTime{ width: 403px; }.laytable-cell-2-5{ width: 100px; }</style></div>
            </div>
            <!--已发布-->
            <div class="layui-tab-item">
                <div class="layui-row topWrapper">
                    <div class="layui-col-xs12 layui-col-sm3">
                        <blockquote class="layui-elem-quote layui-quote-nm">
                            <span class="layui-badge-dot"></span><span> 点击商品描述可以查看</span><br>
                            <span class="layui-badge-dot layui-bg-orange"></span><span> 商品删除时将彻底删除</span><br>
                        </blockquote>
                    </div>

                </div>
                <table lay-filter="itemStatus2" id="itemStatus2"></table>
            </div>
            <!--待交易-->
            <%--<div class="layui-tab-item">--%>
                <%--<div class="layui-row topWrapper">--%>
                    <%--<div class="layui-col-xs12 layui-col-sm3">--%>
                        <%--<blockquote class="layui-elem-quote layui-quote-nm">--%>
                            <%--<span class="layui-badge-dot"></span><span> 点击商品名可以查看商品详情</span><br>--%>
                            <%--<span class="layui-badge-dot layui-bg-orange"></span><span> 点击订单号可以查看订单详情</span>--%>
                        <%--</blockquote>--%>
                    <%--</div>--%>
                    <%--<div class="layui-col-xs12 layui-col-sm5 layui-col-sm-offset1 marginTop">--%>
                        <%--<div class="layui-row">--%>
                            <%--<div class="layui-inline">--%>
                                <%--<input type="text" class="layui-input" id="date3" autocomplete="off" placeholder="请选择日期 ">--%>
                            <%--</div>--%>
                            <%--<button class="layui-btn" data-type="reload">--%>
                                <%--<i class="layui-icon"></i> 搜索--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<table lay-filter="itemStatus3" id="itemStatus3"></table>--%>
            <%--</div>--%>
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

        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">
            <i class="layui-icon">&#xe640;</i>
        </button>
    </div>
</script>
<script type="text/html" id="soldOperate">
    <div class="layui-btn-group">
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
<script type="text/javascript" src="js/itemManage.js"></script>


<ul class="layui-fixbar" style="right: 15px; bottom: 10px;"><li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li></ul></body></html>