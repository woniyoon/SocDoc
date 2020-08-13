package com.synergy.socdoc.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.QnaBoardVO;
import com.synergy.socdoc.member.ReservationVO;

public interface InterMyPageService {

	int getTotalCount(HashMap<String, String> paraMap);  // 총 게시물 건수(totalCount)를 구하기(검색이 있을때와 검색이 없을때로 나뉜다.)

	List<QnaBoardVO> boardListSearchWithPaging(HashMap<String, String> paraMap);  // 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)

	QnaBoardVO getView(String qnaSeq, String userid); // 글조회수 증가와 함께 글1개를 조회를 해주는 것 

	QnaBoardVO getViewWithNoAddCount(String qnaSeq); // 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.

	int del(HashMap<String, String> paraMap) throws Throwable; // 문의내역 1개글 삭제하기 (글)

	int goDel(Map<String, Object> paraMap); // 문의내역 글 삭제하기(목록)

	int goDel(String qnaSeq); // 문의내역 글 삭제하기(목록)

	MemberVO viewMyHealth(String userid); // 내 건강 페이지 보이기(select)
	
	List<MemberVO> viewMyHealthTest();
	
	int updateHealth(HashMap<String, String> paraMap); // 내 건강 새로 저장하기(update)
	
	int updateHealth(String userid);
	
	int insertHealth(MemberVO membervo); // 내 건강 새로 저장하기(insert)

	int delHealth(String userid); // 내 건강 페이지 삭제하기(delete)

	int getTotalBookMarkCount(HashMap<String, String> paraMap); // 즐겨찾기 게시판 불러오기

	List<HashMap<String, String>> bookMarkListSearchWithPaging(HashMap<String, String> paraMap); // 페이징 처리한 즐겨찾기목록 가져오기

	String userid(); // 즐겨찾기에서 userid 들고오기

	int getTotalCountReservation(HashMap<String, String> paraMap); // 예약확인 갯수 구하기

	List<HashMap<String, String>> reservationListSearchWithPaging(HashMap<String, String> paraMap); // 예약확인 페이지 목록 불러오기

	int goDelBM(String bookSeq); // 즐겨찾기에서 목록 삭제하기 

	List<HashMap<String, String>> historyListSearchWithPaging(HashMap<String, String> paraMap); // 진료이력조회


	// String getHourSeq(HashMap<String, String> paraMap); // 방문예정 시간 구하기

	

	

	

	

	

	

	

	
	
	

	
	
	


}
