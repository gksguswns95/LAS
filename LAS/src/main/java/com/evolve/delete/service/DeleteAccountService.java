package com.evolve.delete.service; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evolve.delete.mapper.DeleteAccountMapper;
import com.evolve.delete.vo.DeleteAccountVo;

@Service
public class DeleteAccountService {
	
	@Autowired 
	public DeleteAccountMapper mapper;

	public void deleteAccountMemberInsert(DeleteAccountVo deleteAccountvo) {
		System.out.println("회원탈퇴 서비스 진행");
		mapper.deleteAccountMemberInsert(deleteAccountvo); 
	}

	public void deleteAccountMemberUpdate(String id) {
		System.out.println("회원탈퇴 사용자 수정 진행");
		mapper.deleteAccountMemberUpdate(id); 
	} 
	
	

}