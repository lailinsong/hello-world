package com.myxdxy.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myxdxy.mapper.SetMapper;
import com.myxdxy.pojo.BSet;
import com.myxdxy.service.SetService;

@Service
public class SetServiceImpl implements SetService {
	
	//获取设置事务类对象
	@Resource
	private SetMapper setMapper;
	
	/**
	 * 修改基本设置
	 */
	@Override
	public int updBSet(BSet bSet) {
		return setMapper.updBSet(bSet);
	}
	/**
	 * 查询基本设置
	 */
	@Override
	public BSet selBSet() {
		return setMapper.selBSet();
	}

}
