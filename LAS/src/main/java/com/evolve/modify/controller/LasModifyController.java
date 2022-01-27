package com.evolve.modify.controller;

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
public class LasModifyController {
	
	@GetMapping("/prototype/account_del_check")
	public ModelAndView Account_del_01_check() {
		ModelAndView mv = new ModelAndView("/Acount_Edit/Account_del_01_check");
		return mv;
	}
	
	@GetMapping("/prototype/account_del_confirm")
	public ModelAndView Account_del_01_confirm() {
		ModelAndView mv = new ModelAndView("/Acount_Edit/Account_del_01_confirm");
		return mv;
	}
	
	@GetMapping("/prototype/account_del_pwinput")
	public ModelAndView Account_del_02_pwinput() {
		ModelAndView mv = new ModelAndView("/Acount_Edit/Account_del_02_pwinput");
		return mv;
	}
	
	@GetMapping("/prototype/account_edit_editform")
	public ModelAndView Account_edit_01_editform() {
		ModelAndView mv = new ModelAndView("/Acount_Edit/Account_edit_01_editform");
		return mv;
	}

	@GetMapping("/prototype/account_view_my")
	public ModelAndView Account_view_01_my() {
		ModelAndView mv = new ModelAndView("/Acount_Edit/Account_view_01_my");
		return mv;
	}
	
	@GetMapping("/prototype/footer_notice_list")
	public ModelAndView Footer_01_notice_list() {
		ModelAndView mv = new ModelAndView("/Footer/Footer_01_notice_list");
		return mv;
	}
	
	@GetMapping("/prototype/footer_qna_ans")
	public ModelAndView Footer_02_qna_ans() {
		ModelAndView mv = new ModelAndView("/Footer/Footer_02_qna_ans");
		return mv;
	}
}
