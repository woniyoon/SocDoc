package com.synergy.socdoc.reservation.model;

import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterReserveDAO {

	String getContent();

	List<HpInfoVO> hospital_select(); //병원 페이지 정렬

}
