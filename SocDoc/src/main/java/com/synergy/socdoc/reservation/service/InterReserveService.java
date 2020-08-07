package com.synergy.socdoc.reservation.service;

import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterReserveService {

		String getContent();

		List<HpInfoVO> hospital_list(); // 병원 정보 가져오기
	}

