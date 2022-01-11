package com.evolve.modify.service; 

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evolve.modify.mapper.ModifyMapper;
import com.evolve.modify.vo.ModifyVo;
import com.evolve.signup.vo.SignupVO;

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

	public int nameEmailCheck(String name, String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		return mapper.nameEmailCheck(map);
	}

//	public int nameBirthCheck(String name, String birth) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("name", name);
//		map.put("birth", birth);
//		return mapper.nameBirthCheck(map);
//	}
	
	public List<SignupVO> nameBirthCheck(String name, String birth) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("birth", birth);
		return mapper.nameBirthCheck(map);
	}

	public HashMap<String, Object> namebirthidcheck(String name, String birth, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("birth", birth);
		map.put("id", id);
		return mapper.namebirthidcheck(map);
	}

	public void modifyPassword(HashMap<String, Object> map) {
		mapper.modifyPassword(map);
	}

}