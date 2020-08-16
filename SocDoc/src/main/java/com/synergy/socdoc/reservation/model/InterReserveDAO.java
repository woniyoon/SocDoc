package com.synergy.socdoc.reservation.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveDAO {

	String getContent();

	MemberVO viewMyinfo(String userid); // 환자정보 가져오기(내자신)

	//List<HashMap<String, String>> hpinfovoList(HashMap<String, String> paraMap); // 병원정보 정렬하기

	List<String> deptIdList(); // 진료과목 가져오기 

	int getTotalCount(HashMap<String, String> paraMap);

	List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap);

	//List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap);

	//List<HpInfoVO> searchWithPaging(HashMap<String, String> paraMap);
/*
	List<HpInfoVO> hpinfovoListSearchWithPaging(HashMap<String, String> paraMap);

	List<HpInfoVO> searchWithPaging(HashMap<String, String> paraMap);

	List<HpInfoVO> boardListSearchWithPaging(HashMap<String, String> paraMap);
*/



}
