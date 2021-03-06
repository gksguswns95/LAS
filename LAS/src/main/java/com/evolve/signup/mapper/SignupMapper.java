package com.evolve.signup.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.evolve.signup.vo.SignupVO;

@Repository 
@Mapper 
public interface SignupMapper {
	void signupInsert(SignupVO signupvo);
	int memberSeqSelect(String id);
	void agreementInsert(HashMap<String, Object> map);
	void optionalInsert(HashMap<String, Object> map);
	int memberIdSelect(String id);
	void emailAuthInsert(HashMap<String, Object> map);
	int emailAuthKeySelect(HashMap<String, Object> map);
	void emailAuthKeyDelete(HashMap<String, Object> map);
	void emailAuthTimeUpdate(HashMap<String, Object> map);
}
