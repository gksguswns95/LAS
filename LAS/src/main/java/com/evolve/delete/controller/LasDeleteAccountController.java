package com.evolve.delete.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.delete.service.DeleteAccountService;
import com.evolve.delete.vo.DeleteAccountVo;
import com.evolve.modify.service.ModifyService;
import com.evolve.modify.vo.ModifyVo;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.fasterxml.jackson.annotation.JacksonInject.Value;

@Controller
public class LasDeleteAccountController {
	
	@Autowired 
	SigninService signService;
	
	@Autowired
	DeleteAccountService deleteAccountService;
	
	@Autowired
	SignupService signupService;

	@Autowired
	ModifyService modifyService;
	
	@GetMapping("/prototype/account_del_check")
	public ModelAndView Account_del_01_check(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_del_01_check");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_del_confirm")
	public ModelAndView Account_del_01_confirm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_del_01_confirm");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_del_pwinput")
	public ModelAndView Account_del_02_pwinput(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_delReason") != null && (session.getAttribute("prototype_user_id") != null )) {
			mv.setViewName("/Acount_Edit/Account_del_02_pwinput");
		} else {
			mv.setViewName("redirect:/prototype/account_del_check");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_del_complete")
	public ModelAndView Account_del_03_complete(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Acount_Edit/Account_del_03_complete");
		return mv;
	}
	
	@PostMapping(value = "/prototype/account_reasonProcess")
	public ModelAndView reasonProcess(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("prototype_user_id") != null) {
			if(session.getAttribute("prototype_user_delReason") != null) {
				session.removeAttribute("prototype_user_delReason");
			}
			switch (request.getParameter("del-reason")) {
			case "1" : session.setAttribute("prototype_user_delReason", "????????? ?????? ????????? ?????????"); break;
			case "2" : session.setAttribute("prototype_user_delReason", "????????? ???????????? ?????????"); break;
			case "3" : session.setAttribute("prototype_user_delReason", "????????? ????????? ????????????"); break;
			case "4" : session.setAttribute("prototype_user_delReason", "??????????????? ?????????"); break;
			case "5" : session.setAttribute("prototype_user_delReason", "??????????????? ???????????????"); break;
			default: session.setAttribute("prototype_user_delReason", "????????? ?????? ????????? ?????????"); break;
			}
			mv.setViewName("redirect:/prototype/account_del_pwinput");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		
		return mv;
	}
	
	
	// ????????????
	@RequestMapping(value = "/prototype/accountDel")
	public ModelAndView withdrawal(HttpServletRequest request, HttpServletResponse response, SigninVo signinvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("prototype_user_name") != null && session.getAttribute("prototype_user_phone") != null && session.getAttribute("prototype_user_id") != null) {
			System.out.println("?????? : "+session.getAttribute("prototype_user_delReason"));
			System.out.println("???????????? ?????? ???...");
			SigninVo signinProcess = signService.signinId_del(session.getAttribute("prototype_user_id").toString());
			
			if(signinProcess != null) {
				mv.setViewName("redirect:/prototype/account_del_complete");
				System.out.println("???????????? ?????? ??????");
				DeleteAccountVo deleteAccountvo = new DeleteAccountVo();				
				deleteAccountvo.setQuit_reason(session.getAttribute("prototype_user_delReason").toString());
				deleteAccountvo.setId(signinProcess.getId());
				deleteAccountvo.setPw(signinProcess.getPw());
				deleteAccountvo.setName(signinProcess.getName());
				deleteAccountvo.setBirth(signinProcess.getBirth());
				deleteAccountvo.setPhone(signinProcess.getPhone());
				deleteAccountvo.setEmail(signinProcess.getEmail());
				deleteAccountvo.setSignup_date(signinProcess.getSignup_date());
				deleteAccountvo.setSignup_type(signinProcess.getSignup_type());
				System.out.println("???????????? ?????? ???????????? ?????? ???...");
				deleteAccountService.deleteAccountMemberInsert(deleteAccountvo);
				System.out.println("???????????? ?????? ???????????? ?????? ??????!");
				
				System.out.println("??????????????? ???????????? ?????? ???...");
				
//				deleteAccountService.deleteLoginLog(memberSeq);
//				deleteAccountService.deleteEssential_ta(memberSeq);
//				deleteAccountService.deleteOptional_ta(memberSeq);
//				deleteAccountService.deleteMember(memberSeq);
				System.out.println("?????? ??? ?????? ?????? ??????");
				
				System.out.println("???????????? del_yn ??? update ?????? ?????? ???... ");
				deleteAccountService.deleteAccountMemberUpdate(deleteAccountvo.getId());
				System.out.println("???????????? del_yn ??? update ?????? ?????? ??????! ");
				
				session.invalidate();
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
				System.out.println("??????,?????? ?????? ??? ???????????? ??????");
			} else {
				mv.setViewName("redirect:/prototype/account_del_check");
				System.out.println("???????????? ?????? ??????");
			}
			return mv;
		} else {
			mv.setViewName("redirect:/prototype/main");
//			request.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('???????????? ????????????.');");
//			out.println("</script>");
//			out.flush();
			System.out.println("???????????? ????????????.");
			return mv;
		}

	}
	
	// ?????? ?????? ???????????? ?????? ??????
		@PostMapping(value = "/prototype/accountDel_PasswordCheck")
		@ResponseBody
		public int accountDel_PasswordCheck(HttpServletRequest request, HttpServletResponse response, ModifyVo modifyvo,@RequestParam("pw") String pw) throws IOException {
			ModelAndView mv = new ModelAndView();
			HttpSession session = request.getSession();
			int Accountcount = 0;
			if(session.getAttribute("prototype_user_delReason") != null) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", session.getAttribute("prototype_user_id").toString());
				map.put("pw", pw);
				System.out.println(pw);
				
				System.out.println("???????????? ???????????? ?????? ???...");
				Accountcount = modifyService.accountModifyConfirmPassword(map);
				System.out.println("???????????? ???????????? ?????? ??????");
				if (Accountcount == 1) {
					System.out.println("???????????? ??????!");
				} else {
					System.out.println("???????????? ?????????!!!");
				}
			}
			return Accountcount;
		}
	
}
