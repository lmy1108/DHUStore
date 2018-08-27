<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .layui-layout-admin .layui-header{background-color: #d5c59f;}
    /*.layui-nav .layui-nav-child a{color: #000;}*/
    /*.layui-nav .layui-nav-child a:hover{background-color: #00acc1; color: #000;}*/

    .layui-nav{position: relative; padding: 0; background-color: #d5c59f; color: #fff; border-radius: 2px; font-size: 0; box-sizing: border-box;}
    .layui-layout-admin .layui-logo{position: absolute; left: 0; top: 0; width: 200px; height: 100%; line-height: 60px; text-align: center; color: #e8f5e9; font-size: 16px;}
    .layui-nav-tree .layui-nav-bar{background-color: #d5c59f;}
    .layui-side-scroll{background-color: #d5c59f; position: relative; width: 220px; height: 100%; overflow-x: hidden;}

</style>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">卖家后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/upload/${seller.imagepath}" class="layui-nav-img">
                    ${seller.sellername}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/demo2/main">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">卖家管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/getSellerInfo">我的信息</a></dd>
                        <dd><a href="/demo2/sellerEditInfo">修改信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="#">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/sellerAddProduct">添加商品</a></dd>
                        <dd><a href="/demo2/sellerProductManage">现有商品</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item"><a href="/demo2/sellerOrder">订单管理</a></li>
                <li class="layui-nav-item"><a href="/demo2/sellerAdvertise">广告管理</a></li>
            </ul>
        </div>
    </div>
</div>