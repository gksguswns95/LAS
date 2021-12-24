package com.evolve.signup.controller;

import java.net.http.HttpRequest;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signin.service.SigninService;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;

@Controller
public class SignupController {
	
	@Autowired
	SignupService signupService;

	
	@RequestMapping(value= "/terms_agreement", method= {RequestMethod.GET})
	public ModelAndView signup(HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("signup/su_TermsAgreement");
		return mv;
	}
	
	@RequestMapping(value= "/identity_verification", method= {RequestMethod.GET})
	public ModelAndView identity_verification(HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_IdentityVerification");
		mv.addObject("checkbox",request.getParameter("checkboxYN"));
		HttpSession session = request.getSession();
//		String terms = (String)session.getAttribute("terms");
//		session.setAttribute("terms", terms);
//		System.out.println(terms);
		System.out.println(request.getParameter("checkboxYN"));
		
		
		return mv;
	}
	
	@RequestMapping(value = "/identity_verification" ,method = {RequestMethod.POST})
	public ModelAndView identity_verification_Create(HttpServletRequest requset,SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_Welcome");
		if(signupvo.getId() != null && signupvo.getPw() != null) {
			//아이디 중복 확인
			int duplicateId = signupService.memberSeqSelect(signupvo.getId());
			if(duplicateId == 0) {
				//회원가입
				signupService.signupInsert(signupvo);
				System.out.println(signupvo.getId());
				//memberSeq 찾기
				int memberSeq = signupService.memberSeqSelect(signupvo.getId());
				//약관 필수 동의
				signupService.agreementInsert(memberSeq);
				//선택동의(광고성)
				if(requset.getParameter("add_agreement") == "Y") {
					signupService.optionalInsert(memberSeq);				
				}				
			} else {
				mv.setViewName("signup/su_IdentityVerification");
			}
		}
		
		return mv;
	}
	
	
	@RequestMapping(value= "/welcome", method= {RequestMethod.GET})
	public String welcome() {
		return "signup/su_Welcome";
	}
	
	
}
