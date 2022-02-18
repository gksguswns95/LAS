package com.evolve.modify.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.evolve.modify.vo.ModifyVo;
import com.evolve.signup.vo.SignupVO;

@Repository 
@Mapper 
public interface ModifyMapper {
	void accountModify(HashMap<String, Object> map);
	int accountModifyConfirmPassword(HashMap<String, Object> map);
	void accountModifyPassword(HashMap<String, Object> map);
	int nameEmailCheck(HashMap<String, Object> map);
	List<SignupVO> nameBirthCheck(HashMap<String, Object> map);
	HashMap<String, Object> namebirthidcheck(HashMap<String, Object> map);
	void modifyPassword(HashMap<String, Object> map);
	void resetPassword(HashMap<String, Object> map);
	void accountModify_ResetPassword(HashMap<String, Object> map); 
}