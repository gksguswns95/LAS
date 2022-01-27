package com.evolve.signup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.IpGet;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;

@Controller
public class LasSignupController {
	
	@Autowired
	SigninService signinService;
	
	@Autowired
	SignupService signupService;
	
	@GetMapping("/prototype/signup_select")
	public ModelAndView LAS_Sgin_up_00() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_00");
		return mv;
	}
	
	@GetMapping("/prototype/signup_idle")
	public ModelAndView LAS_Sgin_up_01() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_01");
		return mv;
	}
	
	@GetMapping("/prototype/signup_inputpin")
	public ModelAndView LAS_Sgin_up_02() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_02");
		return mv;
	}
	
	@GetMapping("/prototype/signup_account")
	public ModelAndView LAS_Sgin_up_03() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_03");
		return mv;
	}
	
	@GetMapping("/prototype/signup_welcome")
	public ModelAndView LAS_Sgin_up_04() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_04");
		return mv;
	}
	
	@GetMapping("/prototype/signup_term01")
	public ModelAndView LAS_Sign_up_term01() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_01_term01");
		return mv;
	}
	
	@PostMapping(value = "/prototype/identity_verification")
	public ModelAndView identity_verification_Create(HttpServletRequest request, SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/prototype/signup_welcome");
		HttpSession session = request.getSession();
		System.out.println("광고성 동의여부 = " + request.getParameter("agree"));
		System.out.println("id : "+signupvo.getId());
		System.out.println(signupvo.getPw());
		System.out.println("email : "+signupvo.getEmail());
		System.out.println(signupvo.getPhone());
		System.out.println(signupvo.getBirth());
		System.out.println(signupvo.getName());
		System.out.println("signup_type : "+signupvo.getSignup_type());
		if (signupvo.getId() != null && signupvo.getPw() != null) {

			// 회원가입
			signupService.signupInsert(signupvo);
			System.out.println(signupvo.getId());
			// memberSeq 찾기
			int memberSeq = signupService.memberSeqSelect(signupvo.getId());
			// 약관 필수 동의
			signupService.agreementInsert(memberSeq);
			// 선택동의(광고성)
			if (request.getParameter("agree").equals("Y")) {
				signupService.optionalInsert(memberSeq);
			}
			SigninVo signinvo = new SigninVo();
			signinvo.setId(signupvo.getId());
			signinvo.setPw(signupvo.getPw());
			SigninVo signinProcess = signinService.signinId(signinvo);
			
			session.setAttribute("user_id", signupvo.getId());
			session.setAttribute("user_name", signinProcess.getName());
			session.setAttribute("user_birth", signinProcess.getBirth());
			session.setAttribute("user_phone", signinProcess.getPhone());
			session.setAttribute("user_email", signinProcess.getEmail());
			session.setAttribute("user_signuptype", signinProcess.getSignup_type());
			session.setAttribute("user_signupdate", signinProcess.getSignup_date());
			 
	        IpGet ipget = new IpGet();
	        String ip = ipget.getUserIP(request);
	        signinService.loginLogInsert(signinProcess.getSeq(),ip);
			System.out.println("접속 IP : "+ip);
			System.out.println("로그인 성공");
		}
		return mv;
	}
}
