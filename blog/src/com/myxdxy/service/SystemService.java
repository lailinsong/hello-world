package com.myxdxy.service;

import java.util.Map;

/**
 * 系统业务接口类
 * @author 赖林松
 *
 */
public interface SystemService {
	/**
	 * 返回系统信息
	 * @return
	 */
	Map<String,Object> systemInfo(int id);
}
