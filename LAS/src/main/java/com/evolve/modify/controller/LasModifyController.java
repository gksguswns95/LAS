package com.evolve.modify.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.modify.service.ModifyService;
import com.evolve.modify.vo.ModifyVo;
import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;
import com.evolve.util.CreateKey;
import com.evolve.util.IpGet;
import com.evolve.util.MailSendThread;

@Controller
public class LasModifyController {
	
	@Autowired
	ModifyService modifyService;
	
	@Autowired
	SignupService signupService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/prototype/account_edit_editform")
	public ModelAndView Account_edit_01_editform(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_edit_01_editform");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_edit_auth")
	public ModelAndView Account_edit_02_auth(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_edit_02_auth");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_edit_resetpw")
	public ModelAndView Account_edit_03_resetpw(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_edit_03_resetpw");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}

	@GetMapping("/prototype/account_view_my")
	public ModelAndView Account_view_01_my(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_view_01_my");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
		return mv;
	}
	
	@GetMapping("/prototype/account_view_profile")
	public ModelAndView Account_view_02_my(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("prototype_user_id") != null ) {
			mv.setViewName("/Acount_Edit/Account_view_02_profile");
		} else {
			mv.setViewName("redirect:/prototype/main");
		}
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
	
	@GetMapping("/prototype/find_id")
	public ModelAndView Find_id_01() {
		ModelAndView mv = new ModelAndView("/Sign_in/Find_id_01");
		return mv;
	}
	
	@GetMapping("/prototype/find_idList")
	public ModelAndView Find_id_02() {
		ModelAndView mv = new ModelAndView("/Sign_in/Find_id_02");
		return mv;
	}

	@GetMapping("/prototype/reset_pw_id")
	public ModelAndView Reset_pw_01_id() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_01_id");
		return mv;
	}
	
	@GetMapping("/prototype/reset_pw_pin")
	public ModelAndView Reset_pw_03_auth() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_03_pin");
		return mv;
	}
	
	@GetMapping("/prototype/reset_pw_newpw")
	public ModelAndView Reset_pw_04_newpw() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_04_newpw");
		return mv;
	}

	@GetMapping("/prototype/reset_pw_comp")
	public ModelAndView Reset_pw_05_comp() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_05_comp");
		return mv;
	}
	
	@GetMapping("/prototype/reset_pw_birth")
	public ModelAndView Reset_pw_02_birth() {
		ModelAndView mv = new ModelAndView("/Sign_in/Reset_pw_02_birth");
		return mv;
	}
	
	@PostMapping("/prototype/findIdProcess")
	public ModelAndView nameBirthCheck(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<SignupVO> signupvo = modifyService.nameBirthCheck(request.getParameter("name"),request.getParameter("birth"));
		System.out.println(signupvo.size());
		if (signupvo.size() > 0) {
			mv.setViewName("/Sign_in/Find_id_02");
			int emailCount = 0, phoneCount = 0;
			for (SignupVO vo : signupvo) {
				if (vo.getSignup_type().equals("email")) {
					emailCount += 1;
					String hideEmail = "";
					String[] emailArr = vo.getId().split("@");
					if(emailArr[0].length() > 6) {
						hideEmail = emailArr[0].substring(0, 3);
						for(int i =0; i< emailArr[0].length() - 3;i++) {
							hideEmail += "*";
						}
						hideEmail = hideEmail+"@"+emailArr[1];
					} else {
						hideEmail = emailArr[0].substring(0, 2);
						for(int i =0; i< emailArr[0].length() - 2;i++) {
							hideEmail += "*";
						}
						hideEmail = hideEmail+"@"+emailArr[1];
					}
					vo.setId(hideEmail);
				} else {
					String hidePhone = "";
					String phoneID = vo.getId();
					hidePhone = phoneID.substring(0, 5) + "**" + phoneID.substring(7, 9) +"**";
					vo.setId(hidePhone);
					phoneCount += 1;
				}
			}
			mv.addObject("findIdList", signupvo);
			mv.addObject("emailCount", emailCount);
			mv.addObject("phoneCount", phoneCount);
		} else {
			mv.setViewName("redirect:/prototype/find_id");
			mv.addObject("error", "inconsistency");
		}
		return mv;
	}
	
	@PostMapping("/prototype/pw_idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id,@RequestParam("type") String type,HttpServletRequest request) {
		System.out.println("userIdCheck ??????");
		System.out.println("???????????? id:" + id);
		int cnt = signupService.memberIdSelect(id);
		System.out.println("?????? ??????:" + cnt);
		HttpSession session = request.getSession();
		if (cnt==1) {
			if(session.getAttribute("find_pw_id") != null) {
				session.removeAttribute("find_pw_id");
			}
			session.setAttribute("find_pw_id", id);
			
			if(session.getAttribute("find_pw_type") != null) {
				session.removeAttribute("find_pw_type");
			}
			session.setAttribute("find_pw_type", type);
		}
		return cnt;
	}
	
	@PostMapping("/prototype/pw_nameBirthCheck")
	@ResponseBody
	public int pw_nameBirthCheck(@RequestParam("name") String name,@RequestParam("birth") String birth,HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("userIdCheck ??????");
		System.out.println("???????????? name:" + name);
		System.out.println("???????????? birth:" + birth);
		HttpSession session = request.getSession();
		HashMap<String, Object> map = modifyService.namebirthidcheck(request.getParameter("name"),
				request.getParameter("birth"), session.getAttribute("find_pw_id").toString());
		int cnt = Integer.parseInt(map.get("count").toString()) ;
		System.out.println("?????? ??????:" + cnt);
		if( cnt == 1) {
			if(session.getAttribute("find_pw_type") == "email") {
				MailSendThread mailSendThread = new MailSendThread(mailSender, session.getAttribute("find_pw_id").toString());
				String authKey = mailSendThread.mailSend();
				//String authKey = CreateKey.getCreateKey();
				IpGet getIp = new IpGet();
				String ip = getIp.getUserIP(request);
				System.out.println("Key : "+authKey);
				signupService.emailAuthInsert(authKey,session.getAttribute("find_pw_id").toString(),ip);
				System.out.println("?????? ????????? ??????");
			} else {
				String authKey = "asd123";
			    IpGet getIp = new IpGet();
			    String ip = getIp.getUserIP(request);
			    signupService.emailAuthInsert(authKey,session.getAttribute("find_pw_id").toString(),ip);
			}
		}
		return cnt;
	}
	
	@PostMapping(value = "/prototype/reset_pwProcess")
	public ModelAndView reset_pwProcess(HttpServletRequest request, HttpServletResponse response,ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("find_pw_id").toString());
		map.put("pw", request.getParameter("pw"));
		if (session.getAttribute("find_pw_id") != null) {
				System.out.println("???????????? ?????? ???...");
				modifyService.resetPassword(map);
				System.out.println("???????????? ?????? ??????");
				mv.setViewName("redirect:/prototype/reset_pw_comp");
		} else {
			mv.setViewName("redirect:/prototype/reset_pw_id");
			System.out.println("?????? ??????????????????.");
		}
		return mv;
	}
	
	// ?????? ?????? ?????? ???????????? ?????? ??????
	@PostMapping(value = "/prototype/confirmAccountPassword")
	@ResponseBody
	public int confirmPasswordCheck(HttpServletRequest request, HttpServletResponse response,
		ModifyVo modifyvo,@RequestParam("pw") String pw) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("prototype_user_id").toString());
		map.put("pw", request.getParameter("pw"));

		System.out.println("???????????? ???????????? ?????? ???...");
		int Accountcount = modifyService.accountModifyConfirmPassword(map);
		System.out.println("???????????? ???????????? ?????? ??????");
		if (Accountcount == 1) {
			System.out.println("???????????? ??????!");
		} else {
			System.out.println("???????????? ?????????!!!");
		}
		return Accountcount;
	}
	
	// ???????????? ?????? - ???????????? ??????
	@PostMapping(value = "/prototype/passwordResetProcess")
	public ModelAndView modifyAccountPasswordCheck(HttpServletRequest request, HttpServletResponse response,
			ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("prototype_user_id").toString());
		map.put("pw", request.getParameter("pw"));
		if (session.getAttribute("prototype_user_id") != null) {
			System.out.println("???????????? ?????? ???...");
			mv.setViewName("redirect:/prototype/account_view_profile");
			modifyService.accountModify_ResetPassword(map);
			System.out.println("???????????? ?????? ??????");
		} else {
			mv.setViewName("redirect:/prototype/signin_valid");
			System.out.println("???????????? ???????????????.");
		}
		return mv;
	}
	
	// ???????????? ?????? - ?????????, ?????????
	@PostMapping(value = "/prototype/accountModifyProcess")
	public ModelAndView accountModify(HttpServletRequest request, HttpServletResponse response, ModifyVo modifyvo)
			throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/prototype/account_view_profile");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("prototype_user_id").toString());
		if (session.getAttribute("prototype_user_signuptype").toString().equals("email")) {
			map.put("phone", modifyvo.getPhone());
			session.removeAttribute("prototype_user_phone");
			session.setAttribute("prototype_user_phone", modifyvo.getPhone());
		}

		if (session.getAttribute("prototype_user_signuptype").toString().equals("phone")) {
			map.put("email", modifyvo.getEmail());
			session.removeAttribute("prototype_user_email");
			session.setAttribute("prototype_user_email", modifyvo.getEmail());
		}

		System.out.println("???????????? ?????? ???...");
		modifyService.accountModify(map);
		System.out.println("???????????? ?????? ??????");
		return mv;
	}
	
	@PostMapping("/prototype/optional_agreed_Y")
	@ResponseBody
	public void optional_agreed_Y(@RequestParam("agreed") String agreed, HttpServletRequest request) {
		System.out.println("optional_agreed_Y ??????");
		System.out.println("???????????? agreed:" + agreed);
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seq", session.getAttribute("prototype_user_seq"));
		if(session.getAttribute("prototype_user_optional_agreed") != null) {
			session.removeAttribute("prototype_user_optional_agreed");
		}
		if(agreed.equals("Y")) {
			modifyService.optional_agreed_insert(map);			
			session.setAttribute("prototype_user_optional_agreed", "Y");
		} else {
			modifyService.optional_agreed_del(map);
			session.setAttribute("prototype_user_optional_agreed", "N");
		}
		
	}
}
