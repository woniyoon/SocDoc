package com.synergy.socdoc.searchMenu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.PharmacyVO;
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
	
	@Override
	public HashMap<String,String> getAmList(String city) {
		return dao.getAmList(city);
	}

	@Override
	public List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = dao.hospitalListSearchWithPaging(paraMap);
		return hpList;
	}

	@Override
	public int getTotalCountHp(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}

	@Override
	public List<HpInfoVO> mapHospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> mapHpList = dao.mapHospitalListSearchWithPaging(paraMap);
		return mapHpList;
	}

	@Override
	public int getTotalCountMapHp(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCountMapHp(paraMap);
		return totalCount;
	}

	
}
