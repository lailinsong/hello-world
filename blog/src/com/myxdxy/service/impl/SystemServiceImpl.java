package com.myxdxy.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myxdxy.mapper.ArticleMapper;
import com.myxdxy.mapper.UserMapper;
import com.myxdxy.service.SystemService;

/**
 * 系统业务实现类
 * @author 赖林松
 */
@Service
public class SystemServiceImpl implements SystemService {
	
	//获取文章事务类对象
	@Resource
	private ArticleMapper articleMapper;
	//获取用户事务类对象
	@Resource
	private UserMapper userMapper;
	
	/**
	 * 返回系统信息
	 */
	@Override
	public Map<String, Object> systemInfo(int id) {
		Map<String,Object> map = new HashMap<>();
		map.put("articleCount", articleMapper.selCount());
		map.put("loginTimes", userMapper.selLoginLogCountById(id));
		map.put("adminCount", userMapper.selUserCount());
		return map;
	}
	
	
}
