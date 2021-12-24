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

}
