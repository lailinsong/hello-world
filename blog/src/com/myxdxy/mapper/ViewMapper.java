package com.myxdxy.mapper;

import org.apache.ibatis.annotations.Update;

/**
 * 前端视图事务类
 * @author 赖林松
 *
 */
public interface ViewMapper {
	/**
	 * 修改文章浏览次数
	 * @param id
	 * @param count
	 * @return
	 */
	@Update("update article set browse=browse+1 where id=#{0}")
	int uptBrowseCount(int id);
}
