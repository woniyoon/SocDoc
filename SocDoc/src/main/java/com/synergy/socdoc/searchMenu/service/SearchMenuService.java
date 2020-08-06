package com.synergy.socdoc.searchMenu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.searchMenu.model.InterSearchMenuDAO;

@Service
public class SearchMenuService implements InterSearchMenuService {

	@Autowired
	private InterSearchMenuDAO dao;
		
	@Override
	public List<HpInfoVO> searchHospitalSelect() {
		List<HpInfoVO> hpMap = dao.searchHospitalSelect();
		return hpMap;
	}

	
}
