package com.synergy.socdoc.detail.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

public interface InterDetailDAO {

	HpInfoVO hospitalDetail(String hpSeq);

	String hospitalRating(String hpSeq);
	
	// 즐겨찾기
	int readBookMark(HashMap<String, String> paraMap);
	
	int delBookMark(HashMap<String, String> paraMap);

	int addBookMark(HashMap<String, String> paraMap);

	// 리뷰
	HpReviewVO getHpReviewMe(HashMap<String, String> paraMap);

	List<HpReviewVO> getHpReview(HashMap<String, String> paraMap);

	int getReviewTotalCount(HashMap<String, String> paraMap);

	int reviewDelete(HashMap<String, String> paraMap);

	int addReview(HashMap<String, String> paraMap);

	



}
