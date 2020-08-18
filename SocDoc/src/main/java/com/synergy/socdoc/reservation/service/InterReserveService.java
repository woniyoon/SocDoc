package com.synergy.socdoc.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterReserveService {

		String getContent();

		//List<HpInfoVO> hospital_select(); // 병원 정보 가져오기

		MemberVO viewMyinfo(String userid); // 환자정보 확인하기

		/*List<HpInfoVO> hpinfovoList(HashMap<String, Object> paraMap);*/

		List<String> deptIdList();

		//List<HpInfoVO> hpinfovoList();

		List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap);

		int getTotalCount(HashMap<String, Object> paraMap);// 먼저 총 게시물 건수(totalCount)를 구해와야한다

		List<HpInfoVO> searchwWithPaging(HashMap<String, Object> paraMap);//검색기능있는 병원목록보여주기

		List<String> getHours(HashMap<String, String> paraMap);	// 가능한 시간대 가져오기 

		List<HashMap<String, String>> getOpeningHours(String hpSeq);	// 특정 병원의 영업시간 가져오기

		int makeReservation(HashMap<String, String> paraMap); // 예약완료 페이지 요청 

		String getReservSeq(HashMap<String, String> paraMap); // 예약시퀀스 가져오기(예약번호)

		MemberVO selectMemberInfo(String userid); 

	}

