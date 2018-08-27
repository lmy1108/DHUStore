<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/5/19
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员登录</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">
</head>

<style>



    .btn-primary {
        border-radius: 2px;
        background-color: #eea236;
        border: none;
        color: white;
    }
    .btn-primary:hover { background-color: #ec971f; }
    .templatemo-blue-button,
    .templatemo-white-button {
        border-radius: 2px;
        padding: 10px 30px;
        text-transform: uppercase;
        transition: all 0.3s ease;
    }
    .templatemo-blue-button {
        background-color: #eea236;
        border: none;
        color: white;
    }
    .templatemo-blue-button:hover {	background-color: #ec971f; }
    .templatemo-white-button {
        background-color: white;
        border: 1px solid #eea236;
        color: #eea236;
    }
    .templatemo-white-button:hover { background-color: #eff2f3;	}
    .templatemo-register-widget {
        max-width: 450px;
        padding: 15px;
        text-align: center;
    }
    .templatemo-blue-button {
        background-color: #00b9d8;
        border: none;
        color: white;
    }
    .templatemo-blue-button:hover {	background-color: #00BCD4; }

</style>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <h1>管理员登录</h1>
    </header>
    <form action="${pageContext.request.contextPath}/adminConfirmLogin" class="templatemo-login-form" method="post">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>
                <input type="text" class="form-control" placeholder="用户名" name="adminName">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>
                <input type="password" class="form-control" placeholder="密码" name="password">
            </div>
        </div>
        <div class="form-group">
            <div class="checkbox squaredTwo">
                <input type="checkbox" id="c1" name="cc" />
                <%--<label for="c1"><span></span>记住密码</label>--%>
                <span class="error-msg">${errorMsg}</span>
            </div>
        </div>
        <div class="form-group">
            <button type="submit" onclick="setCookie()" class="templatemo-blue-button width-100">登录</button>
        </div>
    </form>
</div>
<!-- <div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
    <p>Not a registered user yet? <strong><a href="#" class="blue-text">Sign up now!</a></strong></p>
</div> -->
</body>
<script>

</script>
</html>
