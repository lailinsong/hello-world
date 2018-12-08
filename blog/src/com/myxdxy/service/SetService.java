package com.myxdxy.service;

import com.myxdxy.pojo.BSet;
/**
 * 设置业务接口类
 * @author 赖林松
 *
 */
public interface SetService {
	/**
	 * 修改基本设置
	 * @param bSet
	 * @return
	 */
	int updBSet(BSet bSet);
	/**
	 * 查询基本设置
	 * @return
	 */
	BSet selBSet();
}
