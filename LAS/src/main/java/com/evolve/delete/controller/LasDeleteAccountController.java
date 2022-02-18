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
	
	@PostMapping(value = "/prototype/account_reasonProcess")
	public ModelAndView reasonProcess(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("prototype_user_id") != null) {
			if(session.getAttribute("prototype_user_delReason") != null) {
				session.removeAttribute("prototype_user_delReason");
			}
			switch (request.getParameter("del-reason")) {
			case "1" : session.setAttribute("prototype_user_delReason", "중복된 다른 계정이 있어요"); break;
			case "2" : session.setAttribute("prototype_user_delReason", "원하는 서비스가 없어요"); break;
			case "3" : session.setAttribute("prototype_user_delReason", "서비스 이용이 불편해요"); break;
			case "4" : session.setAttribute("prototype_user_delReason", "사용빈도가 낮아요"); break;
			case "5" : session.setAttribute("prototype_user_delReason", "개인정보가 걱정되어요"); break;
			default: session.setAttribute("prototype_user_delReason", "중복된 다른 계정이 있어요"); break;
			}
			mv.setViewName("redirect:/prototype/account_del_pwinput");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		
		return mv;
	}
	
	
	// 회원탈퇴
	@RequestMapping(value = "/prototype/accountDel")
	public ModelAndView withdrawal(HttpServletRequest request, HttpServletResponse response, SigninVo signinvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("prototype_user_name") != null && session.getAttribute("prototype_user_phone") != null && session.getAttribute("prototype_user_id") != null) {
			System.out.println("이유 : "+session.getAttribute("prototype_user_delReason"));
			System.out.println("회원탈퇴 인증 중...");
			SigninVo signinProcess = signService.signinId_del(session.getAttribute("prototype_user_id").toString());
			
			if(signinProcess != null) {
				mv.setViewName("redirect:/prototype/main");
				System.out.println("회원탈퇴 인증 성공");
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
				System.out.println("회원정보 탈퇴 테이블로 이동 중...");
				deleteAccountService.deleteAccountMemberInsert(deleteAccountvo);
				System.out.println("회원정보 탈퇴 테이블로 이동 완료!");
				
				System.out.println("회원테이블 삭제여부 설정 중...");
				
//				deleteAccountService.deleteLoginLog(memberSeq);
//				deleteAccountService.deleteEssential_ta(memberSeq);
//				deleteAccountService.deleteOptional_ta(memberSeq);
//				deleteAccountService.deleteMember(memberSeq);
				System.out.println("약관 및 로그 삭제 완료");
				
				System.out.println("회원정보 del_yn 및 update 날짜 수정 중... ");
				deleteAccountService.deleteAccountMemberUpdate(deleteAccountvo.getId());
				System.out.println("회원정보 del_yn 및 update 날짜 수정 완료! ");
				
				session.invalidate();
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
				System.out.println("세션,쿠키 제거 및 회원탈퇴 완료");
			} else {
				mv.setViewName("redirect:/prototype/account_del_check");
				System.out.println("회원탈퇴 인증 실패");
			}
			return mv;
		} else {
			mv.setViewName("redirect:/prototype/main");
//			request.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인을 해주세요.');");
//			out.println("</script>");
//			out.flush();
			System.out.println("로그인을 해주세요.");
			return mv;
		}

	}
	
	// 계정 삭제 패스워드 일치 확인
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
				
				System.out.println("회원정보 비밀번호 확인 중...");
				Accountcount = modifyService.accountModifyConfirmPassword(map);
				System.out.println("회원정보 비밀번호 확인 완료");
				if (Accountcount == 1) {
					System.out.println("비밀번호 일치!");
				} else {
					System.out.println("비밀번호 불일치!!!");
				}
			}
			return Accountcount;
		}
	
}
