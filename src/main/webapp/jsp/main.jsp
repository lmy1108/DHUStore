<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/5/18
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>东华商城</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <!-- 	<script>
            $(document).ready(function(){
                $(".list-group-item").hover(function(){
                    $(this).children("div.sort-detail").show();
                },function(){
                    $(this).children("div.sort-detail").hide();
                });
            })
        </script> -->
    <script>
        /*$(document).ready(function () {
            $(".data-item-li").children("div").addClass("to-big");
        });*/
    </script>
</head>
<style>

    .box2-img{width:210px;height:210px;text-align: center;display:table-cell;vertical-align: middle;}
    .box2-img .img2{max-height:100%;max-width:100%;}
    #advertise{
        width:200px;
        height: 200px;
    }
    #advertiseli{
        width:200px;

    }
    #seller{
        width:140px;
        height: 140px;
    }
    #sellerli{
        width:140px;

    }
    .carousel-inner img {
        width:100%;
    }

    #sellerimg{
        width: 140px;
        height: 140px;
        border-radius: 50%;
    }
</style>
<body>
<div id="main" class="container">
    <!-- <div id="header">
        <ul id="header_left">
            <li id="login"><a href="">登录</a></li>
            <li id="register"><a href="">注册</a></li>
        </ul>
        <ul>
            <li><a href="">购物车</a></li>
            <li><a href="">收藏夹</a></li>
            <li><a href="">客服</a></li>
        </ul>
    </div>
    <div>

    </div> -->
    <div id="header">
        <%@ include file="header.jsp" %>
        <%--<%
            String userId = (String) session.getAttribute("userId");
            //out.println(userId);
            String username = (String) session.getAttribute("username");
            if (username == null) {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">

                    <li><a href="./login.jsp" style="color: #F22E00">请登录</a></li>


                    <li><a href="./register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="header-nav-middle">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><!-- <img alt="Brand" style="display: inline-block;" src="./image/tao.jpg" width="20" height="20"> --><span class="logo-word">东华商城</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./login.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./login.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="login.jsp">出售中</a></li>
                                    <li><a href="login.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./login.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
        } else {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">
                    <li class="info-a"><a href="./info.jsp"
                                          style="color: #F22E00"><%=username%><span class="glyphicon glyphicon-triangle-bottom" style="font-size: 5px;margin-left: 7px;" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="./info.jsp">账户管理</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="./login.jsp" class="login-out">退出登录</a></li>

                        </ul></li>
                    <li><a href="register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./chat.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./shopcart.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./favorite.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="&lt;%&ndash;header-nav-middle&ndash;%&gt;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><span class="logo-word">东华商城</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         &lt;%&ndash;id="bs-example-navbar-collapse-1"&ndash;%&gt;>
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./release.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./info.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="info.jsp">出售中</a></li>
                                    <li><a href="info.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./chat.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
            }
        %>--%>
        <!-- 旋转图 -->
        <div class="header-bottom">
            <div class="sort">
                <div class="sort-channel">
                    <ul class="sort-channel-list list-group">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=电子">电子</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=生活用品">日用</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=书籍">书籍</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=服装">服装</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=化妆品">化妆品</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=零食小吃">零食</a>

                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=闲置百货">百货</a>

                        </li>
                    </ul>
                </div>
                <!-- <div class="sort-detail">
                    <dl class="dl-horizontal">
                        <dt>手机</dt>
                        <dd>
                            <a href="${pageContext.request.contextPath}/category?cate=手机壳">手机壳</a>
                            <a href="${pageContext.request.contextPath}/category?cate=充电器">充电器</a>
                            <a href="">电池</a>
                            <a href="${pageContext.request.contextPath}/category?cate=耳机">耳机</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>相机</dt>
                        <dd>
                            <a href="">镜头</a>
                            <a href="">单反</a>
                            <a href="">胶片</a>
                            <a href="">摄像</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>电脑</dt>
                        <dd></dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>MP3</dt>
                        <dd></dd>
                    </dl>
                </div> -->
            </div>
            <div id="mycarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <%--><img src="${pageContext.request.contextPath}/image/4.jpg"  alt=""><--%>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/image/3.jpg" alt="">
                        </a>
                    </div>
                    <c:forEach items="${advertiseList}" var="advertise">
                        <div class="item">
                            <a href="${pageContext.request.contextPath}/advertise?advertiseid=${advertise.advertiseid}">
                                <img src="/upload/${advertise.imagepath}" alt="">
                            </a>
                        </div>
                    </c:forEach>
                </div>

                <ol class="carousel-indicators">
                    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#mycarousel" data-slide-to="1"></li>
                    <li data-target="#mycarousel" data-slide-to="2"></li>
                    <li data-target="#mycarousel" data-slide-to="3"></li>

                </ol>

                <a class="left carousel-control" href="#mycarousel" role="button"
                   data-slide="prev" style="display: none;"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a> <a class="right carousel-control" href="#mycarousel" role="button"
                        data-slide="next" style="display: none;"> <span
                    class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
            <div class="clear-float"></div>
        </div>
    </div>
    <div class="content">

        <c:if test="${!empty sellerList}">
            <div class="module">
                <div class="hd">
                    <h2>明星卖家</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${sellerList}" var="seller">
                                <li class="data-item-li" id="sellerli">
                                    <div class="to-big" id="seller">
                                        <a href="${pageContext.request.contextPath}/sellerMain?sellerId=${seller.sellerid}">
                                            <img id="sellerimg" src="/upload/${seller.imagepath}" alt=""
                                                 width="200" height="200">
                                        </a>
                                    </div>
                                    <h4 class="text-center">
                                        <a href="${pageContext.request.contextPath}/sellerMain?sellerId=${seller.sellerid}">${seller.sellername}</a>
                                    </h4>


                                </li>
                            </c:forEach>
                            <h5 class="text-center">
                                <a href="${pageContext.request.contextPath}/sellerRegister">成为下一个卖家？<br/>立即注册</a>
                            </h5>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty advertiseList}">
            <div class="module">
                <div class="hd">
                    <h2>卖家广告</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${advertiseList}" var="advertise">
                                <li class="data-item-li" id="advertiseli">
                                    <div class="to-big" id="advertise">
                                        <a href="${pageContext.request.contextPath}/advertise?advertiseid=${advertise.advertiseid}">
                                            <img src="/upload/${advertise.imagepath}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <h4 class="text-center">
                                        <a href="${pageContext.request.contextPath}/advertise?advertiseid=${advertise.advertiseid}">${advertise.advertisename}</a>
                                    </h4>


                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty digGoods}">
            <div class="module">
                <div class="hd">
                    <h2>数码</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${digGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                        <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                            <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty houseGoods}">
            <div class="module">
                <div class="hd">
                    <h2>生活用品</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${houseGoods}" var="housegoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                        <img class="img-rounded" src="/upload/${housegoods.imagepath}" width="210" height="210">
                                        </div>
                                            <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${housegoods.productid}">${housegoods.productname}</a></h3>
                                            <b>￥${housegoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${housegoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${housegoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${housegoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!housegoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${housegoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty colGoods}">
            <div class="module">
                <div class="hd">
                    <h2>化妆品</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${colGoods}" var="colgoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                        <img class="img-rounded" src="/upload/${colgoods.imagepath}" width="210" height="210">
                                        </div>
                                            <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${colgoods.productid}">${colgoods.productname}</a></h3>
                                            <b>￥${colgoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${colgoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${colgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${colgoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!colgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${colgoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty bookGoods}">
            <div class="module">
                <div class="hd">
                    <h2>书籍</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${bookGoods}" var="bookgoods">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">

                                            <img class="img-rounded" src="/upload/${bookgoods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${bookgoods.productid}">${bookgoods.productname}</a></h3>
                                            <b>￥${bookgoods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${bookgoods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${bookgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${bookgoods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!bookgoods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${bookgoods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty dressGoods}">
            <div class="module">
                <div class="hd">
                    <h2>服装</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${dressGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty snackGoods}">
            <div class="module">
                <div class="hd">
                    <h2>零食小吃</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${snackGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${!empty studyGoods}">
            <div class="module">
                <div class="hd">
                    <h2>学习用品</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${studyGoods}" var="goods">

                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div class="box2-img">
                                            <img class="img-rounded" src="/upload/${goods.imagepath}" width="210" height="210">
                                        </div>
                                        <div class="caption">
                                            <h3><a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}">${goods.productname}</a></h3>
                                            <b>￥${goods.price}</b>
                                            &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;    <a href="${pageContext.request.contextPath}/detail?productid=${goods.productid}" class="btn btn-primary" role="button">详细</a>
                                            <c:if test="${goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>
                                            <c:if test="${!goods.fav}">
                                                <button
                                                        class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                        data-id="${goods.productid}"
                                                ></button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>


