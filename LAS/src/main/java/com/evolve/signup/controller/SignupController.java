package com.evolve.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignupController {

	@RequestMapping(value= "/terms_agreement", method= {RequestMethod.GET})
	public String signup() {
		return "signup/su_TermsAgreement";
	}
	
	@RequestMapping(value= "/identity_verification", method= {RequestMethod.GET})
	public String identity_verification() {
		return "signup/su_IdentityVerification";
	}
	
	@RequestMapping(value= "/create_account", method= {RequestMethod.GET})
	public String create_account() {
		return "signup/su_CreateAccount";
	}
	
}
