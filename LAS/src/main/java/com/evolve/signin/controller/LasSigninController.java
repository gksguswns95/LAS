package com.evolve.signin.controller;

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
public class LasSigninController {
	
	@GetMapping("/prototype/sign_in")
	public ModelAndView LAS_Landding() {
		ModelAndView mv = new ModelAndView("/Las_MainPage");
		return mv;
	}
	
	@GetMapping("/prototype/sign_up")
	public ModelAndView LAS_Sgin_up_02() {
		ModelAndView mv = new ModelAndView("/Sign_up/Sign_up_02");
		return mv;
	}
}
