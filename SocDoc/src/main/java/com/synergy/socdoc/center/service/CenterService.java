package com.synergy.socdoc.center.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.center.model.InterCenterDAO;

@Service
public class CenterService implements InterCenterService {

	
	@Autowired
	private InterCenterDAO dao;

	@Override
	public List<HashMap<String, String>> faqSelect() {
		List<HashMap<String,String>> faqList = dao.faqSelect();
		return faqList;
	}
	
}
