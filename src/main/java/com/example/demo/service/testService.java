package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.testDao;
import com.example.demo.dto.testDto;

@Service
public class testService {
	@Autowired
	private testDao testdao;

	public int dbtest() {
		
		return testdao.dbtest();
	}

}
