package com.evolve.modify.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.evolve.modify.vo.ModifyVo;

@Repository 
@Mapper 
public interface ModifyMapper {
	void accountModify(HashMap<String, Object> map); 
}