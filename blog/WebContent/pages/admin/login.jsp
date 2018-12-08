<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录 - 清轩博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/style.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/login.css">
	<link rel="apple-touch-icon-precomposed" href="/blog/images/icon/icon.png">
	<link rel="shortcut icon" href="/blog/images/icon/favicon.ico">
	<script src="/blog/pages/js/getDate.js"></script>
	<script src="/blog/js/jquery-2.1.4.min.js"></script>
</head>
<body class="user-select">
<div class="container">
	<div class="siteIcon">
		<img src="/blog/pages/images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用清轩博客管理系统" draggable="false" />
	</div>
	<form action="/blog/login" method="post" autocomplete="off" class="form-signin">
		<h2 class="form-signin-heading">管理员登录</h2>
		<label for="userName" class="sr-only">用户名</label>
		<input type="text" id="userName" name="username" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10">
		<label for="userPwd" class="sr-only">密码</label>
		<input type="password" id="userPwd" name="password" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18">
		<button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">登录</button>
	</form>
	<div class="footer">
		<p>
			<a href="/blog/pages/admin/main.jsp" data-toggle="tooltip" data-placement="left" title="不知道自己在哪?">回到清轩博客 →</a>
		</p>
	</div>
</div>
<script src="/blog/pages/js/bootstrap.min.js"></script> 
<script>
$('[data-toggle="tooltip"]').tooltip();
window.oncontextmenu = function(){
	//return false;
};
$('.siteIcon img').click(function(){
	window.location.reload();
});
var flag =1;
$('#signinSubmit').click(function(){
	if($('#userName').val() === ''){
		flag = 0;
		$(this).text('用户名不能为空');
	}else if($('#userPwd').val() === ''){
		flag = 0;
		$(this).text('密码不能为空');
	}else{
		flag = 1;
	}
});
//ajax异步登陆请求
$("#signinSubmit").click(function(){
	if(flag == 1){
		$.post("/blog/login",{username:$("#userName").val(),password:$("#userPwd").val(),loginTime:getDate()},function(data){
			if(data == 1){
				window.location="/blog/main";
			}else if(data == -1){
				alert("当前用户状态不允许登陆！");
			}else{
				alert("用户名或密码错误！");
			}
		});
	}
	return false;
});
</script>
</body>
</html>