package com.evolve.modify.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.modify.service.ModifyService;
import com.evolve.modify.vo.ModifyVo;
import com.evolve.signup.controller.SignupController;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;
import com.evolve.util.CreateKey;
import com.evolve.util.IpGet;
import com.evolve.util.MailSendThread;

@Controller
public class ModifyController {

	@Autowired
	ModifyService modifyService;

	@Autowired
	SignupService signupService;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(ModifyController.class);

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

	@GetMapping(value = "/findpw")
	public String FindID(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("customer_id");
		return "/findAccount/findPW";
	}

	@GetMapping(value = "/findid")
	public String FindPW() {
		return "/findAccount/findID";
	}

	@GetMapping(value = "/findid_list")
	public String FindIdList() {
		return "/findAccount/findIDList";
	}

	@GetMapping(value = "/authemail")
	public String authEmail() {
		return "/findAccount/authEmail";
	}	
	
	@GetMapping(value = "/modifypassword")
	public String modifyPassword() {
		return "/findAccount/modifyPassword";
	}
	
	@GetMapping(value = "/modifypasswordsuccess")
	public String modifyPasswordSuccess() {
		return "/findAccount/modifyPasswordSuccess";
	}
	
	@GetMapping(value = "/modifyAccountSuccess")
	public String modifyAccountSuccess() {
		return "/modifyAccount/modifyAccountSuccess";
	}


	@PostMapping(value = "/modifyAccount")
	public ModelAndView accountModify(HttpServletRequest request, HttpServletResponse response, ModifyVo modifyvo)
			throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/modifyAccountSuccess");
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		if (session.getAttribute("user_signuptype").toString().equals("email")) {
			map.put("phone", modifyvo.getPhone());
			session.setAttribute("user_phone", modifyvo.getPhone());
		}

		if (session.getAttribute("user_signuptype").toString().equals("phone")) {
			map.put("email", modifyvo.getEmail());
			session.setAttribute("user_email", modifyvo.getEmail());
		}

		System.out.println("???????????? ?????? ???...");
		modifyService.accountModify(map);
		System.out.println("???????????? ?????? ??????");
		return mv;
	}

	@PostMapping(value = "/confirmAccountPassword")
	public ModelAndView confirmPasswordCheck(HttpServletRequest request, HttpServletResponse response,
			ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		map.put("pw", request.getParameter("pw"));

		System.out.println("???????????? ???????????? ?????? ???...");
		int Accountcount = modifyService.accountModifyConfirmPassword(map);
		System.out.println("???????????? ???????????? ?????? ??????");
		if (Accountcount == 1) {
			mv.setViewName("redirect:/modifyAccount");
			System.out.println("???????????? ??????!");
			return mv;
		} else {
			mv.setViewName("modifyAccount/confirmAccountPassword");
			mv.addObject("error", "passwordConfirmError");
			return mv;
		}
	}

	@PostMapping(value = "/modifyAccountPassword")
	public ModelAndView modifyAccountPasswordCheck(HttpServletRequest request, HttpServletResponse response,
			ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", session.getAttribute("user_id").toString());
		map.put("pw", request.getParameter("pw"));
		map.put("changePw", request.getParameter("changePw"));
		if (session.getAttribute("user_id") != null) {
			int accountCount = modifyService.accountModifyConfirmPassword(map);
			System.out.println("accountCount : " + accountCount);
			if (accountCount == 1) {
				System.out.println("???????????? ?????? ???...");
				mv.setViewName("redirect:/modifyAccountSuccess");
				modifyService.accountModifyPassword(map);
				System.out.println("???????????? ?????? ??????");
			} else {
				System.out.println("????????? ???????????? ?????????");
				mv.addObject("error", "passwordModifyError");
				mv.setViewName("redirect:/modifyAccountPassword");
			}
			return mv;
		} else {
			mv.setViewName("redirect:/signin");
			System.out.println("???????????? ????????? ????????????.");
			return mv;
		}
	}

	@PostMapping("/nameemailcheck")
	@ResponseBody
	public int nameEmailCheck(@RequestParam("name") String name, @RequestParam("email") String email,
			HttpServletRequest request) {
		logger.info("nameEmailCheck ??????");
		logger.info("???????????? email:" + email);
		logger.info("???????????? name:" + name);
		int cnt = modifyService.nameEmailCheck(name, email);
		logger.info("???????????? cnt:" + cnt);

		return cnt;
	}

	// ???????????? ?????? - ????????? ?????? ???????????? ?????? ??? ??????????????? ????????????
	@PostMapping("/namebirthidcheck")
	public ModelAndView nameBirthIdCheck(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> map = modifyService.namebirthidcheck(request.getParameter("name"),
				request.getParameter("birth"), request.getParameter("id"));
		if (Integer.parseInt(map.get("count").toString()) > 0) { 
			if (map.get("signup_type").equals("email")) {
				mv.setViewName("redirect:/authemail");
				 MailSendThread mailSendThread = new MailSendThread(mailSender,request.getParameter("id"));
				String authKey = mailSendThread.mailSend();
				//String authKey = CreateKey.getCreateKey();
				IpGet getIp = new IpGet();
				String ip = getIp.getUserIP(request);
				logger.info("Key : " + authKey);
				signupService.emailAuthInsert(authKey, request.getParameter("id"), ip);
				logger.info("?????? ?????? ??????");
				session.setAttribute("customer_id", request.getParameter("id"));
			} else {
				session.setAttribute("customer_id", request.getParameter("id"));
				mv.setViewName("redirect:/");
			}
		} else {
			mv.addObject("error", "NotSame");
			mv.setViewName("redirect:/findpw");
		}
		
		return mv;
	}

	// ???????????? ?????? - ????????? ????????????
	@PostMapping("/pwemailauth")
	@ResponseBody
	public int emailAuthKeyCheck(@RequestParam("mailAuthKey") String mailAuthKey,@RequestParam("email") String email,HttpServletRequest request) {
		logger.info("emailAuthKeyCheck ??????");
		logger.info("???????????? email:" + email);
		logger.info("???????????? mailAuthKey:" + mailAuthKey);
		IpGet getIp = new IpGet();
	    String ip = getIp.getUserIP(request);
	    int cnt = signupService.emailAuthKeySelect(email,mailAuthKey,ip);
	    if (cnt == 1) {
	    	signupService.emailAuthKeyDelete(email,mailAuthKey,ip);
	    }
	    logger.info("???????????? cnt:" + cnt);
	    
	    return cnt;
	}

	@PostMapping("/namebirthcheck")
	public ModelAndView nameBirthCheck(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<SignupVO> signupvo = modifyService.nameBirthCheck(request.getParameter("name"),
				request.getParameter("birth"));
		if (signupvo.size() > 0) {
			mv.setViewName("findAccount/findIDList");
			// mv.setViewName("redirect:/findid_list");
			int emailCount = 0, phoneCount = 0;
			for (SignupVO vo : signupvo) {
				if (vo.getSignup_type().equals("email")) {
					emailCount += 1;
				} else {
					phoneCount += 1;
				}
			}
			mv.addObject("findIdList", signupvo);
			mv.addObject("emailCount", emailCount);
			mv.addObject("phoneCount", phoneCount);
		} else {
			mv.addObject("error", "NotSame");
			mv.setViewName("redirect:/findid");
		}
		return mv;
	}
	
	//???????????? ?????? - ???????????? ??????
	@PostMapping(value = "/modifyPassword")
	public ModelAndView modifyPassword(HttpServletRequest request, HttpServletResponse response, ModifyVo modifyvo) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/modifypasswordsuccess");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		map.put("id", session.getAttribute("customer_id"));
		map.put("changePw", request.getParameter("changePw"));
		modifyService.modifyPassword(map);
		
		return mv;
	}

}
