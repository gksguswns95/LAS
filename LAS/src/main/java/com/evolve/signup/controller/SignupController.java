package com.evolve.signup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.evolve.signup.service.SignupService;
import com.evolve.signup.vo.SignupVO;

@Controller
public class SignupController {
	
	@Autowired
	SignupService signupService;

	
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	
	@PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id){
        logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+id);
        int cnt = signupService.memberSeqSelect(id);
        logger.info("확인 결과:"+cnt);
        return cnt;
    }
	
	@RequestMapping(value= "/terms_agreement", method= {RequestMethod.GET})
	public ModelAndView signup(HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("signup/su_TermsAgreement");
		return mv;
	}
	
	@RequestMapping(value= "/identity_verification", method= {RequestMethod.GET})
	public ModelAndView identity_verification(HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_IdentityVerification");
		mv.addObject("checkbox",request.getParameter("checkboxYN"));
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("checkboxYN"));
		
		
		return mv;
	}
	
	@RequestMapping(value = "/identity_verification" ,method = {RequestMethod.POST})
	public ModelAndView identity_verification_Create(HttpServletRequest requset,SignupVO signupvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signup/su_Welcome");
		System.out.println(signupvo.getSignup_type());
		
		if(signupvo.getId() != null && signupvo.getPw() != null) {
			
			//아이디 중복 확인
			int duplicateId = signupService.memberSeqSelect(signupvo.getId());
			
			
			//분리작업
			
			if(duplicateId == 0) {
				//회원가입
				signupService.signupInsert(signupvo);
				System.out.println(signupvo.getId());
				//memberSeq 찾기
				int memberSeq = signupService.memberSeqSelect(signupvo.getId());
				//약관 필수 동의
				signupService.agreementInsert(memberSeq);
				//선택동의(광고성)
				if(requset.getParameter("add_agreement") == "Y") {
					signupService.optionalInsert(memberSeq);				
				}				
			} else {
				mv.setViewName("signup/su_IdentityVerification");
			}
		}
		
		
		return mv;
	}
	
	
	@RequestMapping(value= "/welcome", method= {RequestMethod.GET})
	public String welcome() {
		return "signup/su_Welcome";
	}
	
	
}
