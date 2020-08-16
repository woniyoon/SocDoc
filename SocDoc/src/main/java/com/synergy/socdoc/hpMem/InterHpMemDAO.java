package com.synergy.socdoc.hpMem;

import java.util.*;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterHpMemDAO {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(HashMap<String, String> paraMap);

	public HpInfoVO getHpInfoDetail(String submitId);

	public List<HashMap<String, String>> getScheduleTbl(String submitId);

	public List<HashMap<String, String>> getOpeningHours(String hpSeq);

	public List<HashMap<String, String>> getRecentReviews(String hpSeq);

	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap);

	// JOIN 해 온 테이블의 행 개수
	public int getNumOfVisitors(HashMap<String, String> paraMap);

	public int submitInfo(HpInfoVO hpInfoVO);

	public int submitSchedule(List<HashMap<String, String>> scheduleList);

	// JOIN 없는 특정 테이블 행의 총 개수 가져오기 
	public int getNumOfItems(HashMap<String, String> paraMap);

	// 병원 리뷰 목록 가져오기
	public List<HpReviewVO> getHpReviews(HashMap<String, String> paraMap);

	// 방문예정자 목록 가져오기
	public List<HashMap<String, String>> getVisitorsList(HashMap<String, String> paraMap);

	// 방문상태 업데이트
	public int updateVisitStatus(HashMap<String, Integer> paraMap);

	// 방문자 상세정보 가져오기
	public MemberVO getVisitorDetail(String userid);

	// 특정 회원의 방문이력 가져오기 
	public List<String> getVisitRecord(HashMap<String, String> paraMap);

	// 방문이력 개수 가져오기
	public int getNumOfRecords(HashMap<String, String> paraMap);

	// 선택한 날짜 시간대별 방문자수
	public List<HashMap<String, String>> getNumPerHour(HashMap<String, String> paraMap);
	
	// 비밀번호 확인
	public int verifyPwd(HashMap<String, String> paraMap);

	// 병원 회원 정보 업데이트(담당자명/이메일)
	public int updateAccountInfo(HashMap<String, String> paraMap);

	// 병원 회원 정보 업데이트(비밀번호)
	public int updateHpPwd(HashMap<String, String> paraMap);

	// 이전 신청 내역들 취소하기
	public int cancelPrevSubmission(String hpSeq);

	// 현재 선택한 신청 내역 취소하기
	public int cancelCurrentSubmission(String submitId);

}
