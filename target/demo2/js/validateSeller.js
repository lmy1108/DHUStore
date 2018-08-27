
$.validator.setDefaults({
	submitHandler: function() {
		form.submit();
	}
});
$(document).ready(function() {
	$('#form').validate({
		rules: {
			sellername: "required",
            telephone: {
				required: true,
			},
            email: {
				required: true,
				email: true,
			},
            password: {
				required: true,
				minlength: 8,
			},
			confirmPassword: {
				required: true,
				minlength: 8,
				equalTo: "#password",
			},
            realname: {
                required: true,

            },wechat: {
                required: true,
            },alipay: {
                required: true,
            }
		},
		messages: {
            sellername: "用户名不能为空",
            telephone: "联系电话不能为空",
            email: {
				required: "邮箱输入不能为空",
				email: "请输入一个正确的邮箱",
			},
            password: {
				required: "密码输入不能为空",
				minlength: "密码长度不能小于8位",
			},
			confirmPassword: {
				required: "输入不能为空",
				minlength: "密码长度不能小于8位",
				equalTo: "两次密码输入不一致",
			},
			realname:{
            	required:"真实姓名不能为空"
			},
            wechat:{
                required:"微信不能为空"
            },alipay:{
                required:"支付宝账号不能为空"
            }
		}
	});
});