package com.evolve.signin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.evolve.signin.vo.SigninVo; 

@Repository 
@Mapper 
public interface SigninMapper {
	SigninVo signinId(SigninVo signinvo);
	void loginLogInsert(int seq, String ip); 
}