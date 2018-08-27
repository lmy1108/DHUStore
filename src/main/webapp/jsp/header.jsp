<%--
  Created by IntelliJ IDEA.
  User: lmy
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #UserheadPic {
        width: 50px;
        height: 50px;
        border-radius: 40%;
        margin-bottom: 5px;
    }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<div class="row">
    <div class="col-md-6" role="navigation">

        <ul class="nav nav-pills">
            <c:if test="${empty sessionScope.user}">
                <li><a href="${pageContext.request.contextPath}/login" role="button" class="btn btn-success"><span class="glyphicon glyphicon-user">
                    </span>买家登录</a></li>
                <li><a href="${pageContext.request.contextPath}/sellerLogin" role="button" class="btn btn-primary"><span class="glyphicon glyphicon-inbox">卖家登录</span></a></li>
                <li><a href="${pageContext.request.contextPath}/adminLogin" role="button" class="btn btn-warning"><span class="glyphicon glyphicon-asterisk">管理员登录</span></a></li>
                <li><a href="${pageContext.request.contextPath}/register" role="button" class="btn btn-danger"><span class="glyphicon glyphicon-tags">买家注册</span></a></li>


            </c:if>
            <c:if test="${!empty sessionScope.user}">
        <li class="info-a">
            <%--<a href="${pageContext.request.contextPath}/information"><img id="UserheadPic" src="/upload/${user.imagepath}"></a>--%>
        <a href="${pageContext.request.contextPath}/getUserInfo" style="color: #F22E00">
            <img id="UserheadPic" src="/upload/${user.imagepath}">
        ${sessionScope.user.username}
        <span class="glyphicon glyphicon-triangle-bottom" style="font-size: 5px;margin-left: 7px;" aria-hidden="true">
        </span>
        </a>
        <ul class="dropdown-menu">
        <li><a href="${pageContext.request.contextPath}/getUserInfo">账户管理</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="${pageContext.request.contextPath}/logout" class="login-out">退出登录</a></li>
        </ul>
        </li>
        </c:if>

        </ul>
        </div>
        <div class="col-md-6">
        <ul class="nav nav-pills pull-right">

        <li><a role="button" class="btn btn-default" href="${pageContext.request.contextPath}/showcart"> <i
                    class="fa fa-shopping-cart" style="color: #F22E00"></i>
                购物车
            </a></li>
            <li><a role="button" class="btn btn-default" href="${pageContext.request.contextPath}/info/favorite"> <i
                    class="fa fa-star"></i> 收藏夹
            </a></li>
        </ul>
    </div><br/><br/><br/>

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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><!-- <img alt="Brand" style="display: inline-block;" src="./image/tao.jpg" width="20" height="20"> --><span class="logo-word">商城</span></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a class="a-color" href="${pageContext.request.contextPath}/main">首页</a></li>
                    <li><a class="a-color" href="${pageContext.request.contextPath}/getUserInfo">个人信息</a></li>
                    <li><a class="a-color" href="${pageContext.request.contextPath}/userOrder">我的订单</a></li>
                    <li><a class="a-color" href="${pageContext.request.contextPath}/chatrobot">客服</a></li>

                </ul>

                <form class="navbar-form navbar-right" role="search" method="get" action="${pageContext.request.contextPath}/search">
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