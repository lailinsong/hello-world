package com.myxdxy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myxdxy.service.ViewService;

/**
 * 前台视图控制器
 * @author 赖林松
 *
 */
@Controller
public class ViewController {
	
	//获取文章业务类对象
	@Resource
	private ViewService viewService;
	
	/**
	 * 分页显示文章
	 * @param req
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/index.html")
	public String selByPage(HttpServletRequest req,@RequestParam(defaultValue="15")String pageSize,@RequestParam(defaultValue="1")String pageNumber) {
		Map<String,Object> map = new HashMap<>();
		map = viewService.selByPage(Integer.parseInt(pageSize), Integer.parseInt(pageNumber));
		req.setAttribute("listArticle", map.get("pageInfo"));
		req.setAttribute("articleCount", map.get("articleCount"));
		req.setAttribute("hotArticle", viewService.selFooter().get("hotArticle"));
		req.setAttribute("newArticle", viewService.selFooter().get("newArticle"));
		return "/pages/view/index.jsp";
	}
	/**
	 * 用 id 查询文章
	 * @param req
	 * @param id
	 * @return
	 */
	@RequestMapping("/content.html")
	public String selById(HttpServletRequest req,String id) {
		viewService.updBrowseCount(Integer.parseInt(id));
		req.setAttribute("article", viewService.selById(id));
		req.setAttribute("articleCount", viewService.selArticleCount());
		req.setAttribute("hotArticle", viewService.selFooter().get("hotArticle"));
		req.setAttribute("newArticle", viewService.selFooter().get("newArticle"));
		return "/pages/view/content.jsp";
	}
	/**
	 * 查询全部文章
	 * @param req
	 * @return
	 */
	@RequestMapping("/guidang.html")
	public String selAll(HttpServletRequest req) {
		req.setAttribute("listArticle", viewService.selAllArticle());
		req.setAttribute("articleCount", viewService.selArticleCount());
		req.setAttribute("hotArticle", viewService.selFooter().get("hotArticle"));
		req.setAttribute("newArticle", viewService.selFooter().get("newArticle"));
		return "/pages/view/guidang.jsp";
	}
}
