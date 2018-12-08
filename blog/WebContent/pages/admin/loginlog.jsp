<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录记录 - 清轩博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/style.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/blog/pages/images/icon/icon.png">
	<link rel="shortcut icon" href="/blog/pages/images/icon/favicon.ico">
	<script src="/blog/pages/js/jquery-2.1.4.min.js"></script>
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
				<li>
					<a href="/blog/userinfo">个人信息</a>
				</li>
				<li>
					<a href="/blog/adduser">添加用户</a>
				</li>
				<li>
					<a href="/blog/listUser">管理用户</a>
				</li>
				<li class="active">
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
			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">ID</span></th>
							<th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户</span></th>
							<th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">时间</span></th>
							<th><span class="glyphicon glyphicon-adjust"></span> <span class="visible-lg">IP</span></th>
							<th><span class="glyphicon glyphicon-remove"></span> <span class="visible-lg">删除</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${showPage.list}" var="log">
							<tr>
								<td>${log.id}</td>
								<td class="article-title">${log.userName}</td>
								<td>${log.loginTime}</td>
								<td>${log.loginIp}</td>
								<td><a href="javascript:void()" class="delLog" rel="${log.id}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<footer class="message_footer">
				<nav>
					<ul class="pagination pagenav">
						<li <c:if test="${showPage.pageNumber<=1}"> class="disabled" </c:if> >
							<a aria-label="Previous" href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${showPage.pageNumber-1}" <c:if test="${showPage.pageNumber<=1}"> onclick="javascript:return false;" </c:if> > <span aria-hidden="true">&laquo;</span> </a>
						</li>
						<c:if test="${showPage.tatol<=5}">
							<c:forEach var="i" begin="1" end="${showPage.tatol}">
								<li<c:if test="${i==showPage.pageNumber}"> class="active" </c:if> >
									<a href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${i}" >${i}</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${showPage.pageNumber<5 and showPage.tatol>5}">
							<c:forEach var="i" begin="1" end="5">
								<li<c:if test="${i==showPage.pageNumber}"> class="active" </c:if> >
									<a href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${i}" >${i}</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${(showPage.pageNumber>=5) and (showPage.pageNumber!=showPage.tatol)}">
							<c:forEach var="i" begin="${showPage.pageNumber-3}" end="${showPage.pageNumber+1}">
								<li<c:if test="${i==showPage.pageNumber}"> class="active" </c:if> >
									<a href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${i}" >${i}</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${(showPage.pageNumber>=5) and (showPage.pageNumber==showPage.tatol)}">
							<c:forEach var="i" begin="${showPage.pageNumber-4}" end="${showPage.pageNumber}">
								<li<c:if test="${i==showPage.pageNumber}"> class="active" </c:if> >
									<a href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${i}" >${i}</a>
								</li>
							</c:forEach>
						</c:if>
						<li <c:if test="${showPage.pageNumber>=showPage.tatol}"> class="disabled" </c:if> >
							<a aria-label="Next" href="/blog/selLogByPage?pageSize=${showPage.pageSize}&pageNumber=${showPage.pageNumber+1}" <c:if test="${showPage.pageNumber>=showPage.tatol}"> onclick="javascript:return false;" </c:if> > <span aria-hidden="true">&raquo;</span> </a>
						</li>
					</ul>
				</nav>
			</footer>
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
//是否确认删除
$(function(){
	$(".delLog").click(function(){
		if(window.confirm("此操作不可逆，是否确认？"))
		{
			$.ajax({
				type: "POST",
				url: "/blog/delLoginLog",
				data: "id=" + $(this).attr("rel"),
				cache: false, //不缓存此页面
				success: function (data) {
					if(data == 1){
						window.location.reload();
					}else if(data == -1){
						alert("权限不足！");
					}else{
						alert("未知错误！");
					}
				}
			});
		};
	});
});
</script>
</body>
</html>