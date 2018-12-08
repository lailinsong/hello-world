<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>个人信息-清轩博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/style.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/blog/pages/images/icon/icon.png">
	<link rel="shortcut icon" href="/blog/pages/images/icon/favicon.ico">
	<script src="/blog/pages/js/jquery-2.1.4.min.js"></script>
	<style type="text/css">
		table,h1{
			text-align: left;
		}
		#info{
			margin-top: 100px;
		}
		#butt{
			text-align: right;
		}
	</style>
</head>
<body class="user-select">
<section class="container-fluid">
	<header>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">切换导航</span><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="">SongBlog</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="">博客首页</a>
						</li>
						<li class="dropdown">
							<a href="/blog/userinfo" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false"><span>${user.userName}</span></a>
						</li>
						<li>
							<a href="javascript:void()" onClick="if(confirm('是否确认退出？'))window.location='/blog/loginOut';">退出登录</a>
						</li>
						<li>
							<a data-toggle="modal" data-target="#WeChat">帮助</a>
						</li>
					</ul>
					<form action="" method="post" class="navbar-form navbar-right" role="search">
						<div class="input-group">
							<input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<div class="row">
		<aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
			<ul class="nav nav-sidebar">
				<li>
					<a href="/blog/main">系统信息</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li>
					<a href="/blog/showPage">文章列表</a>
				</li>
				<li>
					<a href="/blog/addarticle">文章添加</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li class="active">
					<a href="/blog/userinfo">个人信息</a>
				</li>
				<li>
					<a href="/blog/adduser">添加用户</a>
				</li>
				<li>
					<a href="/blog/listUser">管理用户</a>
				</li>
				<li>
					<a href="/blog/selLogByPage">登录日志</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li>
					<a href="/blog/selBSet">基本设置</a>
				</li>
				<li>
					<a data-toggle="modal" data-target="#areDeveloping">阅读设置</a>
				</li>
				<li>
					<a data-toggle="modal" data-target="#areDeveloping">安全配置</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li>
					<a data-toggle="modal" data-target="#areDeveloping">其它</a>
				</li>
			</ul>
		</aside>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
			<div id="info" class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<form action="/blog/updUser" method="post" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">名字：</label>
							<div class="col-sm-9">
								<input type="text" id="name" class="form-control" name="name" value="${user.name}" placeholder="请输入名字">
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label">用户名：</label>
							<div class="col-sm-9">
								<input type="text" id="username" class="form-control" name="username" value="${user.userName}" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-3 control-label">电话：</label>
							<div class="col-sm-9">
								<input type="text" id="phone" class="form-control" name="phone" value="${user.phone}" placeholder="请输入电话">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">密码：</label>
							<div class="col-sm-9">
								<input type="password" id="password" class="form-control" name="password" value="${user.password}" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="repassword" class="col-sm-3 control-label">确认密码：</label>
							<div class="col-sm-9">
								<input type="password" id="repassword" class="form-control" name="repassword" placeholder="请再次输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="role" class="col-sm-3 control-label">角色：</label>
							<div class="col-sm-9">
								<select id="role" class="form-control" name="grade" disabled="true">
									<c:if test="${user.grade==1}">
										<option>超级管理员</option>
									</c:if>
									<c:if test="${user.grade==2}">
										<option>普通管理员</option>
									</c:if>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div id="butt" class="col-sm-offset-2 col-sm-10">
								<button id="cancel" class="btn btn-default">取消</button>
								<button type="submit" id="submit" class="btn btn-primary"">提交</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
</section>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
	<div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
			</div>
			<div class="modal-body" style="text-align:center"> <img src="/blog/pages/images/weixin.jpg" alt="" style="cursor:pointer"/></div>
		</div>
	</div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
			</div>
			<div class="modal-body"> <img src="/blog/pages/images/baoman/baoman_01.gif" alt="深思熟虑" />
				<p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
			</div>
		</div>
	</div>
</div>
<script src="/blog/pages/js/bootstrap.min.js"></script>
<script src="/blog/pages/js/admin-scripts.js"></script>
<script type="text/javascript">
//表单验证
var flag = 1;
$("#submit").click(function(){
	if($("#username").val() == ""){
		flag = 0;
		alert("用户名不能为空！");
	}else if($("#password").val() == ""){
		flag = 0;
		alert("密码不能为空！");
	}else if($("#password").val() != "${user.password}"){
		if($("#password").val() != $("#repassword").val()){
			flag = 0;
			alert("两次密码不一致！");
		}else{
			flag = 1;
		}
	}else{
		flag = 1;
	}
});
//ajax异步登陆请求
$("#submit").click(function(){
	if(flag == 1){
		$.post("/blog/updUser",{id:"${user.id}",name:$("#name").val(),userName:$("#username").val(),phone:$("#phone").val(),password:$("#password").val(),grade:"${user.grade}"},function(data){
			if(data == 1){
				alert("修改成功！");
			}else if(data == 2){
				alert("修改成功,需重新登陆！");
				window.location="/blog/admin?data="+data;
			}else if(data == -1){
				alert("权限不足！");
			}else{
				alert("未知错误！"+data);
			}
		});
	}
	return false;
});
</script>
</body>
</html>