<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <title>博客-首页</title>
 	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  	<link href="/blog/pages/css/style-liberxue.css" rel="stylesheet">
  	<script src="/blog/js/jquery-2.1.4.min.js"></script>
  	<script src="/blog/js/subString.js"></script>
  	<style type="text/css">
  		.footer{
  			padding-bottom: 20px;
  		}
  	</style>
</head>
<body class="bg-grey" gtools_scp_screen_capture_injected="true"><div id="MathJax_Message" style="display: none;"></div>
<header id="header" class="header bg-white">
    <div class="navbar-container">
        <a href="/blog/index.html" title="博客首页" class="navbar-logo">
      		<img src="/blog/pages/images/logo-liberxue.png" alt="博客首页">
        </a>
        <div class="navbar-menu">       
        	<a href="/blog/index.html" title="访问 首页" data-hover="首页">首页</a>
            <a href="/blog/guidang.html"" title="访问 归档" data-hover="归档">归档</a>
            <a href="" title="访问 标签" data-hover="标签">标签</a>
            <a href="" title="访问 关于" data-hover="关于">关于</a>
        </div>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form method="post" action="" role="search">
                <span class="search-box">
         			<input class="input" id="cb-search-content" required="true" placeholder="标题 标签..." maxlength="30" autocomplete="off" type="text">
                </span>
            </form>
        </div>
        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
            <ul>
                <li><a href="/blog/index.html" title="访问 首页" data-hover="首页">首页</a></li>
                <li><a href="/blog/guidang.html" title="访问 归档" data-hover="归档">归档</a></li>
                <li><a href="" title="访问 标签" data-hover="标签">标签</a></li>
                <li><a href="" title="访问 关于" data-hover="关于">关于</a></li>
            </ul>
        </div>
    </div>
</header>
<main class="tl f6 relative pa4 pa5-ns overflow-hidden">
    <div class="markdown-body">
        <div class="main-content index-page clearfix ">
			<div class="post-lists">
				<div class="post-lists-body">
				
					<c:forEach items="${listArticle.list}" var="article">
						<div class="post-list-item">
						<div class="post-list-item-container">
							<div class="item-thumb  bg-" style="background-image:url(${article.titlepic});">
							</div>
          					<a href="/blog/content.html?id=${article.id}">
		             			<div class="item-desc">
									<p>${article.title}</p>
								</div>
							</a>
							<div class="item-slant reverse-slant  bg-"></div>
							<div class="item-slant">
								<div class="liberxue-title">原创</div>
							</div>
							<div class="item-label">
								<div class="item-title">
									<a href="/blog/content.html?id=${article.id}" title="${article.title}">${article.title}</a>
								</div>
								<div class="item-meta clearfix">
									<div class="item-meta-ico bg-ico-book" style="background: url('style/images/bg-ico.png') no-repeat;background-size: 40px auto;">
									</div>
             						<div class="item-meta-cat">
				 						<a id="class" href="/blog/tags.html" title="访问 ${article.tags}" data-hover="${article.tags}">${article.tags}</a>
				 						<a title="时间 ${article.time}" data-hover="${article.time}">${article.time}</a>
				 					</div>
								</div>
							</div>
						</div>
      				</div>
					</c:forEach>
					
				</div>
			</div>
	  		<!-- 分页链接 -->
	        <div class="lists-navigator clearfix">   
	         	<ol class="page-navigator">
	        		<li <c:if test="${listArticle.pageNumber!=1}"> class="current" </c:if> >
	            		<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=1" data-hover="首页">
	                		<span>首页</span>
	            		</a>
	        		</li>
	        		<li <c:if test="${listArticle.pageNumber>1}"> class="current" </c:if> >
						<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${listArticle.pageNumber-1}" data-hover="«" <c:if test="${listArticle.pageNumber<=1}"> onclick="javascript:return false;" </c:if> > <span>«</span> </a>
					</li>
	        		<c:if test="${listArticle.tatol<=5}">
						<c:forEach var="i" begin="1" end="${listArticle.tatol}">
							<li <c:if test="${i==listArticle.pageNumber}"> class="current" </c:if> >
								<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${i}"  data-hover="${i}">${i}</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${listArticle.pageNumber<5 and listArticle.tatol>5}">
						<c:forEach var="i" begin="1" end="5">
							<li <c:if test="${i==listArticle.pageNumber}"> class="current" </c:if> >
								<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${i}" data-hover="${i}">${i}</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${(listArticle.pageNumber>=5) and (listArticle.pageNumber!=listArticle.tatol)}">
						<c:forEach var="i" begin="${listArticle.pageNumber-3}" end="${listArticle.pageNumber+1}">
							<li <c:if test="${i==listArticle.pageNumber}"> class="current" </c:if> >
								<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${i}" data-hover="${i}">${i}</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${(listArticle.pageNumber>=5) and (listArticle.pageNumber==listArticle.tatol)}">
						<c:forEach var="i" begin="${listArticle.pageNumber-4}" end="${listArticle.pageNumber}">
							<li <c:if test="${i==listArticle.pageNumber}"> class="current" </c:if> >
								<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${i}" data-hover="${i}">${i}</a>
							</li>
						</c:forEach>
					</c:if>
					<li <c:if test="${listArticle.pageNumber<listArticle.tatol}"> class="current" </c:if> >
						<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${listArticle.pageNumber+1}"  data-hover="»" <c:if test="${listArticle.pageNumber>=listArticle.tatol}"> onclick="javascript:return false;" </c:if> > <span>»</span> </a>
					</li>
	        		<li <c:if test="${listArticle.pageNumber!=listArticle.tatol}"> class="current" </c:if> >
	            		<a href="/blog/index.html?pageSize=${listArticle.pageSize}&pageNumber=${listArticle.tatol}" data-hover="末页">
	                		<span>末页</span>
	            		</a>
	        		</li>
	        		<li class="current">
	            		<span>第${listArticle.pageNumber}页 / 共${listArticle.tatol}页</span>
	      			</li>
	      		</ol> 
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
                    <a href="/blog/index.html" class="info-logo">
                         <img src="/blog/pages/images/logo-liberxue.png" title="访问 song_blog" data-hover="song_blog" alt="song_blog"> </a>
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
</body>
</html>