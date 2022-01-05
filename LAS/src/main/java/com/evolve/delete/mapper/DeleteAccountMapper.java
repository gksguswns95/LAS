package com.evolve.delete.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.evolve.delete.vo.DeleteAccountVo;

@Repository 
@Mapper 
public interface DeleteAccountMapper {
	void deleteAccountMemberInsert(DeleteAccountVo deleteAccountvo);
	void deleteAccountMemberUpdate(String id);
	void deleteLoginLog(int memberSeq);
	void deleteEssential_ta(int memberSeq);
	void deleteOptional_ta(int memberSeq);
	void deleteMember(int memberSeq); 
}