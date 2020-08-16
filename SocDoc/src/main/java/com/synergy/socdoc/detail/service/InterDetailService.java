package com.synergy.socdoc.detail.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

public interface InterDetailService {

	HpInfoVO hospitalDetail(String hpSeq);

	String hospitalRating(String hpSeq);

	// 리뷰
	HpReviewVO getHpReviewMe(HashMap<String, String> paraMap);

	List<HpReviewVO> getHpReview(HashMap<String, String> paraMap);

	int getReivewTotalCount(HashMap<String, String> paraMap);


}
