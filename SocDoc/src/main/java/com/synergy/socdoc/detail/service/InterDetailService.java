package com.synergy.socdoc.detail.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.PharReviewVO;
import com.synergy.socdoc.member.PharmacyVO;

public interface InterDetailService {

	
	///////////// 병원
	
	HpInfoVO hospitalDetail(String hpSeq);

	String hospitalRating(String hpSeq);
	
	// 즐겨찾기
	int readBookMark(HashMap<String, String> paraMap);
	
	int delBookMark(HashMap<String, String> paraMap);

	int addBookMark(HashMap<String, String> paraMap);

	// 리뷰
	HpReviewVO getHpReviewMe(HashMap<String, String> paraMap);

	List<HpReviewVO> getHpReview(HashMap<String, String> paraMap);

	int getReivewTotalCount(HashMap<String, String> paraMap);

	int reviewDelete(HashMap<String, String> paraMap);

	int addReview(HashMap<String, String> paraMap);

	
	
	///////////// 약국
	
	PharmacyVO pharmacyDetail(String phSeq);

	String pharmacyRating(String phSeq);

	PharReviewVO getPhReviewMe(HashMap<String, String> paraMap);

	List<PharReviewVO> getPhReview(HashMap<String, String> paraMap);

	int getReviewTotalCountPh(HashMap<String, String> paraMap);

	int reviewDeletePh(HashMap<String, String> paraMap);

	int addReviewPh(HashMap<String, String> paraMap);

	




}
