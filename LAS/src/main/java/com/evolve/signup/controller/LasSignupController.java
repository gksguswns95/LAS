package com.evolve.signup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;
import com.evolve.util.IpGet;

@Controller
public class LasSignupController {
	
	@Autowired
	SigninService signinService;
	
	@Autowired
	SignupService signupService;
	
	@GetMapping("/prototype/signup_select")
	public ModelAndView LAS_Sgin_up_00(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_00");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_idle")
	public ModelAndView LAS_Sgin_up_01(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_01");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_inputpin")
	public ModelAndView LAS_Sgin_up_02(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_02");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_account")
	public ModelAndView LAS_Sgin_up_03(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null &&  session.getAttribute("prototype_user_signupId") != null
				&& session.getAttribute("prototype_user_signupType") != null) {
			mv.setViewName("/Sign_up/Sign_up_03");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_welcome")
	public ModelAndView LAS_Sgin_up_04(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Sign_up/Sign_up_04");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_term01")
	public ModelAndView LAS_Sign_up_term01(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Sign_up/Sign_up_01_term01");
		return mv;
	}
	
	@GetMapping("/prototype/signup_term02")
	public ModelAndView LAS_Sign_up_term02(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
			mv.setViewName("/Sign_up/Sign_up_01_term02");
		return mv;
	}
	
	@GetMapping("/prototype/signup_term03")
	public ModelAndView LAS_Sign_up_term03(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
			mv.setViewName("/Sign_up/Sign_up_01_term03");
		return mv;
	}
	
	@GetMapping("/prototype/signup_sns")
	public ModelAndView Sign_up_02_sel_sns_ko_KR_1(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_02_sel_sns_ko_KR");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	@GetMapping("/prototype/signup_sns_1")
	public ModelAndView Sign_up_02_sel_sns_ko_KR_2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_02_sel_sns_ko_KR_1");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/signup_sns_2")
	public ModelAndView Sign_up_02_sel_sns_ko_KR_3(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") == null ) {
			mv.setViewName("/Sign_up/Sign_up_02_sel_sns_ko_KR_2");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@PostMapping(value = "/prototype/identity_verification")
	public ModelAndView identity_verification_Create(HttpServletRequest request, SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/prototype/signup_welcome");
		HttpSession session = request.getSession();
		System.out.println("광고성 동의여부 = " + request.getParameter("agree"));
		System.out.println("id : "+session.getAttribute("prototype_user_signupId"));
		System.out.println(signupvo.getPw());
		System.out.println("email : "+signupvo.getEmail());
		System.out.println(signupvo.getPhone());
		System.out.println(signupvo.getBirth());
		System.out.println(signupvo.getName());
		System.out.println("signup_type : "+session.getAttribute("prototype_user_signupType"));
		
		signupvo.setId(session.getAttribute("prototype_user_signupId").toString());
		signupvo.setSignup_type(session.getAttribute("prototype_user_signupType").toString());
		
		if(session.getAttribute("prototype_user_signupType") == "email") {
			signupvo.setEmail(session.getAttribute("prototype_user_signupId").toString());
		}
		
		if(session.getAttribute("prototype_user_signupType") == "phone") {
			signupvo.setPhone(session.getAttribute("prototype_user_signupId").toString());
		}
		
		if (signupvo.getId() != null && signupvo.getPw() != null && session.getAttribute("prototype_user_signupId") != null
				&& session.getAttribute("prototype_user_signupType") != null) {

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
			
			session.setAttribute("prototype_user_seq", signinProcess.getSeq());
			session.setAttribute("prototype_user_id", signupvo.getId());
			session.setAttribute("prototype_user_firstName", signinProcess.getName().charAt(0));
			session.setAttribute("prototype_user_name", signinProcess.getName());
			session.setAttribute("prototype_user_birth", signinProcess.getBirth());
			session.setAttribute("prototype_user_phone", signinProcess.getPhone());
			session.setAttribute("prototype_user_email", signinProcess.getEmail());
			session.setAttribute("prototype_user_signuptype", signinProcess.getSignup_type());
			session.setAttribute("prototype_user_signupdate", signinProcess.getSignup_date());
			if(signinProcess.getAgreed() == "1") {
				session.setAttribute("prototype_user_optional_agreed", 'Y');				
			} else {
				session.setAttribute("prototype_user_optional_agreed", 'N');	
			}
			 
	        IpGet ipget = new IpGet();
	        String ip = ipget.getUserIP(request);
	        signinService.loginLogInsert(signinProcess.getSeq(),ip);
			System.out.println("접속 IP : "+ip);
			System.out.println("로그인 성공");
			
			session.removeAttribute("prototype_user_signupType");
			session.removeAttribute("prototype_user_signupId");
		}
		return mv;
	}
	
	@PostMapping(value = "/prototype/extensionValidityTime")
	@ResponseBody
	public void extensionValidityTime(HttpServletRequest request, @RequestParam("id") String id) {
		IpGet getIp = new IpGet();
		System.out.println("받은 id: "+id);
	    String ip = getIp.getUserIP(request);
	    System.out.println("받은 ip: "+ip);
	    signupService.emailAuthTimeUpdate(id,ip);
	    System.out.println("연장 성공");
	}
}
