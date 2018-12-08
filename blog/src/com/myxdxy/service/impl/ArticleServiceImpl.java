package com.myxdxy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myxdxy.mapper.ArticleMapper;
import com.myxdxy.pojo.Article;
import com.myxdxy.pojo.PageInfo;
import com.myxdxy.service.ArticleService;

/**
 * 文章业务实现类
 * @author 赖林松
 *
 */
@Service
public class ArticleServiceImpl implements ArticleService {
	
	//获取文章事务类对象
	@Resource
	private ArticleMapper articleMapper;
	//分页实体类对象
	@Resource
	private PageInfo pageInfo;
	
	/**
	 * 添加文章
	 */
	@Override
	public int insArticle(String title, String content, String keywords, String tags, String titlepic,String visibility, String time,int uid) {
		return articleMapper.insArticle(title, content, keywords, tags, titlepic, visibility, time, uid);
	}
	/**
	 * 查询全部文章
	 */
	@Override
	public List<Article> selAll() {
		return articleMapper.selAll();
	}
	/**
	 * 用 id 查询文章
	 */
	@Override
	public Article selById(String id) {
		return articleMapper.selById(id);
	}
	/**
	 * 修改文章
	 */
	@Override
	public int updArticle(String id, String title, String content, String keywords, String tags, String titlepic,String visibility, String time) {
		return articleMapper.updArticle(id, title, content, keywords, tags, titlepic, visibility, time);
	}
	/**
	 * 用 id 删除文章
	 */
	@Override
	public int delArticle(List<String> id) {
		int index = 0;
		for(String aid : id) {
			index += articleMapper.delArticle(aid);
		}
		return index;
	}
	/**
	 * 分页显示文章
	 */
	@Override
	public PageInfo showPage(int pageSize, int pageNumber) {
		pageInfo.setPageSize(pageSize);
		pageInfo.setPageNumber(pageNumber);
		long count = articleMapper.selCount();
		pageInfo.setTatol(count%pageSize==0?count/pageSize:count/pageSize+1);
		Map<String,Object> map = new HashMap<>();
		map.put("pageStart", pageSize*(pageNumber-1));
		map.put("pageSize", pageSize);
		pageInfo.setList(articleMapper.selByPage(map));
		return pageInfo;
	}

}
