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
		
//		boolean isNumberic = signvo.getId().matches("^[0-9]*$");
//		System.out.println("isNumberic : "+isNumberic);
		SigninVo signinProcess = signService.signinId(signvo);
		System.out.println("로그인 컨트롤러 로그인 진행");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(signinProcess != null) {
			ModelAndView mv= new ModelAndView("signin");
			if(signinProcess.getDel_yn() == 0) {
				session.setAttribute("user_id", signinProcess.getId());
				session.setAttribute("user_phone", signinProcess.getPhone());
				session.setAttribute("user_name", signinProcess.getLast_name()+signinProcess.getFirst_name());
				 
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
				signService.loginLogInsert(signinProcess.getSeq(),ip);
				System.out.println("접속 IP : "+ip);
				System.out.println("로그인 성공");		
			} else {
				System.out.println("로그인 실패(회원탈퇴)");
				out.println("<script>");
				out.println("alert('회원탈퇴하여 로그인이 불가능합니다.');");
				out.println("</script>");
				out.flush();
			}
			return mv;
		} else {
			ModelAndView mv= new ModelAndView("/signin");
			out.println("<script>");
			out.println("alert('아이디 및 비밀번호가 다릅니다.');");
			out.println("</script>");
			out.flush();
			 
			System.out.println("로그인 실패(아이디 및 비밀번호 틀림)");
			return mv;
		}
		
	}
	
	@RequestMapping(value = "/signout")
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/signin");
		HttpSession session = request.getSession();
		if(session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null && session.getAttribute("user_id") != null) {
			System.out.println("로그아웃 및 세션제거 완료");
			session.invalidate();			
		}
		return mv;
	}
}
