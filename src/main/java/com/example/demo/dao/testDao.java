package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.testDto;

@Mapper
public interface testDao {

	int dbtest();

}
