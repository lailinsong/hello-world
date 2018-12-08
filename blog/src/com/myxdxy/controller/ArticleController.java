package com.myxdxy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myxdxy.pojo.Article;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.service.ArticleService;

/**
 * 文章控制器类
 * @author 赖林松
 *
 */
@Controller
public class ArticleController {
	
	//获取文章业务类对象
	@Resource
	private ArticleService articleService;
	
	/**
	 * 加载添加文章页
	 * @return
	 */
	@RequestMapping("/addarticle")
	public String loadAddArticle() {
		return "/pages/admin/add-article.jsp";
	}
	/**
	 * 添加文章
	 * @param title
	 * @param keywords
	 * @param tags
	 * @param titlepic
	 * @param visibility
	 * @param time
	 * @throws IOException 
	 */
	@RequestMapping("/addArticle")
	public void addArticle(HttpServletResponse resp,String title,String content,String keywords,String tags,String titlepic,String visibility,String time,int uid) throws IOException {
		PrintWriter pw = resp.getWriter();
		int index = articleService.insArticle(title, content, keywords, tags, titlepic, visibility, time, uid);
		if(index == 1) {
			pw.write("1");
		}else {
			pw.write("0");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 查询全部文章
	 * @param req
	 * @return
	 */
	@RequestMapping("/selAllArticle")
	public String selAll(HttpServletRequest req) {
		List<Article> listArticle = articleService.selAll();
		req.setAttribute("listArticle", listArticle);
		return "/pages/admin/article.jsp";
	}
	/**
	 * 用 id 查询文章
	 * @param id
	 * @return
	 */
	@RequestMapping("/selById")
	public String selById(HttpServletRequest req,String id) {
		Article article = articleService.selById(id);
		req.setAttribute("article", article);
		return "/pages/admin/update-article.jsp";
	}
	/**
	 * 修改文章
	 * @param resp
	 * @param id
	 * @param title
	 * @param content
	 * @param keywords
	 * @param tags
	 * @param titlepic
	 * @param visibility
	 * @param time
	 * @throws IOException
	 */
	@RequestMapping("/updArticle")
	public void updArticle(HttpServletResponse resp,String id, String title, String content, String keywords, String tags, String titlepic,String visibility, String time) throws IOException {
		PrintWriter pw = resp.getWriter();
		int index = articleService.updArticle(id, title, content, keywords, tags, titlepic, visibility, time);
		if(index == 1) {
			pw.write("1");
		}else {
			pw.write("0");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 用 id 删除文章
	 * @param resp
	 * @param id
	 * @throws IOException
	 */
	@RequestMapping("/delArticle")
	public void delArticle(HttpServletResponse resp,@RequestParam("id")List<String> id) throws IOException {
		PrintWriter pw = resp.getWriter();
		int index = articleService.delArticle(id);
		if(index == id.size()) {
			pw.write("1");
		}else {
			pw.write("0");
		}
		pw.flush();
		pw.close();
	}
	/**
	 * 分页显示文章
	 * @param req
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/showPage")
	public String showPage(HttpServletRequest req,@RequestParam(defaultValue="15")String pageSize,@RequestParam(defaultValue="1")String pageNumber) {
		PageInfo pageInfo = articleService.showPage(Integer.parseInt(pageSize), Integer.parseInt(pageNumber));
		req.setAttribute("showPage", pageInfo);
		return "/pages/admin/article.jsp";
	}
}
