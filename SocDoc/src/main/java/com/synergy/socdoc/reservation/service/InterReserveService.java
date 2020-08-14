package com.synergy.socdoc.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveService {

		String getContent();

		List<HpInfoVO> hospital_select(); // 병원 정보 가져오기

		MemberVO viewMyinfo(String userid);

	}

