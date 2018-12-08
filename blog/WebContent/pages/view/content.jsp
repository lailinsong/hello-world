<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>详情页</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<body class="" gtools_scp_screen_capture_injected="true">
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
                <li><a href="" data-hover="归档">归档</a></li>
                <li><a href="" data-hover="标签">标签</a></li>
                <li><a href="" data-hover="关于">关于</a></li>
			</ul>
		</div>
	</div>
</header>
<div class="post-header-thumb bg-white}">
	<div class="post-header-thumb-op"></div>
	<div class="post-header-thumb">
		<div class="post-header-thumb-container">
			<!-- 标题信息 -->
			<h1 class="post-title" itemprop="name headline">${article.title}</h1>
			<div class="post-data">
				<time datetime="${article.time}" itemprop="datePublished">发布时间:${article.time}</time>
				<a href="" id="class" title="" data-hover=""></a><a href="javascript:void()">阅读次数:${article.browse}</a>
			</div>
			<!-- 标签 -->
			<div class="post-tags"></div>
		</div>
	</div>
</div>
<article class="main-content post-page" itemscope="" itemtype="http://schema.org/Article">
	<div class="post-header">
		<h1 class="post-title" itemprop="name headline">${article.title}</h1>
		<div class="post-data">
			<time datetime="${article.time}" itemprop="datePublished">${article.time}</time>
		</div>
	</div>
	<div id="post-content" class="post-content" itemprop="articleBody">
		<p class="post-tags"></p>
		${article.content}
		<p class="post-info">本文由 <a href="/blog">lls</a> 创作，采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>最后编辑时间为:${article.time}</p>
	</div>
</article>
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
					<a href="/blog/index.html" class="info-logo">
						<img src="/blog/pages/images/logo-liberxue.png" alt="logo">
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
<script>
var tags = "${article.tags}";
var tag = tags.split(",");
$("#class").attr("title","访问 "+tag[0]);
$("#class").attr("data-hover","博客分类:"+tag[0]);
$("#class").html("博客分类:"+tag[0]);
for(var i=0; i<tag.length; i++){
	$(".post-tags").html($(".post-tags").html()+"<a href='/blog/tags.html' title='访问"+tag[i]+"' data-hover='"+tag[i]+"'>"+tag[i]+"</a>");
}
</script>
</body>
</html>