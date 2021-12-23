package com.evolve.signup.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signup.vo.Signup_TermsAgreement_VO;

@Controller
public class SignupController {

	@RequestMapping(value= "/terms_agreement", method= {RequestMethod.GET})
	public String signup()throws Exception {
		ModelAndView mv = new ModelAndView();
		return "signup/su_TermsAgreement";
	}
	
	@RequestMapping(value= "/identity_verification", method= {RequestMethod.GET})
	public String identity_verification(HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		String terms = (String)session.getAttribute("terms");
		session.setAttribute("terms", terms);
		System.out.println(terms);
		
		return "signup/su_IdentityVerification";
	}
	
	@RequestMapping(value= "/create_account", method= {RequestMethod.GET})
	public String create_account() {
		return "signup/su_CreateAccount";
	}
	
	@RequestMapping(value= "/welcome", method= {RequestMethod.GET})
	public String welcome() {
		return "signup/su_Welcome";
	}
	
}
