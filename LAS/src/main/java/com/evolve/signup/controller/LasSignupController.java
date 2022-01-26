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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.IpGet;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;

@Controller
public class LasSignupController {
	
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
	public ModelAndView LAS_Sgin_up_term01() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_01_term01");
		return mv;
	}
}
