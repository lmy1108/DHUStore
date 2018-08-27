<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style>

    .layui-layout-admin .layui-header{background-color: #3275BB;}
    /*.layui-nav .layui-nav-child a{color: #000;}*/
    /*.layui-nav .layui-nav-child a:hover{background-color: #00acc1; color: #000;}*/

    .layui-nav{position: relative; padding: 0; background-color: #0277bd; color: #fff; border-radius: 2px; font-size: 0; box-sizing: border-box;}
    .layui-layout-admin .layui-logo{position: absolute; left: 0; top: 0; width: 200px; height: 100%; line-height: 60px; text-align: center; color: #c4e6f5; font-size: 16px;}
    .layui-nav-tree .layui-nav-bar{background-color: #2aabd2;}
    .layui-side-scroll{background-color: #0277bd; position: relative; width: 220px; height: 100%; overflow-x: hidden;}

</style>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">管理员后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="/demo2/adminSeller">卖家管理</a></li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/userManage">所有用户</a></dd>
                        <dd><a href="/demo2/adminComment">用户评论</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/adminManage">现有商品</a></dd>
                        <dd><a href="/demo2/adminOrder">订单管理</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">统计图表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/demo2/xiaoshoue">分类销售额</a></dd>
                        <dd><a href="/demo2/salesrate">分类销售比例</a></dd>
                        <dd><a href="/demo2/salesmonth">各月份销售额</a></dd>
                        <dd><a href="/demo2/salespp">各卖家销售额统计</a></dd>


                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>