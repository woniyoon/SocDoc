package com.synergy.socdoc.reservation.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveDAO {

	String getContent();

	List<HpInfoVO> hospital_select(); //병원 페이지 정렬

	MemberVO viewMyinfo(String userid); // 환자정보 가져오기(내자신)

	List<String> deptList(); // 진료과목 가져오기

	//List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap); 
	// 진료과목 조건에 만족하는 병원 가져오기 



}
