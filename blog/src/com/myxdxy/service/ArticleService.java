package com.myxdxy.service;

import java.util.List;

import com.myxdxy.pojo.Article;
import com.myxdxy.pojo.PageInfo;

/**
 * 文章业务接口类
 * @author 赖林松
 *
 */
public interface ArticleService {
	/**
	 * 添加文章
	 * @param title
	 * @param content
	 * @param keywords
	 * @param tags
	 * @param titlepic
	 * @param visibility
	 * @param time
	 * @return
	 */
	int insArticle(String title,String content,String keywords,String tags,String titlepic,String visibility,String time,int uid);
	/**
	 * 查询全部文章
	 * @return
	 */
	List<Article> selAll();
	/**
	 * 用 id 查询文章
	 * @param id
	 * @return
	 */
	Article selById(String id);
	/**
	 * 修改文章
	 * @param id
	 * @param title
	 * @param content
	 * @param keywords
	 * @param tags
	 * @param titlepic
	 * @param visibility
	 * @param time
	 * @return
	 */
	int updArticle(String id,String title,String content,String keywords,String tags,String titlepic,String visibility,String time);
	/**
	 * 用 id 删除文章
	 * @param id
	 * @return
	 */
	int delArticle(List<String> id);
	/**
	 * 分页显示文章
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	PageInfo showPage(int pageSize,int pageNumber);
}
