package com.myxdxy.pojo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
/**
 * 得到 ip 地址
 * @author 赖林松
 *
 */
@Component
public class GetIpAddress {
		// 返回用IP地址
		public String getIpAddr(HttpServletRequest request) {
			String ip = request.getHeader(" x-forwarded-for ");
			if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
				ip = request.getHeader(" Proxy-Client-IP ");
			}
			if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
				ip = request.getHeader(" WL-Proxy-Client-IP ");
			}
			if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}
			return ip;
		}
}
