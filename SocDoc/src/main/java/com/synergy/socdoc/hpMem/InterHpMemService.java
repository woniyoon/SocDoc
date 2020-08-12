package com.synergy.socdoc.hpMem;

import java.util.*;

import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public interface InterHpMemService {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(HashMap paraMap);

	// 병원 정보 리스트 개수 가져오기 
	public int getNumOfUpdates(String hpSeq);

	// 병원 정보 관리에서 행을 클릭했을 때 구체적인 정보를 가져옴
	public HpInfoVO getHpInfoDetail(String submitId);

	// 병원 영업시간 가져오기
	public List<HashMap<String, String>> getOpeningHours(String hpSeq);

	// 신청테이블에서 병원의 오픈/클로즈 스케줄 가져오기
	public List<HashMap<String, String>> getScheduleTbl(String submitId);

	// 최근 리뷰 3개만 가져오기
	public List<HashMap<String, String>> getRecentReviews(String hpSeq);

	// 병원 방문자 목록 가져오기
	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap);

	// 총 방문자 수 가져오기
	public int getNumOfVisitors(HashMap<String, String> paraMap);

	// 병원 상세정보 신청 삽입하기
	public int submitInfo(HpInfoVO hpInfoVO);

	// 병원 오픈시간 신청 삽입하기
	public int submitSchedule(List<HashMap<String, String>> scheduleList);



	
}
