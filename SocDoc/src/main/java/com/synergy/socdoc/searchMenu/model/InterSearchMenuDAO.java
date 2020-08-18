package com.synergy.socdoc.searchMenu.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.PharmacyVO;

public interface InterSearchMenuDAO {
	
	//병원 지도
	List<HpInfoVO> searchHospitalSelect();
	
	int getTotalCountMapHp(HashMap<String, String> paraMap);
	
	List<HpInfoVO> mapHospitalListSearchWithPaging(HashMap<String, String> paraMap);

	//병원 - 일반
	int getTotalCountHp(HashMap<String, String> paraMap);

	List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap);


	
	//약국 - 지도
	List<PharmacyVO> searchPharmacySelect();
	
	int getTotalCountMapPh(HashMap<String, String> paraMap);

	List<PharmacyVO> mapPharmacyListSearchWithPaging(HashMap<String, String> paraMap);

	//약국 - 일반
	int getTotalCountPh(HashMap<String, String> paraMap);

	List<PharmacyVO> pharmacyListSearchWithPaging(HashMap<String, String> paraMap);
	
	
	
	
	//민간구급차 API AJax List
	HashMap<String, String> getAmList(HashMap<String, String> paraMap);

	


}
