package com.synergy.socdoc.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveService {

		String getContent();

		List<HpInfoVO> hospital_select(); // 병원 정보 가져오기

		MemberVO viewMyinfo(String userid); // 환자정보 확인하기

		List<String> deptList(); // 진료과목 가져오기 

		//List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap);
		// 조건에 만족하는 병원 가져오기 


	}

