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
	
	@PostMapping(value = "/modifyAccount")
	public ModelAndView accountModify(HttpServletRequest request, HttpServletResponse response,ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView("modifyAccount/modifyAccountSuccess");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		map.put("pw", modifyvo.getPw());
		System.out.println(modifyvo.getPw());
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
	

}
