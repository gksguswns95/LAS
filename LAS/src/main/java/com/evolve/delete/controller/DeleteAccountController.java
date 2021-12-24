package com.evolve.delete.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.evolve.delete.service.DeleteAccountService;
import com.evolve.delete.vo.DeleteAccountVo;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;

@Controller
public class DeleteAccountController {
	
	@Autowired 
	SigninService signService;
	
	@Autowired
	DeleteAccountService deleteAccountService;
	
	@GetMapping(value = "/withdrawal")
	public String withdrawal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null && session.getAttribute("user_id") != null) {
			return "deleteAccount/withdrawal";	
		} else {
			return "signin";
		}
	}

	@GetMapping(value = "/withdrawalSuccess")
	public String withdrawalSuccess(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null && session.getAttribute("user_id") != null) {
			session.invalidate();
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
			System.out.println("세션제거 및 회원탈퇴 완료");
			
			return "deleteAccount/withdrawalSuccess";			
		} else {
			return "signin";
		}
	}
	
	@PostMapping(value = "/withdrawal")
	public ModelAndView withdrawal(HttpServletRequest request, HttpServletResponse response, SigninVo signinvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null && session.getAttribute("user_id") != null) {
			signinvo.setId(session.getAttribute("user_id").toString());
			System.out.println("이유 : "+request.getParameter("reasonOther"));
			System.out.println("회원탈퇴 인증 중...");
			SigninVo signinProcess = signService.signinId(signinvo);
			
			if(signinProcess != null) {
				mv.setViewName("deleteAccount/withdrawalSuccess");
				System.out.println("회원탈퇴 인증 성공");
				DeleteAccountVo deleteAccountvo = new DeleteAccountVo();				
				deleteAccountvo.setQuit_reason(request.getParameter("reasonOther"));
				deleteAccountvo.setId(signinProcess.getId());
				deleteAccountvo.setPw(signinProcess.getPw());
				deleteAccountvo.setLast_name(signinProcess.getLast_name());
				deleteAccountvo.setFirst_name(signinProcess.getFirst_name());
				deleteAccountvo.setBirth(signinProcess.getBirth());
				deleteAccountvo.setGender(signinProcess.getGender());
				deleteAccountvo.setPhone(signinProcess.getPhone());
				deleteAccountvo.setEmail(signinProcess.getEmail());
				deleteAccountvo.setSignup_date(signinProcess.getSignup_date());
				deleteAccountvo.setSignup_type(signinProcess.getSignup_type());
				System.out.println("회원정보 이동 중...");
				deleteAccountService.deleteAccountMemberInsert(deleteAccountvo);
				System.out.println("회원정보 이동 완료!");
				
				System.out.println("회원테이블 삭제여부 설정 중...");
				deleteAccountService.deleteAccountMemberUpdate(signinProcess.getId());
				System.out.println("회원테이블 삭제여부 설정 완료");
				
				session.invalidate();
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
				System.out.println("세션제거 및 회원탈퇴 완료");
				
				return mv;
			} else {
				mv.setViewName("deleteAccount/withdrawal");
				mv.addObject("error", "withdrawalAccountError");
				System.out.println("회원탈퇴 인증 실패");
				return mv;
			}
		} else {
			mv.setViewName("/login");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("</script>");
			out.flush();
			 
			System.out.println("로그인을 해주세요.");
			return mv;
		}

	}
	
}
