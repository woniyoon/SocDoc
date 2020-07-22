package com.synergy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.model.InterDAO;

@Service
public class TestService implements InterService {
	
	@Autowired
	private InterDAO dao;

	@Override
	public String getContent() {
		String content = dao.getContent();
		return content;
	}

}
