<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">用户后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/upload/${user.imagepath}" class="layui-nav-img">
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/demo2/information">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/demo2/main">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">买家管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/getUserInfo">我的信息</a></dd>
                        <dd><a href="/demo2/userEditInfo">修改信息</a></dd>

                    <%--<dd><a href="/demo2/sellerEditInfo">修改信息</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="#">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/userOrder">我的订单</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item"><a href="/demo2/showcart">我的购物车</a></li>
                <li class="layui-nav-item"><a href="/demo2/info/favorite">我的收藏</a></li>
            </ul>
        </div>
    </div>
</div>