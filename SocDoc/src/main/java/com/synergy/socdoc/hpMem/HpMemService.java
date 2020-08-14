package com.synergy.socdoc.hpMem;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;

@Service
public class HpMemService implements InterHpMemService {

	@Autowired
	private InterHpMemDAO dao;
	
	@Override
	public HpInfoVO getHpInfo(String hpSeq) {
		HpInfoVO hpInfo = dao.getHpInfo(hpSeq);
		
		return hpInfo;
	}

	// 신청테이블에서 정보 가져오기
	@Override
	public List<HpInfoVO> getInfoUpdateList(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpInfoList = dao.getInfoUpdateList(paraMap);
		return hpInfoList;
	}

	// 병원 상세 정보 가져오기
	@Override
	public HpInfoVO getHpInfoDetail(String submitId) {
		HpInfoVO hpInfoDetail = dao.getHpInfoDetail(submitId);
		return hpInfoDetail;
	}

	// 영업시간 가져오기 (상세정보)
	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = dao.getOpeningHours(hpSeq);
		return openingHours;
	}

	// 스케줄표 가져오기 (메인)
	@Override
	public List<HashMap<String, String>> getScheduleTbl(String submitId) {
		List<HashMap<String, String>> scheduleTbl = dao.getScheduleTbl(submitId);
		return scheduleTbl;
	}
	
	// 최근 리뷰 3개만 가져오기 (메인)
	@Override
	public List<HashMap<String, String>> getRecentReviews(String hpSeq) {
		List<HashMap<String, String>> reviewList = dao.getRecentReviews(hpSeq);
		return reviewList;
	}

	// 방문자 목록 가져오기
	@Override
	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> visitorsList = dao.getVisitors(paraMap);
		return visitorsList;
	}

	// 총 방문자수 (페이징용)
	@Override
	public int getNumOfVisitors(HashMap<String, String> paraMap) {
		int numOfVisitors = dao.getNumOfVisitors(paraMap);
		return numOfVisitors;
	}

	// 병원 상세정보 신청 삽입하기
	@Override
	public int submitInfo(HpInfoVO hpInfoVO) {
		int result = dao.submitInfo(hpInfoVO);
		return result;
	}

	// 병원 스케줄 신청 삽입하기
	@Override
	public int submitSchedule(List<HashMap<String, String>> scheduleList) {
		int result = dao.submitSchedule(scheduleList);
		return result;
	}

	// 특정 테이블 행의 총 개수 가져오기 (페이징)
	@Override
	public int getNumOfItems(HashMap<String, String> paraMap) {
		int num = dao.getNumOfItems(paraMap);
		return num;
	}

	// 병원 후기 목록 가져오기 
	@Override
	public List<HpReviewVO> getHpReviews(HashMap<String, String> paraMap) {
		List<HpReviewVO> reviewList = dao.getHpReviews(paraMap);
		return reviewList;
	}

	// 방문예정자 목록 가져오기
	@Override
	public List<HashMap<String, String>> getVisitorsList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> visitorsList = dao.getVisitorsList(paraMap);
		return visitorsList;
	}

	// 방문상태 업데이트
	@Override
	public int updateVisitStatus(HashMap<String, Integer> paraMap) {
		int result = dao.updateVisitStatus(paraMap);
		return result;
	}

	// 방문자 상세정보 가져오기
	@Override
	public MemberVO getVisitorDetail(String userid) {
		MemberVO member = dao.getVisitorDetail(userid);
		return member;
	}

	// 특정 회원의 방문이력 가져오기 
	@Override
	public List<String> getVisitRecord(HashMap<String, String> paraMap) {
		List<String> record = dao.getVisitRecord(paraMap);
		return record;
	}
	
	// 방문이력 개수 가져오기
	@Override
	public int getNumOfRecords(HashMap<String, String> paraMap) {
		int numOfRecords = dao.getNumOfRecords(paraMap);
		return numOfRecords;
	}

	
	

}
