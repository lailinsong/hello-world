<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>常规设置 - 清轩博客管理系统</title>
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
				<li>
					<a href="/blog/selLogByPage">登录日志</a>
				</li>
			</ul>
			<ul class="nav nav-sidebar">
				<li class="active">
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
			<div class="row">
				<form action="/blog/updBSet" method="post" autocomplete="off" draggable="false">
					<div class="col-md-9">
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>站点标题</span></h2>
							<div class="add-article-box-content">
								<input type="text" name="title" id="title" class="form-control" value="${bSet.title}" placeholder="请输入站点标题" required autofocus autocomplete="off">
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>副标题</span></h2>
							<div class="add-article-box-content">
								<input type="text" name="ftitle" id="subTitle" class="form-control" value="${bSet.subTitle}" placeholder="请输入站点副标题" autocomplete="off">
								<span class="prompt-text">用简洁的文字描述本站点。</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>站点关键字</span></h2>
							<div class="add-article-box-content">
								<textarea class="form-control" name="keywords" id="keywords" autocomplete="off">${bSet.keywords}</textarea>
								<span class="prompt-text">关键字会出现在网页的keywords属性中。</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>站点描述</span></h2>
							<div class="add-article-box-content">
								<textarea class="form-control" name="describe" id="description" rows="4" autocomplete="off">${bSet.description}</textarea>
								<span class="prompt-text">描述会出现在网页的description属性中。</span>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>电子邮件地址</span></h2>
							<div class="add-article-box-content">
								<input type="email" name="email" id="mail" class="form-control" value="${bSet.mail}" placeholder="在此处输入邮箱" autocomplete="off"/>
								<span class="prompt-text">这个电子邮件地址仅为了管理方便而填写</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>ICP备案号</span></h2>
							<div class="add-article-box-content">
								<input type="email" name="email" id="icp" class="form-control" value="${bSet.icp}" placeholder="在此处输入备案号" autocomplete="off"/>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>登录超时</span></h2>
							<div class="add-article-box-content">
								<input type="email" name="email" id="timeOut" class="form-control" value="${bSet.timeOut}" placeholder="在此处输入超时时间(s)" required autocomplete="off"/>
								<span class="prompt-text">单位(秒),超时将强制退出</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>保存</span></h2>
							<div class="add-article-box-content">
								<span class="prompt-text">请确定您对所有选项所做的更改</span>
							</div>
							<div class="add-article-box-footer">
								<button id="submit" class="btn btn-primary" type="submit" name="submit">更新</button>
							</div>
						</div>
					</div>
				</form>
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
//ajax异步登陆请求
$("#submit").click(function(){
	$.post("/blog/updBSet",{id:1,title:$("#title").val(),subTitle:$("#subTitle").val(),
		keywords:$("#keywords").val(),description:$("#description").val(),mail:$("#mail").val(),
		icp:$("#icp").val(),timeOut:$("#timeOut").val()},function(data){
		if(data == 1){
			alert("修改成功！");
		}else{
			alert("未知错误！");
		}
	});
	return false;
});
</script>
</body>
</html>