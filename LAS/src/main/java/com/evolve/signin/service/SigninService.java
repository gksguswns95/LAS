package com.evolve.signin.service; 

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evolve.signin.mapper.SigninMapper;
import com.evolve.signin.vo.SigninVo; 

@Service
public class SigninService {
	
	@Autowired 
	public SigninMapper mapper; 
	
	public SigninVo signinId(SigninVo signinvo) {
		System.out.println("로그인 서비스 로그인 진행");
		return mapper.signinId(signinvo); 
	}
	
	public SigninVo signinId_del(String id) {
		return mapper.signinId_del(id); 
	}

	public void loginLogInsert(int seq,String ip) {
		System.out.println("로그인 체크 로그 진행");
		mapper.loginLogInsert(seq,ip); 
	}

	public String countrySelect(Long desimalIP) {
		return mapper.countrySelect(desimalIP);
	}

}