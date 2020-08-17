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
		
	
	// 병원 - 지도
	@Override
	public List<HpInfoVO> searchHospitalSelect() {
		List<HpInfoVO> hpMap = dao.searchHospitalSelect();
		return hpMap;
	}
	
	@Override
	public int getTotalCountMapHp(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCountMapHp(paraMap);
		return totalCount;
	}
	
	@Override
	public List<HpInfoVO> mapHospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> mapHpList = dao.mapHospitalListSearchWithPaging(paraMap);
		return mapHpList;
	}

	// 병원 - 일반
	@Override
	public int getTotalCountHp(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCountHp(paraMap);
		return totalCount;
	}
	
	@Override
	public List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = dao.hospitalListSearchWithPaging(paraMap);
		return hpList;
	}

	

	
	// 약국 - 지도
	@Override
	public List<PharmacyVO> searchPharmacySelect() {
		List<PharmacyVO> phMap = dao.searchPharmacySelect();
		return phMap;
	}

	@Override
	public int getTotalCountMapPh(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCountMapPh(paraMap);
		return totalCount;
	}

	@Override
	public List<PharmacyVO> mapPharmacyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<PharmacyVO> mapPhList = dao.mapPharmacyListSearchWithPaging(paraMap);
		return mapPhList;
	}

	// 약국 - 일반
	@Override
	public int getTotalCountPh(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCountPh(paraMap);
		return totalCount;
	}

	@Override
	public List<PharmacyVO> pharmacyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<PharmacyVO> phList = dao.pharmacyListSearchWithPaging(paraMap);
		return phList;
	}
	
	
	
	
	// 민간구급차
	@Override
	public HashMap<String,String> getAmList(String city) {
		return dao.getAmList(city);
	}

	
}
