package com.evolve.signin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;

@Controller
public class SigninController {
	
	@Autowired 
	SigninService signService;
	
	@GetMapping(value = "/")
	public String main() {
		return "signin";
	}
	
	@GetMapping(value = "/signin")
	public String login() {
		return "signin";
	}
	
	@PostMapping(value = "/signin")
	public ModelAndView userLogin(HttpSession session,HttpServletRequest request, HttpServletResponse response, SigninVo signvo) throws IOException {
		System.out.println(signvo.getId());
		System.out.println(signvo.getPw());
		ModelAndView mv= new ModelAndView("/signin");
		if(session.getAttribute("user_id") == null) {
			boolean isNumberic = signvo.getId().matches("^[0-9]*$");
			if(isNumberic) {
				signvo.setId(signvo.getId().replaceAll("-", ""));
				System.out.println("바뀐 ID 값: "+signvo.getId());
			}
			SigninVo signinProcess = signService.signinId(signvo);
			System.out.println("로그인 컨트롤러 로그인 진행");
			
			if(signinProcess != null) {
				mv.setViewName("signin");
				session.setAttribute("user_id", signvo.getId());
				session.setAttribute("user_name", signinProcess.getName());
				session.setAttribute("user_birth", signinProcess.getBirth());
				session.setAttribute("user_phone", signinProcess.getPhone());
				session.setAttribute("user_email", signinProcess.getEmail());
				session.setAttribute("user_signuptype", signinProcess.getSignup_type());
				session.setAttribute("user_signupdate", signinProcess.getSignup_date());
				
				// ipCheck
				String ip = request.getHeader("X-Forwarded-For");
				if (ip == null) {
					ip = request.getHeader("Proxy-Client-IP");
				}
				if (ip == null) {
					ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
				}
				if (ip == null) {
					ip = request.getHeader("HTTP_CLIENT_IP");
				}
				if (ip == null) {
					ip = request.getHeader("HTTP_X_FORWARDED_FOR");
				}
				if (ip == null) {
					ip = request.getRemoteAddr();
				}
				if (ip.equals("0:0:0:0:0:0:0:1")) {
					ip = "127.0.0.1";
				}
				signService.loginLogInsert(signinProcess.getSeq(),ip);
				System.out.println("접속 IP : "+ip);
				System.out.println("로그인 성공");		
				return mv;
			} else {
				mv.setViewName("/signin");
				mv.addObject("error", "loginError");
				System.out.println("로그인 실패(아이디 및 비밀번호 틀림)");
				return mv;
			}
		} else {
			return mv;
		}
		
	}
	
	@RequestMapping(value = "/signout")
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/signin");
		HttpSession session = request.getSession();
		if(session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null && session.getAttribute("user_id") != null) {
			session.invalidate();			
			System.out.println("로그아웃 및 세션제거 완료");
		}
		return mv;
	}
}
