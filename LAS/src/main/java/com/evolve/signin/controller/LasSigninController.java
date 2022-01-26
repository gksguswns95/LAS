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
	
	@GetMapping("/prototype/")
	public ModelAndView LAS_Landding_root() {
		ModelAndView mv = new ModelAndView("/Las_MainPage");
		return mv;
	}
	
	@GetMapping("/prototype/main")
	public ModelAndView LAS_Landding() {
		ModelAndView mv = new ModelAndView("/Las_MainPage");
		return mv;
	}
	
	@GetMapping("/prototype/signin_valid")
	public ModelAndView signin_01_valid() {
		ModelAndView mv = new ModelAndView("/Sign_in/Sign_in_01");
		return mv;
	}
	
	@GetMapping("/prototype/find_id")
	public ModelAndView Find_id_01() {
		ModelAndView mv = new ModelAndView("/Sign_in/Find_id_01");
		return mv;
	}
	
	@GetMapping("/prototype/reset_pw_id")
	public ModelAndView Reset_pw_01_id() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_01_id");
		return mv;
	}
	
	@GetMapping("/prototype/reset_pw_comp")
	public ModelAndView Reset_pw_01_comp() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_01_comp");
		return mv;
	}
	
	@GetMapping("/prototype/language_region")
	public ModelAndView Language_01_region() {
		ModelAndView mv = new ModelAndView("/Sign_in/Language_01_region");
		return mv;
	}
}
