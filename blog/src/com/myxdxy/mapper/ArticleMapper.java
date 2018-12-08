package com.myxdxy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.myxdxy.pojo.Article;

/**
 * 文章事务接口类
 * @author 赖林松
 *
 */
public interface ArticleMapper {
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
	@Insert("insert into article values(default,#{0},#{1},#{2},#{3},#{4},#{5},#{6},#{7})")
	int insArticle(String title,String content,String keywords,String tags,String titlepic,String visibility,String time,int uid);
	/**
	 * 查询全部文章
	 * @return
	 */
	@Select("select * from article")
	List<Article> selAll();
	/**
	 * 用 id 查询文章
	 * @param id
	 * @return
	 */
	@Select("select * from article where id=#{0}")
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
	@Update("update article set title=#{1},content=#{2},keywords=#{3},tags=#{4},titlepic=#{5},visibility=#{6},time=#{7} where id=#{0}")
	int updArticle(String id,String title,String content,String keywords,String tags,String titlepic,String visibility,String time);
	/**
	 * 用 id 删除文章
	 * @param id
	 * @return
	 */
	@Delete("delete from article where id=#{0}")
	int delArticle(String id);
	/**
	 * 查询文章总条数
	 * @return
	 */
	@Select("select count(*) from article")
	long selCount();
	/**
	 * 分页查询文章
	 * @param map
	 * @return
	 */
	@Select("select * from article limit #{pageStart},#{pageSize}")
	List<Article> selByPage(Map<String, Object> map);
}













