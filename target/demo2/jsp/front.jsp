<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" name="viewport"
          content="width=device-width,initial-scale=1,user-scalable=0,maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>大学二手交易平台</title>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-cookie-1.4.1.js"></script>
    <link rel="shortcut icon" href="images/icons/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/layui.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>

    <script type="text/javascript" src="js/requests.js"></script>
    <script type="text/javascript" src="layui.js"></script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div id="header">
        <%@ include file="shop/header.jsp" %>
    </div>

    <div class="container">
        <div class="layui-row">
            <div class="layui-col-md3 layui-col-sm4">
                <div class="layui-row" id="itemTypeWrapper">

                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10200" class="title">书籍资料</a>
                        <a href="pages/itemCenter.html?itemSmallType=10201" class="info">教材</a>
                        <a href="pages/itemCenter.html?itemSmallType=10202" class="info">英语</a>
                        <a href="pages/itemCenter.html?itemSmallType=10203" class="info">题库</a>
                        <a href="pages/itemCenter.html?itemSmallType=10204" class="info">复习资料</a>
                        <a href="pages/itemCenter.html?itemSmallType=10205" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10300" class="title">护肤彩妆</a>
                        <a href="pages/itemCenter.html?itemSmallType=10301" class="info">美容护肤</a>
                        <a href="pages/itemCenter.html?itemSmallType=10302" class="info">化妆品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10303" class="info">美发造型</a>
                        <a href="pages/itemCenter.html?itemSmallType=10304" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10500" class="title"> 时尚配饰</a>
                        <a href="pages/itemCenter.html?itemSmallType=10501" class="info">时尚饰品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10502" class="info">珠宝首饰</a>
                        <a href="pages/itemCenter.html?itemSmallType=10503" class="info">项链吊坠</a>
                        <a href="pages/itemCenter.html?itemSmallType=10504" class="info">手链手镯</a>
                        <a href="pages/itemCenter.html?itemSmallType=10505" class="info">潮流眼镜</a>
                        <a href="pages/itemCenter.html?itemSmallType=10506" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10600" class="title">寝室用品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10601" class="info">桌椅</a>
                        <a href="pages/itemCenter.html?itemSmallType=10602" class="info">装饰</a>
                        <a href="pages/itemCenter.html?itemSmallType=10603" class="info">用电品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10604" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10700" class="title"> 生活用品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10701" class="info">文具</a>
                        <a href="pages/itemCenter.html?itemSmallType=10702" class="info">耗材</a>
                        <a href="pages/itemCenter.html?itemSmallType=10703" class="info">电器</a>
                        <a href="pages/itemCenter.html?itemSmallType=10704" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10800" class="title">运动用品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10801" class="info">运动鞋</a>
                        <a href="pages/itemCenter.html?itemSmallType=10802" class="info">运动服</a>
                        <a href="pages/itemCenter.html?itemSmallType=10803" class="info">运动包</a>
                        <a href="pages/itemCenter.html?itemSmallType=10804" class="info">装备</a>
                        <a href="pages/itemCenter.html?itemSmallType=10805" class="info">健身用品</a>
                        <a href="pages/itemCenter.html?itemSmallType=10806" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=10900" class="title">限时票卡</a>
                        <a href="pages/itemCenter.html?itemSmallType=10901" class="info">会员卡</a>
                        <a href="pages/itemCenter.html?itemSmallType=10902" class="info">电影票</a>
                        <a href="pages/itemCenter.html?itemSmallType=10903" class="info">优惠券</a>
                        <a href="pages/itemCenter.html?itemSmallType=109 04" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=11000" class="title">电子产品</a>
                        <a href="pages/itemCenter.html?itemSmallType=11001" class="info">手机</a>
                        <a href="pages/itemCenter.html?itemSmallType=11002" class="info">电脑</a>
                        <a href="pages/itemCenter.html?itemSmallType=11003" class="info">平板</a>
                        <a href="pages/itemCenter.html?itemSmallType=11004" class="info">相机</a>
                        <a href="pages/itemCenter.html?itemSmallType=11005" class="info">手表</a>
                        <a href="pages/itemCenter.html?itemSmallType=11006" class="info">耳机</a>
                        <a href="pages/itemCenter.html?itemSmallType=11007" class="info">电玩</a>
                        <a href="pages/itemCenter.html?itemSmallType=11008" class="info">设备</a>
                        <a href="pages/itemCenter.html?itemSmallType=11009" class="info">数码配件</a>
                        <a href="pages/itemCenter.html?itemSmallType=11010" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=11100" class="title">有趣玩意</a>
                        <a href="pages/itemCenter.html?itemSmallType=11101" class="info">礼物</a>
                        <a href="pages/itemCenter.html?itemSmallType=11102" class="info">恶搞</a>
                        <a href="pages/itemCenter.html?itemSmallType=11103" class="info">黑科技</a>
                        <a href="pages/itemCenter.html?itemSmallType=11104" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=11200" class="title">虚拟货币</a>
                        <a href="pages/itemCenter.html?itemSmallType=11201" class="info">充值卡</a>
                        <a href="pages/itemCenter.html?itemSmallType=11202" class="info">游戏币</a>
                        <a href="pages/itemCenter.html?itemSmallType=11203" class="info">其他</a>
                    </div>
                    <hr>
                    <div>
                        <a href="pages/itemCenter.html?itemBigType=11300" class="title">生活服务</a>
                        <a href="pages/itemCenter.html?itemSmallType=11301" class="info">打印复印</a>
                        <a href="pages/itemCenter.html?itemSmallType=11302" class="info">跑腿</a>
                        <a href="pages/itemCenter.html?itemSmallType=11303" class="info">其他</a>
                    </div>
                </div>
            </div>
            <div class="layui-col-md9 layui-col-sm8">
                <div class="layui-row">
                    <div class="layui-col-md8 layui-col-sm12" id="bannerWrapper">
                        <div class="layui-carousel" id="banner">
                            <div carousel-item>
                                <div><img src="images/banners/banner1.png"></div>
                                <div><img src="images/banners/banner2.png"></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md4 layui-col-sm12" id="quickBar">
                        <blockquote class="layui-elem-quote layui-quote-nm">
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot"></span><span> 今日已有 </span>
                                    <span class="info" id="todayItem"></span><span> 件商品被发布</span>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="pages/admin.html?addItem" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon">&#xe609;</i>发布商品
                                    </a>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot"></span>
                                    <span>各类好货，任你挑选</span>

                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="pages/itemCenter.html" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon">&#xe698;</i>进入商城
                                    </a>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot"></span><span> 今日已有 </span>
                                    <span class="info" id="todayLogin"></span><span> 位用户登录</span>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="pages/admin.html" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe650;</i>我的主页</a>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot"></span>
                                    <span>快来喂饱自己的收藏夹 ω</span>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="pages/admin.html?itemFavorite" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon">&#xe600;</i>我的收藏
                                    </a>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot layui-bg-orange"></span>
                                    <span>下载安卓APP，享受极速浏览！</span>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="javascript: downloadApk()" class="layui-btn layui-btn-xs"><i
                                            class="layui-icon">&#xe601;</i>扫码下载</a>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-lg9 layui-col-md8 layui-col-xs9 quickTip">
                                    <span class="layui-badge-dot layui-bg-orange"></span>
                                    <span>觉得不错？分享一下</span>
                                </div>
                                <div class="layui-col-lg3 layui-col-md4 layui-col-xs3">
                                    <a href="javascript: share()" class="layui-btn layui-btn-xs"><i class="layui-icon">&#xe601;</i>分享我们</a>
                                </div>
                            </div>
                        </blockquote>

                    </div>
                </div>
                <div class="layui-row" id="hotBarWrapper">
                    <div class="layui-tab layui-tab-brief" id="hotBar" lay-filter="change">
                        <ul class="layui-tab-title">
                            <li class="layui-this">最新发布</li>
                            <li>最多人看</li>
                            <li>特色商品</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show" id="latestItemsWrapper">
                                <div class="layui-row">
                                    <div class="layui-col-md3 layui-col-xs6 hotPic latestItems"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic latestItems"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic latestItems"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic latestItems"></div>
                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div class="layui-row">
                                    <div class="layui-col-md3 layui-col-xs6 hotPic mostView"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic mostView"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic mostView"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic mostView"></div>
                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div class="layui-row">
                                    <div class="layui-col-md3 layui-col-xs6 hotPic specialItem"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic specialItem"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic specialItem"></div>
                                    <div class="layui-col-md3 layui-col-xs6 hotPic specialItem"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        © esjy.top 2017-2018 DZX and LYP. All Rights Reserved.
    </div>
</div>
<!--下载二维码-->
<img src="images/downloadApk.png" id="downloadApk"/>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/index.js"></script>

<!-- JiaThis Button BEGIN -->
<div class="jiathis_style_m" id="share"></div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_m.js" charset="utf-8"></script>
<!-- JiaThis Button END -->


</body>

</html>