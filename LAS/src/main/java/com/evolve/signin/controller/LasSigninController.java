package com.evolve.signin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.modify.vo.ModifyVo;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.vo.SignupVO;
import com.evolve.util.I18nConfig;
import com.evolve.util.IpChangeDecimal;
import com.evolve.util.IpGet;

@Controller
public class LasSigninController {

	@Autowired
	SigninService signinService;

	@GetMapping("/prototype/")
	public ModelAndView LAS_Landding_root(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		IpGet getIp = new IpGet();
		String ip = getIp.getUserIP(request);
		IpChangeDecimal ipChangeDecimal = new IpChangeDecimal();
		Long desimalIP = ipChangeDecimal.convertStringToHex(ip);
		String country = signinService.countrySelect(desimalIP);
		
		Cookie[] cookies = request.getCookies();
		int count =0;
		for(Cookie cookie:cookies) {
			if ((cookie.getName()).equals("lang")) {
				  count++;
            }
		}
		
		if(count == 0) {
			if(country.equals("us")) {
				Cookie cookie = new Cookie("lang", "en_US");
				cookie.setPath("/");
				response.addCookie(cookie);
				mv.addObject("lang", "en_US");
			} else {
				Cookie cookie = new Cookie("lang", "ko_KR");
				cookie.setPath("/");
				response.addCookie(cookie);
				mv.addObject("lang", "ko_KR");
			}
		}
		mv.setViewName("/Las_MainPage");
		return mv;
	}

	@GetMapping("/prototype/main")
	public ModelAndView LAS_Landding(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		IpGet getIp = new IpGet();
		String ip = getIp.getUserIP(request);
		IpChangeDecimal ipChangeDecimal = new IpChangeDecimal();
		Long desimalIP = ipChangeDecimal.convertStringToHex(ip);
		String country = signinService.countrySelect(desimalIP);
		
		Cookie[] cookies = request.getCookies();
		int count =0;
		for(Cookie cookie:cookies) {
			if ((cookie.getName()).equals("lang")) {
				  count++;
            }
		}
		
		if(count == 0) {
			if(country.equals("us")) {
				Cookie cookie = new Cookie("lang", "en_US");
				cookie.setPath("/");
				response.addCookie(cookie);
				mv.addObject("lang", "en_US");
			} else {
				Cookie cookie = new Cookie("lang", "ko_KR");
				cookie.setPath("/");
				response.addCookie(cookie);
				mv.addObject("lang", "ko_KR");
			}
		}
		mv.setViewName("/Las_MainPage");
		return mv;
	}

	@GetMapping("/prototype/signin_valid")
	public ModelAndView signin_01_valid(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Sign_in/Sign_in_01");			
		return mv;
	}

	@GetMapping("/prototype/language_region")
	public ModelAndView Language_01_region() {
		ModelAndView mv = new ModelAndView("/Language_01_region");
		return mv;
	}
	
	@PostMapping(value = "/prototype/signin")
	@ResponseBody
	public int userLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			SigninVo signvo) throws IOException {
		System.out.println(signvo.getId());
		System.out.println(signvo.getPw());
		int cnt = 0;
		if (session.getAttribute("prototype_user_id") != null) {
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
			session.setAttribute("prototype_user_seq", signinProcess.getSeq());
			session.setAttribute("prototype_user_id", signvo.getId());
			session.setAttribute("prototype_user_firstName", signinProcess.getName().charAt(0));
			session.setAttribute("prototype_user_name", signinProcess.getName());
			session.setAttribute("prototype_user_birth", signinProcess.getBirth());
			session.setAttribute("prototype_user_phone", signinProcess.getPhone());
			session.setAttribute("prototype_user_email", signinProcess.getEmail());
			session.setAttribute("prototype_user_signuptype", signinProcess.getSignup_type());
			session.setAttribute("prototype_user_signupdate", signinProcess.getSignup_date());
			System.out.println(signinProcess.getAgreed());
			if(signinProcess.getAgreed() != null ) {
				session.setAttribute("prototype_user_optional_agreed", 'Y');				
			} else {
				session.setAttribute("prototype_user_optional_agreed", 'N');	
			}
			System.out.println(session.getAttribute("prototype_user_optional_agreed"));

			// ipCheck
			IpGet getIp = new IpGet();
			String ip = getIp.getUserIP(request);
			signinService.loginLogInsert(signinProcess.getSeq(), ip);
			System.out.println("접속 IP : " + ip);
			System.out.println("로그인 성공");
			cnt = 1;
		} else {
			System.out.println("로그인 실패(아이디 및 비밀번호 틀림)");
		}
		return cnt;
	}

	@RequestMapping(value = "/prototype/signout")
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/prototype/main");
		HttpSession session = request.getSession();
		if (session.getAttribute("prototype_user_name") != null && session.getAttribute("prototype_user_phone") != null
				&& session.getAttribute("prototype_user_id") != null) {
			session.invalidate();
			System.out.println("로그아웃 및 세션제거 완료");
		}
		return mv;
	}
}
