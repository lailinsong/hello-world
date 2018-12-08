package com.myxdxy.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.myxdxy.pojo.BSet;

/**
 * 设置事务接口类
 * @author 赖林松
 *
 */
public interface SetMapper {
	/**
	 * 修改基本设置
	 * @param bSet
	 * @return
	 */
	@Update("update bset set title=#{title},subtitle=#{subTitle},keywords=#{keywords},"
			+ "description=#{description},mail=#{mail},icp=#{icp},timeout=#{timeOut} where id=#{id}")
	int updBSet(BSet bSet);
	/**
	 * 查看基本设置
	 * @return
	 */
	@Select("select * from bset")
	BSet selBSet();
}
