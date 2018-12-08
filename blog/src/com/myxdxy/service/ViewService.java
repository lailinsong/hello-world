package com.myxdxy.service;

import java.util.List;
import java.util.Map;

import com.myxdxy.pojo.Article;

/**
 * 前台视图业务接口类
 * @author 赖林松
 *
 */
public interface ViewService {
	/**
	 * 分页查询文章
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	Map<String,Object> selByPage(int pageSize,int pageNumber);
	/**
	 * 用 id 查询文章
	 * @param id
	 * @return
	 */
	Article selById(String id);
	/**
	 * 查询文章总条数
	 * @return
	 */
	int selArticleCount();
	/**
	 * 修改文章浏览次数
	 * @param id
	 * @param count
	 * @return
	 */
	int updBrowseCount(int id);
	/**
	 * 查找页面底部列表
	 * @return
	 */
	Map<String,Object> selFooter();
	/**
	 * 查找全部文章
	 * @return
	 */
	List<Article> selAllArticle();
}
