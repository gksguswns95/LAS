package com.evolve;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class IpGet {
	public String getUserIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null) {
			ip = request.getHeader("WL-Proxy-Client-ip");
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP") ;
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
        	ip = "127.0.0.1";
        }
		return ip;
	}
}
