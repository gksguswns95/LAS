package com.evolve.modify.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.modify.service.ModifyService;
import com.evolve.modify.vo.ModifyVo;

@Controller
public class ModifyController {
	
	@Autowired 
	ModifyService modifyService;
	
	@GetMapping(value = "/myAccountInformation")
	public String myAccount() {
		return "/modifyAccount/myAccountInformation";
	}
	
	@GetMapping(value = "/modifyAccount")
	public String modifyAccount() {
		return "/modifyAccount/modifyAccount";
	}
	
	@GetMapping(value = "/confirmAccountPassword")
	public String confirmPassword() {
		return "/modifyAccount/confirmAccountPassword";
	}
	
	@GetMapping(value = "/modifyAccountPassword")
	public String modifyAccountPassword() {
		return "/modifyAccount/modifyAccountPassword";
	}
	
	@PostMapping(value = "/modifyAccount")
	public ModelAndView accountModify(HttpServletRequest request, HttpServletResponse response,ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView("modifyAccount/modifyAccountSuccess");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		if(session.getAttribute("user_signuptype").toString().equals("email")) {
			map.put("phone",modifyvo.getPhone());
		}
		
		if(session.getAttribute("user_signuptype").toString().equals("phone")) {
			map.put("email",modifyvo.getEmail());
		}
		
		System.out.println("회원정보 수정 중...");
		modifyService.accountModify(map);
		System.out.println("회원정보 수정 완료");
		return mv;
	}
	
	@PostMapping(value = "/confirmAccountPassword")
	public ModelAndView confirmPasswordCheck(HttpServletRequest request, HttpServletResponse response,ModifyVo modifyvo) throws IOException {
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		map.put("pw", request.getParameter("pw"));
		
		System.out.println("회원정보 비밀번호 확인 중...");
		int Accountcount = modifyService.accountModifyConfirmPassword(map);
		System.out.println("회원정보 비밀번호 확인 완료");
		if(Accountcount == 1) {
			System.out.println("비밀번호 일치!");
			ModelAndView mv = new ModelAndView("modifyAccount/modifyAccount");			
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("modifyAccount/confirmAccountPassword");						
			return mv;
		}
	}
	
	@PostMapping(value = "/modifyAccountPassword")
	public ModelAndView modifyAccountPasswordCheck(HttpServletRequest request, HttpServletResponse response,ModifyVo modifyvo) throws IOException {
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		map.put("pw", request.getParameter("pw"));
		map.put("changePw", request.getParameter("changePw"));
		if(session.getAttribute("user_id") != null) {
			ModelAndView mv = new ModelAndView("modifyAccount/modifyAccountSuccess");
			System.out.println("비밀번호 수정 중...");
			modifyService.accountModifyPassword(map);
			System.out.println("비밀번호 수정 완료");
			session.invalidate();
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("/signin");
			return mv;
		}
	}
	

}
