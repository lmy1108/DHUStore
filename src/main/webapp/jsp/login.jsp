<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>东华商城-欢迎登录</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sort.js"></script>
<script src="${pageContext.request.contextPath}/js/holder.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/rollups/tripledes.js"></script>
	<script src="${pageContext.request.contextPath}/js/components/mode-ecb.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">


</head>

<script>
    function encryptByDES(message, key) {
        var keyHex = CryptoJS.enc.Utf8.parse(key);
        var encrypted = CryptoJS.DES.encrypt(message, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        return encrypted.toString();
    }


    function SubmitForm() {

        document.getElementById("username").value = encryptByDES(document.getElementById("username").value,'12345678');
        document.getElementById("password").value = encryptByDES(document.getElementById("password").value,'12345678');
        $.ajax({
            url: '${pageContext.request.contextPath}/confirmlogin' ,
            type: 'post',
            data: $('#form2').serialize(),
            datatype:'json',
            success: function (returndata) {
                if(returndata.code == 0){
                swal(returndata.msg);
                    window.location.href="/demo2/main";
                }
                else{
                    swal(returndata.msg);
                    document.getElementById("username").value="";
                    document.getElementById("password").value ="";
				}
            },
            error: function (returndata) {
                alert(returndata);
            }
        });
    }



</script>
<%--<script>

	$(document).ready(function() {

		
		$(document).keypress(function(e) {
			if (e.which == 13) {
				e.preventDefault();
				
				$(".login-input").click();
				//form.submit();
			}
		});
		input_value();
	})
	
	function input_value() {
		if (UserID != "null") {
			document.getElementById("inputEmail3").value = UserID;
		}
	}
</script>--%>

<script type="text/javascript">
	function reloadcode() {
		var verify = document.getElementById('code');
		verify.setAttribute("src", "${pageContext.request.contextPath}/verificationcodeimg?it=" + Math.random());
	}
</script>


<body onload="input_value()">
	<div id="main" class="container">
		<div id="header">
			<%@ include file="header.jsp"%>
		</div>
		<div class="login">
			<div class="row">
				<div class="col-md-6">
					<img src="./image/login.png" alt="" width="640" height="400" style="margin-left:-40px;margin-top:30px;">
				</div>
				<div class="col-md-5 form-login">
					<div>
						<!-- <h2 class="login-h2">登录</h2> -->
						<%--<form class="form-horizontal" id="form2" action="${pageContext.request.contextPath}/confirmlogin" method="post">--%>

						<form class="form-horizontal" id="form2" name="form2" action="${pageContext.request.contextPath}/confirmlogin" method="post">
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="密码">
								</div>
							</div>
							<%--<div class="form-group">--%>
								<%--<label for="confirmlogo" class="col-sm-2 control-label">验证码</label>--%>
								<%--<img src="${pageContext.request.contextPath}/verificationcodeimg" id="code" onclick="reloadcode()"--%>
									<%--style="cursor: pointer;" alt="看不清楚,换一张" width="100px">--%>
								<%--&lt;%&ndash;<div class="col-sm-10" style="width: 160px">&ndash;%&gt;--%>
									<%--&lt;%&ndash;<input type="text" class="form-control" id="confirmlogo"&ndash;%&gt;--%>
										<%--&lt;%&ndash;name="confirmlogo" placeholder="验证码">&ndash;%&gt;--%>
								<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--</div>--%>
							<div style="margin-left:80px;color:red;">
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="button" onclick="SubmitForm();" class="btn btn-primary login-input" value="登录"
										name="submit">
									<a href="/demo2/register" style="margin-left:10px;">没有账户？马上注册</a>
									<div class="error">
										${errorMsg}
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>