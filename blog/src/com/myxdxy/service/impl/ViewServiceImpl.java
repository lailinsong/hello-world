package com.myxdxy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myxdxy.mapper.ArticleMapper;
import com.myxdxy.mapper.ViewMapper;
import com.myxdxy.pojo.Article;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.service.ViewService;

/**
 * 前台视图业务实现类
 * @author 赖林松
 *
 */
@Service
public class ViewServiceImpl implements ViewService {
	
	//获取文章事务类对象
	@Resource
	private ArticleMapper articleMapper;
	//获取前端视图事务类对象
	@Resource
	private ViewMapper viewMapper;
	//获取文章实体类对象
	@Resource
	private PageInfo pageInfo;
	
	/**
	 * 分页显示文章
	 */
	@Override
	public Map<String,Object> selByPage(int pageSize, int pageNumber) {
		Map<String,Object> mp = new HashMap<>();
		pageInfo.setPageSize(pageSize);
		pageInfo.setPageNumber(pageNumber);
		long count = articleMapper.selCount();
		pageInfo.setTatol(count%pageSize==0?count/pageSize:count/pageSize+1);
		Map<String,Object> map = new HashMap<>();
		map.put("pageStart", pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		pageInfo.setList(articleMapper.selByPage(map));
		mp.put("pageInfo", pageInfo);
		mp.put("articleCount", articleMapper.selCount());
		return mp;
	}
	/**
	 * 用 id 查询文章
	 */
	@Override
	public Article selById(String id) {
		Article article = articleMapper.selById(id);
		return article;
	}
	/**
	 * 修改文章浏览次数
	 */
	@Override
	public int updBrowseCount(int id) {
		return viewMapper.uptBrowseCount(id);
	}
	/**
	 * 查询文章总条数
	 */
	@Override
	public int selArticleCount() {
		return (int) articleMapper.selCount();
	}
	/**
	 * 查找页面底部列表
	 */
	@Override
	public Map<String, Object> selFooter() {
		Map<String,Object> map = new HashMap<>();
		List<Article> hotArticle = new ArrayList<>();
		List<Article> newArticle = new ArrayList<>();
		List<Article> article = articleMapper.selAll();
		for(int i=0; i<6; i++) {
			hotArticle.add(i, article.get(i));
		}
		for(int j=article.size(); j>(article.size()-6); j--) {
			int i = 0;
			newArticle.add(i++, article.get(j-1));
		}
		map.put("hotArticle", hotArticle);
		map.put("newArticle", newArticle);
		return map;
	}
	/**
	 * 查询全部文章
	 */
	@Override
	public List<Article> selAllArticle() {
		return articleMapper.selAll();
	}
}
