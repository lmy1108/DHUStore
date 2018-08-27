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
<jsp:include page="sellerSideBar.jsp"/>
<style>
    #uploadHeadpic{
        margin-left: 30px;
    }
</style>
<div class="layui-body">
    <br/>
    <br/>
    <br/>
    <br/><br/>

<fieldset class="layui-elem-field layui-field-title">
    <legend>修改信息</legend>
</fieldset>
<div class="layui-container">
    <div class="layui-row">
        &nbsp;&nbsp;&nbsp;
        <div class="layui-col-sm3 layui-col-xs12" id="uploadHeadpicWrapper">
            <div class="layui-row">
                <img id="headPic" src="/upload/${sellerInfo.sellerimage}">
            </div>
            <div class="layui-row">
                <button type="button" class="layui-btn layui-bg-orange" id="uploadHeadpic">
                    <i class="layui-icon"></i>上传头像
                </button><input class="layui-upload-file" type="file" name="image">
            </div>
        </div>
        <div class="layui-col-sm9 layui-col-xs12">
            <form class="layui-form" action="#">
                <div class="layui-form-item">
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-user fa-fw"></i>用户名</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.sellername}" type="text" id="username" name="username" placeholder="请输入用户名" class="layui-input" >
                    </div>
                    </div>
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-lock fa-fw"></i>密码</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.password}" type="password" id="userPassword" name="password" class="layui-input" >
                    </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-male fa-fw"></i>姓名</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.realname}" type="text" id="userRealName" name="realname" required="" lay-verify="required" placeholder="请输入真实姓名（必填）" class="layui-input">
                    </div>
                    </div>
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-envelope fa-fw"></i>邮箱</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.email}" type="text" id="userEmail" name="email" required="" lay-verify="required|email" placeholder="请输入常用邮箱（必填）" class="layui-input">
                    </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-phone fa-fw"></i>手机号</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.telephone}" type="text" id="userTel" name="telephone" required="" lay-verify="required|phone" placeholder="请输入常用手机（必填）" class="layui-input">
                    </div>
                    </div>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-university fa-fw"></i>大学</label>--%>
                    <%--<div class="layui-input-inline">--%>
                        <%--<select id="userSchool" name="userSchool" lay-verify="required" lay-search="">--%>
                            <%--<option value="0" selected="">东华大学</option>--%>
                            <%--<option value="1">上海外国语大学</option>--%>
                            <%--<option value="2">上海对外经贸大学</option>--%>
                            <%--<option value="3">上海工程技术大学</option>--%>
                            <%--<option value="4">上海复旦视觉艺术学院</option>--%>
                            <%--<option value="5">上海立信会计金融学院</option>--%>
                            <%--<option value="6">华东政法大学</option>--%>

                        <%--</select><div class="layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="上海对外经贸大学" class="layui-input"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class="">东华大学</dd><dd lay-value="1" class="">上海外国语大学</dd><dd lay-value="2" class="layui-this">上海对外经贸大学</dd><dd lay-value="3" class="">上海工程技术大学</dd><dd lay-value="4" class="">上海复旦视觉艺术学院</dd><dd lay-value="5" class="">上海立信会计金融学院</dd><dd lay-value="6" class="">华东政法大学</dd></dl></div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-map-marker fa-fw"></i>地址</label>--%>
                    <%--<div class="layui-input-block">--%>
                        <%--<input type="text" id="userAddress" name="userAddress" required="" lay-verify="required" placeholder="请输入现住地址（必填）" class="layui-input">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-mars fa-fw"></i>性别</label>--%>
                    <%--<div class="layui-input-block">--%>
                        <%--<input type="radio" id="sexM" name="userSex" value="m" title="男"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>--%>
                        <%--<input type="radio" id="sexF" name="userSex" value="f" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-birthday-cake fa-fw"></i>生日</label>--%>
                    <%--<div class="layui-input-inline">--%>
                        <%--<input type="text" id="userBirthday" name="userBirthday" class="layui-input" lay-key="1">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-qq fa-fw"></i>Q Q</label>--%>
                    <%--<div class="layui-input-inline">--%>
                        <%--<input type="text" id="userQq" name="userQq" placeholder="请输入常用QQ（必填）" lay-verify="required|number" class="layui-input">--%>
                    <%--</div>--%>
                <%--</div>--%>
                    <div class="layui-inline">

                    <label class="layui-form-label"><i class="fa fa-wechat fa-fw"></i>微信</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.wechat}" type="text" id="userWechat" name="wechat" placeholder="请输入常用微信" class="layui-input">
                    </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="fa fa-credit-card fa-fw"></i>支付宝</label>
                    <div class="layui-input-inline">
                        <input value="${sellerInfo.alipay}" type="text" id="userAlipay" name="alipay" placeholder="请输入常用支付宝（必填）" lay-verify="required|number" class="layui-input">
                    </div>
                </div>
                <%--<div class="layui-form-item layui-form-text">--%>
                    <%--<label class="layui-form-label"><i class="fa fa-pencil fa-fw"></i>个性签名</label>--%>
                    <%--<div class="layui-input-block">--%>
                        <%--<textarea id="userSignature" name="userSignature" placeholder="今天，你的心情是怎样的呢？ (oﾟ▽ﾟ)o  " class="layui-textarea"></textarea>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </br>
                </br>
                </br>
                </br>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-warm" lay-submit="" lay-filter="editSubmit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<div style="display: none;" id="imageStore"></div>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/setSellerInfo.js"></script>


<ul class="layui-fixbar" style="left: 15px; bottom: 14px;"><li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li></ul></body>

</html>