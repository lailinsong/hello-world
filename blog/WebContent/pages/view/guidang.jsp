<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>博客-归档</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<link rel="icon" type="image/png" href="http://www.liberxue.com/style/favicons/favicon.ico">
	<link href="http://www.liberxue.com/style/favicons/favicon.ico" rel="shortcut icon" type="image/png">
	<link rel="shortcut icon" href="http://www.liberxue.com/style/favicons/favicon.ico" type="image/x-icon">
	<link href="/blog/pages/css/style-liberxue.css" rel="stylesheet">
	<script src="/blog/js/jquery-2.1.4.min.js"></script>
	<style type="text/css">
  		#post-content pre{
  			background: #3C3C3C;padding: 10px;color: #fff;
  		}
  		.footer{
  			padding-bottom: 20px;
  		}
  	</style>
</head>
<body class="bg-grey" gtools_scp_screen_capture_injected="true">
<div id="MathJax_Message" style="display: none;"></div>
<header id="header" class="header bg-white">
	<div class="navbar-container">
		<a href="/blog/index.html" title="博客首页" class="navbar-logo">
			<img src="/blog/pages/images/logo-liberxue.png" alt="logo"/>
		</a>
		<div class="navbar-menu">
			<a href="/blog/index.html" data-hover="首页">首页</a>
			<a href="" data-hover="归档">归档</a>
			<a href="" data-hover="标签">标签</a>
			<a href="" data-hover="关于">关于</a>
		</div>
		<div class="navbar-search" onclick="">
			<span class="icon-search"></span>
			<form id="cb-search-btn" role="search">
				<span class="search-box">
					<input class="input" id="cb-search-content" required="true" placeholder="标题 标签..." maxlength="30" autocomplete="off" type="text">
				</span>
			</form>
		</div>
		<div class="navbar-mobile-menu" onclick="">
			<span class="icon-menu cross"><span class="middle"></span></span>
			<ul>
				<li><a href="/blog/index.html" data-hover="首页">首页</a></li>
				<li><a href="">归档</a></li>
				<li><a href="">标签</a></li>
				<li><a href="">关于</a></li>
			</ul>
		</div>
	</div>
</header>
<main class="tl f6 relative pa4 pa5-ns overflow-hidden">
	<div class="markdown-body">
		<div class="main-content archive-page clearfix">
			<div class="categorys-item">
				<div class="categorys-title" id="2017">
					2018
				</div>
				<div class="post-lists">
					<div class="post-lists-body">
						<c:forEach items="${listArticle}" var="article">
							<div class="post-list-item">
								<div class="post-list-item-container">
									<div class="liberxue-title class">
										
									</div>
									<div class="item-label">
										<div class="item-title">
											<a href="/blog/content.html?id=${article.id}" title="访问 ${article.title}">${article.title}</a>
										</div>
										<div class="item-meta clearfix">
											<div class="item-meta-date">
												${article.time} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="class" href="/blog/tags.html" data-hover="protobuf"></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<footer class="footer bg-white">
	<div class="footer-social">
		<div class="footer-container clearfix">
			<div class="social-list">
				<a class="social github" target="blank" href="https://www.bootcdn.cn/" title="访问 bootcdn" data-hover="bootcdn">bootcdn</a>
    			<a class="social twitter" target="blank" href="http://www.runoob.com/" title="访问 runoob" data-hover="runoob">runoob</a>
    			<a class="social stackoverflow" target="blank" href="http://www.w3school.com.cn/" title="访问 w3school" data-hover="w3school">w3school</a>
    			<a class="social rss" target="blank" href="http://www.iconfont.cn/" title="访问 iconfont" data-hover="iconfont">iconfont</a>
			</div>
		</div>
	</div>
	<div class="footer-meta">
		<div class="footer-container">
			<div class="meta-item meta-copyright">
				<div class="meta-copyright-info">
					<a href="" class="info-logo">
						<img src="" alt="LiberXue_blog">
					</a>
					<div class="info-text">
						<p>这是我的<a href="/blog/index.html" title="访问 博客首页" data-hover="个人博客" target="_blank">个人博客</a>，分享一些学习心得</p>
                        <p>Powered by <a href="" title="Jeky" data-hover="Jeky" target="_blank" rel="nofollow">Jeky</a></p>
                        <p>© 2018 <a href="/blog/index.html" title="访问 博客首页" data-hover="song blog">song blog</a></p>
						<p>总计文章：${articleCount}篇</p>
					</div>
				</div>
			</div>
			<div class="meta-item meta-posts">
				<h3 class="meta-title">置顶文章</h3>
				<c:forEach items="${hotArticle}" var="article">
					<li>
						<a href="/blog/content.html?id=${article.id}" title="访问 ${article.title}" data-hover="${article.title}">${article.title}</a>
					</li>
				</c:forEach>
			</div>
			<div class="meta-item meta-comments">
				<h3 class="meta-title">最新文章</h3>
				<c:forEach items="${newArticle}" var="article">
					<li>
						<a href="/blog/content.html?id=${article.id}" title="访问 ${article.title}" data-hover="${article.title}">${article.title}</a>
					</li>
				</c:forEach>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript">
var tags = "${article.tags}";
var tag = tags.split(",");
/* $("#class").attr("title","访问 "+tag[0]);
$("#class").attr("data-hover","博客分类:"+tag[0]); */
$(".class").html(tag[0]);
</script>
</body>
</html>