package com.evolve.signup.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evolve.signup.mapper.SignupMapper;
import com.evolve.signup.vo.SignupVO;

@Service
public class SignupService {
	
	@Autowired
	SignupMapper mapper;
	
	public void signupInsert(SignupVO signupvo) {
		mapper.signupInsert(signupvo);
	}

	public int memberSeqSelect(String id) {
		return mapper.memberSeqSelect(id);
	}

	public void agreementInsert(int memberSeq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberSeq", memberSeq);
		map.put("name", "agreement");
		mapper.agreementInsert(map);
		map.remove("name");
		map.put("name", "privacy_rule");
		mapper.agreementInsert(map);
	}

	public void optionalInsert(int memberSeq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberSeq", memberSeq);
		map.put("name", "add_agreement");
		mapper.optionalInsert(map);
		
	}

	public int memberIdSelect(String id) {
		return mapper.memberIdSelect(id);
	}

	public void emailAuthInsert(String authKey, String email, String ip) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("authKey", authKey);
		map.put("email", email);
		map.put("ip", ip);
		mapper.emailAuthInsert(map);
	}

	public int emailAuthKeySelect(String email, String mailAuthKey, String ip) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("authKey", mailAuthKey);
		map.put("email", email);
		map.put("ip", ip);
		return mapper.emailAuthKeySelect(map);
	}

	public void emailAuthKeyDelete(String email, String mailAuthKey, String ip) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("authKey", mailAuthKey);
		map.put("email", email);
		map.put("ip", ip);
		mapper.emailAuthKeyDelete(map);
	}

	public void emailAuthTimeUpdate(String id, String ip) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("authKey", id);
		map.put("ip", ip);
		mapper.emailAuthTimeUpdate(map);
	}

}
