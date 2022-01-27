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

	@Autowired
	SigninService signinService;

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
		ModelAndView mv = new ModelAndView("/Language_01_region");
		return mv;
	}

	@PostMapping(value = "/prototype/signin")
	public ModelAndView userLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			SigninVo signvo) throws IOException {
		System.out.println(signvo.getId());
		System.out.println(signvo.getPw());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/prototype/account_view_my");
		System.out.println(session.getAttribute("user_id"));
		if (session.getAttribute("user_id") == null) {
			session.invalidate();
		}
		boolean isNumberic = signvo.getId().matches("^[0-9]*$");
		if (isNumberic) {
			signvo.setId(signvo.getId().replaceAll("-", ""));
			System.out.println("바뀐 ID 값: " + signvo.getId());
		}
		SigninVo signinProcess = signinService.signinId(signvo);
		System.out.println("로그인 컨트롤러 로그인 진행");

		if (signinProcess != null) {
			mv.setViewName("redirect:/prototype/account_view_my");
			session.setAttribute("prototype_user_id", signvo.getId());
			session.setAttribute("prototype_user_name", signinProcess.getName());
			session.setAttribute("prototype_user_birth", signinProcess.getBirth());
			session.setAttribute("prototype_user_phone", signinProcess.getPhone());
			session.setAttribute("prototype_user_email", signinProcess.getEmail());
			session.setAttribute("prototype_user_signuptype", signinProcess.getSignup_type());
			session.setAttribute("prototype_user_signupdate", signinProcess.getSignup_date());

			// ipCheck
			IpGet getIp = new IpGet();
			String ip = getIp.getUserIP(request);
			signinService.loginLogInsert(signinProcess.getSeq(), ip);
			System.out.println("접속 IP : " + ip);
			System.out.println("로그인 성공");
			return mv;
		} else {
			mv.setViewName("redirect://prototype/signin_valid");
			mv.addObject("error", "loginError");
			System.out.println("로그인 실패(아이디 및 비밀번호 틀림)");
			return mv;
		}

	}

	@RequestMapping(value = "/prototype/signout")
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/prototype/main");
		HttpSession session = request.getSession();
		if (session.getAttribute("user_name") != null && session.getAttribute("user_phone") != null
				&& session.getAttribute("user_id") != null) {
			session.invalidate();
			System.out.println("로그아웃 및 세션제거 완료");
		}
		return mv;
	}
}
