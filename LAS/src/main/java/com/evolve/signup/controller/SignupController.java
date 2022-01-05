package com.evolve.signup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;

@Controller
public class SignupController {

	@Autowired
	SignupService signupService;
	
	@Autowired
	SigninService signinService;

	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		logger.info("userIdCheck 진입");
		logger.info("전달받은 id:" + id);
		int cnt = signupService.memberIdSelect(id);
		logger.info("확인 결과:" + cnt);
		return cnt;
	}

	@RequestMapping(value = "/terms_agreement", method = { RequestMethod.GET })
	public ModelAndView signup(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("signup/su_TermsAgreement");
		return mv;
	}

	@RequestMapping(value = "/identity_verification", method = { RequestMethod.GET })
	public ModelAndView identity_verification(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_IdentityVerification");

		return mv;
	}

	@RequestMapping(value = "/identity_verification", method = { RequestMethod.POST })
	public ModelAndView identity_verification_Create(HttpServletRequest request, SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_Welcome");
		HttpSession session = request.getSession();
		System.out.println(signupvo.getSignup_type());
		System.out.println("광고성 동의여부 = " + request.getParameter("add_agreement"));

		if (signupvo.getId() != null && signupvo.getPw() != null) {

			// 회원가입
			signupService.signupInsert(signupvo);
			System.out.println(signupvo.getId());
			// memberSeq 찾기
			int memberSeq = signupService.memberSeqSelect(signupvo.getId());
			// 약관 필수 동의
			signupService.agreementInsert(memberSeq);
			// 선택동의(광고성)
			if (request.getParameter("add_agreement").equals("Y")) {
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
	        signinService.loginLogInsert(signinProcess.getSeq(),ip);
			System.out.println("접속 IP : "+ip);
			System.out.println("로그인 성공");
		}

		return mv;
	}

	@RequestMapping(value = "/welcome", method = { RequestMethod.GET })
	public String welcome() {
		return "signup/su_Welcome";
	}

}
