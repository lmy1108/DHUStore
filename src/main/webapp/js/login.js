
$.validator.setDefaults({
	submitHandler: function() {
		form.submit();
	}
});
$(document).ready(function() {
	$('#form2').validate({
		rules: {
			username: "required",
			
			password: {
				required: true
			},

		},
		messages: {
			username: "用户名输入不能为空",
			
			password: {
				required: "密码输入不能为空"
			},

		}
	});
});