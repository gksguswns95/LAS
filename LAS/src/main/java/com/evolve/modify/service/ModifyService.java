package com.evolve.modify.service; 

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evolve.modify.mapper.ModifyMapper;
import com.evolve.modify.vo.ModifyVo;

@Service
public class ModifyService {
	
	@Autowired 
	public ModifyMapper mapper; 
	
	public void accountModify(HashMap<String, Object> map) {
		System.out.println("회원정보수정 서비스 진행");
		mapper.accountModify(map);
	}

	public int accountModifyConfirmPassword(HashMap<String, Object> map) {
		return mapper.accountModifyConfirmPassword(map);
	}

	public void accountModifyPassword(HashMap<String, Object> map) {
		mapper.accountModifyPassword(map);
	}

}