package com.synergy.socdoc.reservation.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveDAO {

	String getContent();

	List<HpInfoVO> hospital_select(); //병원 페이지 정렬

	MemberVO viewMyinfo(String userid);



}
