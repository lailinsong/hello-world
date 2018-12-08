<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>文章修改 - 清轩博客管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/style.css">
	<link rel="stylesheet" type="text/css" href="/blog/pages/css/font-awesome.min.css">
	<link rel="apple-touch-icon-precomposed" href="/blog/pages/images/icon/icon.png">
	<link rel="shortcut icon" href="/blog/pages/images/icon/favicon.ico">
	<script src="/blog/pages/js/getDate.js"></script>
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
			<div class="row">
				<form action="/blog/add" method="post" class="add-article-form">
					<div class="col-md-9">
						<div class="form-group">
							<label for="article-title" class="sr-only">标题</label>
							<input type="text" id="article-title" name="title" class="form-control" value="${article.title}" placeholder="在此处输入标题" required autofocus autocomplete="off">
						</div>
						<div class="form-group">
							<label for="article-content" class="sr-only">内容</label>
							<script id="article-content" type="text/plain"></script>
						</div>
					</div>
					<div class="col-md-3">
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>关键字</span></h2>
							<div class="add-article-box-content">
								<input type="text" id="keywords" class="form-control" value="${article.keywords}" placeholder="输入新关键字" name="keywords" autocomplete="off">
								<span class="prompt-text">多个关键字请用英文逗号,隔开</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>标签</span></h2>
							<div class="add-article-box-content">
								<input type="text" id="tags" class="form-control" value="${article.tags}" placeholder="输入新标签" name="tags" autocomplete="off">
								<span class="prompt-text">多个标签请用英文逗号,隔开</span>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>标题图片</span></h2>
							<div class="add-article-box-content">
								<input type="text" class="form-control" value="${article.titlepic}" placeholder="点击按钮选择图片" id="pictureUpload" name="titlepic" autocomplete="off">
							</div>
							<div class="add-article-box-footer">
								<button class="btn btn-default" type="button" ID="upImage">选择</button>
							</div>
						</div>
						<div class="add-article-box">
							<h2 class="add-article-box-title"><span>发布</span></h2>
							<div class="add-article-box-content">
								<p><label>状态：</label><span class="article-status-display">未发布</span></p>
								<p><label>公开度：</label><input type="radio" id="visibility1" name="visibility" value="0"/>公开 <input type="radio" id="visibility2" name="visibility" value="1" />加密</p>
								<p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime" id="time" name="time" value="${article.time}" /></span></p>
							</div>
							<div class="add-article-box-footer">
								<button class="btn btn-primary" id="submit" type="submit" name="submit">修改</button>
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
<script src="/blog/pages/lib/ueditor/ueditor.config.js"></script>
<script src="/blog/pages/lib/ueditor/ueditor.all.min.js"> </script>
<script src="/blog/pages/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<script id="uploadEditor" type="text/plain" style="display:none;"></script>
<script type="text/javascript">
var editor = UE.getEditor('article-content');
window.onresize=function(){
    window.location.reload();
}
var _uploadEditor;
$(function () {
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    _uploadEditor = UE.getEditor('uploadEditor');
    _uploadEditor.ready(function () {
        //设置编辑器不可用
        //_uploadEditor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _uploadEditor.hide();
        //侦听图片上传
        _uploadEditor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input,只去第一张图片的路径
            $("#pictureUpload").attr("value", arg[0].src);
            //图片预览
            //$("#imgPreview").attr("src", arg[0].src);
        })
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _uploadEditor.addListener('afterUpfile', function (t, arg) {
            $("#fileUpload").attr("value", _uploadEditor.options.filePath + arg[0].url);
        })
    });
});
//弹出图片上传的对话框
$('#upImage').click(function () {
    var myImage = _uploadEditor.getDialog("insertimage");
    myImage.open();
});
//弹出文件上传的对话框
function upFiles() {
    var myFiles = _uploadEditor.getDialog("attachment");
    myFiles.open();
}
//判断文本内容是否为空
var flag = 1;
$("#submit").click(function(){
	if($("#article-title").val() === ""){
		flag = 0;
		alert("文章标题不能为空！");
	}else if(editor.getContentTxt() === ""){
		flag = 0;
		alert("文章内容不能为空！")
	}else{
		flag = 1;
	}
});
//清空内容
function clear(id){
	$("#"+id).val("");
}
//ajax异步上传
$("#submit").click(function(){
	if(flag == 1){
		$.post("/blog/updArticle",
				{id:${article.id},
				title:$("#article-title").val(),
				content:editor.getContent(),
				keywords:$("#keywords").val(),
				tags:$("#tags").val(),
				titlepic:$("#pictureUpload").val(),
				visibility:$('input:radio[name="visibility"]:checked').val(),
				time:$("#time").val()},
				function(data){
					if(data == 1){
						alert("修改成功！");
					}else{
						alert("未知错误！");
					}
				});
	}
	return false;
});
//填充安全状态
if(${article.visibility} == 0){
	$("#visibility1").attr("checked","true");
}else{
	$("#visibility2").attr("checked","true");
}
</script>
</body>
</html>