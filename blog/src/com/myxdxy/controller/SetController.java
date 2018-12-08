package com.myxdxy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myxdxy.pojo.BSet;
import com.myxdxy.service.SetService;

/**
 * 设置控制器
 * @author 赖林松
 *
 */
@Controller
public class SetController {
	
	//获取设置业务类对象
	@Resource
	private SetService setService;
	
	/**
	 * 查询基本设置
	 * @param req
	 * @return
	 */
	@RequestMapping("/selBSet")
	public String selBSet(HttpServletRequest req) {
		BSet bSet = setService.selBSet();
		req.setAttribute("bSet", bSet);
		return "pages/admin/setting.jsp";
	}
	/**
	 * 修改基本设置
	 * @param resp
	 * @param bSet
	 * @throws IOException
	 */
	@RequestMapping("/updBSet")
	public void updBSet(HttpServletResponse resp,BSet bSet) throws IOException {
		PrintWriter pw = resp.getWriter();
		int index = setService.updBSet(bSet);
		if(index == 1) {
			pw.write("1");
		}else {
			pw.write("0");
		}
		pw.flush();
		pw.close();
	}
}
