<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>清轩博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/style.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/blog/pages/images/icon/icon.png">
	<link rel="shortcut icon" href="/blog/pages/images/icon/favicon.ico">
	<script src="/blog/pages/js/getDate.js"></script>
	<script src="/blog/pages/js/jquery-2.1.4.min.js"></script>
	<style type="text/css">
		table,h1{
			text-align: left;
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
				<li class="active">
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
				<li>
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
			<h1 class="page-header">信息总览</h1>
			<div class="row placeholders">
				<div class="col-xs-6 col-sm-3 placeholder">
					<h4>文章</h4>
					<span class="text-muted">${systemInfo.articleCount}条</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<h4>评论</h4>
					<span class="text-muted">633 条</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<h4>友链</h4>
					<span class="text-muted">4 条</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<h4>访问量</h4>
					<span class="text-muted">997</span>
				</div>
				<h1 class="page-header">状态</h1>
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<tbody>
							<tr>
								<td>登录者: <span>${user.userName}</span>，这是您第 <span>${systemInfo.loginTimes}</span> 次登录</td>
							</tr>
							<tr>
								<td>上次登录时间: ${user.loginTime} , 上次登录IP: ${user.loginIp}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h1 class="page-header">系统信息</h1>
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<thead>
							<tr></tr>
						</thead>
						<tbody>
							<tr>
								<td>管理员个数:</td>
								<td>${systemInfo.adminCount}人</td>
								<td>服务器软件:</td>
								<td>Apache/2.4.10 (Win32) OpenSSL/1.0.1i mod_fcgid/2.3.9</td>
							</tr>
							<tr>
								<td>浏览器:</td>
								<td>Chrome</td>
								<td>JSP版本:</td>
								<td>3.2.0</td>
							</tr>
							<tr>
								<td>操作系统:</td>
								<td>Windows 10</td>
								<td>JSP运行方式:</td>
								<td>JVM</td>
							</tr>
							<tr>
								<td>登录者IP:</td>
								<td>${ip}</td>
								<td>MYSQL版本:</td>
								<td>5.5.40</td>
							</tr>
							<tr>
								<td>程序版本:</td>
								<td class="version">SongBlog v 1.0 <font size="-6" color="#BBB">(20181001000000)</font></td>
								<td>上传文件:</td>
								<td>可以 <font size="-6" color="#BBB">(最大文件：2M ，表单：8M )</font></td>
							</tr>
							<tr>
								<td>程序编码:</td>
								<td>UTF-8</td>
								<td>当前时间:</td>
								<td id="time">2018-10-19 15:50:30</td>
							</tr>
						</tbody>
						<tfoot>
							<tr></tr>
						</tfoot>
					</table>
				</div>
				<footer>
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<tbody>
								<tr>
									<td><span style="display:inline-block; width:8em">版权所有</span> POWERED BY LLS ALL RIGHTS RESERVED</td>
								</tr>
							</tbody>
						</table>
					</div>
				</footer>
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
<script>
setInterval(function(){
	$("#time").html(getDate());
},10);
</script>
</body>
</html>