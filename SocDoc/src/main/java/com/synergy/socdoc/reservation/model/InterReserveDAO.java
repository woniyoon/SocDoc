package com.synergy.socdoc.reservation.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveDAO {

	String getContent();

	MemberVO viewMyinfo(String userid); // 환자정보 가져오기(나)

	List<String> deptIdList(); // 진료과목 가져오기(병원) 

	int getTotalCount(HashMap<String, Object> paraMap); // 병원 전체 갯수

	List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap); // 병원 목록 가져오기(검색기능, 페이징 처리안한)

	List<HpInfoVO> searchwWithPaging(HashMap<String, Object> paraMap); // 병원 목록 가져오기(검색기능, 페이징 처리한)

	List<String> getHours(HashMap<String, String> paraMap);	// 예약가능한 시간 가져오기(병원달력)

	List<HashMap<String, String>> getOpeningHours(String hpSeq); // 병원 영업시간 가져오기 

	int makeReservation(HashMap<String, String> paraMap); // 예약완료페이지 요청 

	String getReservSeq(HashMap<String, String> paraMap); // 예약시퀀스 가져오기 

	MemberVO selectMemberInfo(String userid);


}
