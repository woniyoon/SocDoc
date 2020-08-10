package com.synergy.socdoc.searchMenu.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterSearchMenuDAO {

	List<HpInfoVO> searchHospitalSelect();
	
	//민간구급차 API AJax List
	String getAmList(String city);

	List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap);

	int getTotalCount(HashMap<String, String> paraMap);


}
