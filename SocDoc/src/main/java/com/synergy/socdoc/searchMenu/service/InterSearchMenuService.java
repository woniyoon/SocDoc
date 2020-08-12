package com.synergy.socdoc.searchMenu.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.PharmacyVO;

public interface InterSearchMenuService {

	List<HpInfoVO> searchHospitalSelect();
	
	//민간구급차 API
	String getAmList(String city);

	List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap);

	int getTotalCountHp(HashMap<String, String> paraMap);

	List<HpInfoVO> mapHospitalListSearchWithPaging(HashMap<String, String> paraMap);

	int getTotalCountMapHp(HashMap<String, String> paraMap);


}
