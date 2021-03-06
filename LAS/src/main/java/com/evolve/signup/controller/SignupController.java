package com.evolve.signup.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signin.service.SigninService;
import com.evolve.signin.vo.SigninVo;
import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;
import com.evolve.util.CreateKey;
import com.evolve.util.IpGet;
import com.evolve.util.MailSendThread;

@Controller
public class SignupController {

	@Autowired
	SignupService signupService;
	
	@Autowired
	SigninService signinService;
	
	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		logger.info("userIdCheck 진입");
		logger.info("전달받은 id:" + id);
		int cnt = signupService.memberIdSelect(id);
		logger.info("확인 결과:" + cnt);
		return cnt;
	}


	@RequestMapping(value = "/terms_agreement", method = { RequestMethod.GET })
	public ModelAndView signup(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("signup/su_TermsAgreement");
		return mv;
	}

	@RequestMapping(value = "/identity_verification", method = { RequestMethod.GET })
	public ModelAndView identity_verification(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_IdentityVerification");

		return mv;
	}

	@RequestMapping(value = "/identity_verification", method = { RequestMethod.POST })
	public ModelAndView identity_verification_Create(HttpServletRequest request, SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/welcome");
		HttpSession session = request.getSession();
		System.out.println(signupvo.getSignup_type());
		System.out.println("광고성 동의여부 = " + request.getParameter("add_agreement"));
		
		if (signupvo.getId() != null && signupvo.getPw() != null) {

			// 회원가입
			signupService.signupInsert(signupvo);
			System.out.println(signupvo.getId());
			// memberSeq 찾기
			int memberSeq = signupService.memberSeqSelect(signupvo.getId());
			// 약관 필수 동의
			signupService.agreementInsert(memberSeq);
			// 선택동의(광고성)
			if (request.getParameter("add_agreement").equals("Y")) {
				signupService.optionalInsert(memberSeq);
			}
			SigninVo signinvo = new SigninVo();
			signinvo.setId(signupvo.getId());
			signinvo.setPw(signupvo.getPw());
			SigninVo signinProcess = signinService.signinId(signinvo);
			
			session.setAttribute("user_id", signupvo.getId());
			session.setAttribute("user_name", signinProcess.getName());
			session.setAttribute("user_birth", signinProcess.getBirth());
			session.setAttribute("user_phone", signinProcess.getPhone());
			session.setAttribute("user_email", signinProcess.getEmail());
			session.setAttribute("user_signuptype", signinProcess.getSignup_type());
			session.setAttribute("user_signupdate", signinProcess.getSignup_date());
			 
	        IpGet ipget = new IpGet();
	        String ip = ipget.getUserIP(request);
	        signinService.loginLogInsert(signinProcess.getSeq(),ip);
			System.out.println("접속 IP : "+ip);
			System.out.println("로그인 성공");
		}

		return mv;
	}

	@RequestMapping(value = "/welcome", method = { RequestMethod.GET })
	public String welcome() {
		return "signup/su_Welcome";
	}
	
	@RequestMapping(value = "/emailauth", method = { RequestMethod.GET })
	public String emailAuth() {
		return "signup/emailAuth";
	}
	
	@PostMapping("/emailauthcheck")
	@ResponseBody
	public void emailAuthCheck(@RequestParam("email") String email,HttpServletRequest request) {
		logger.info("emailAuthCheck 진입");
		logger.info("전달받은 email:" + email);
		MailSendThread mailSendThread = new MailSendThread(mailSender, email);
	    String authKey = mailSendThread.mailSend();
		//String authKey = CreateKey.getCreateKey();
		IpGet getIp = new IpGet();
		String ip = getIp.getUserIP(request);
	    logger.info("Key : "+authKey);
	    signupService.emailAuthInsert(authKey,email,ip);
	    logger.info("메일 보내기 성공");
		
	}
	
	@PostMapping("/emailauthkeycheck")
	@ResponseBody
	public int emailAuthKeyCheck(@RequestParam("mailAuthKey") String mailAuthKey,@RequestParam("email") String email,HttpServletRequest request) {
		logger.info("emailAuthKeyCheck 진입");
		logger.info("전달받은 email:" + email);
		logger.info("전달받은 mailAuthKey:" + mailAuthKey);
		IpGet getIp = new IpGet();
	    String ip = getIp.getUserIP(request);
	    int cnt = signupService.emailAuthKeySelect(email,mailAuthKey,ip);
	    if (cnt == 1) {
	    	signupService.emailAuthKeyDelete(email,mailAuthKey,ip);
	    }
	    logger.info("전달받은 cnt:" + cnt);
	    HttpSession session = request.getSession();
	    if(session.getAttribute("prototype_user_signupId") != null) {
	    	session.removeAttribute("prototype_user_signupId");
	    }
	    if(session.getAttribute("prototype_user_signupType") != null) {
	    	session.removeAttribute("prototype_user_signupType");
	    }
	    session.setAttribute("prototype_user_signupId", email);
	    session.setAttribute("prototype_user_signupType", "email");
	    
	    return cnt;
	}
	
	// 핸드폰 인증번호 저장
	@PostMapping("/phoneauthcheck")
	@ResponseBody
	public void phoneauthcheck(@RequestParam("phone") String phone,HttpServletRequest request) {
		logger.info("emailAuthCheck 진입");
		logger.info("전달받은 phone:" + phone);
		String authKey = "asd123";
	    IpGet getIp = new IpGet();
	    String ip = getIp.getUserIP(request);
	    logger.info("Key : "+authKey);
	    signupService.emailAuthInsert(authKey,phone,ip);
	    logger.info("핸드폰 인증번호 보내기 성공");
		
	}
	
	
	// 핸드폰 인증 번호 체크
	@PostMapping("/phoneauthkeycheck")
	@ResponseBody
	public int phoneauthkeycheck(@RequestParam("phoneAuthKey") String phoneAuthKey,@RequestParam("phone") String phone,HttpServletRequest request) {
		logger.info("emailAuthKeyCheck 진입");
		logger.info("전달받은 phone:" + phone);
		logger.info("전달받은 phoneAuthKey:" + phoneAuthKey);
		IpGet getIp = new IpGet();
	    String ip = getIp.getUserIP(request);
	    int cnt = signupService.emailAuthKeySelect(phone,phoneAuthKey,ip);
	    if (cnt == 1) {
	    	signupService.emailAuthKeyDelete(phone,phoneAuthKey,ip);
	    }
	    logger.info("전달받은 cnt:" + cnt);
	    HttpSession session = request.getSession();
	    if(session.getAttribute("prototype_user_signupId") != null) {
	    	session.removeAttribute("prototype_user_signupId");
	    }
	    if(session.getAttribute("prototype_user_signupType") != null) {
	    	session.removeAttribute("prototype_user_signupType");
	    }
	    session.setAttribute("prototype_user_signupId", phone);
	    session.setAttribute("prototype_user_signupType", "phone");
	    
	    return cnt;
	}
}
