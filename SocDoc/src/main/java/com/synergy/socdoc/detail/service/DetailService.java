package com.synergy.socdoc.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.detail.model.InterDetailDAO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

@Service
public class DetailService implements InterDetailService {

	
	@Autowired
	private InterDetailDAO dao;
	
	@Override
	public HpInfoVO hospitalDetail(String hpSeq) {
		HpInfoVO hpDetail = dao.hospitalDetail(hpSeq);
		return hpDetail;
	}

	@Override
	public String hospitalRating(String hpSeq) {
		String hospitalRating = dao.hospitalRating(hpSeq);
		return hospitalRating;
	}

	@Override
	public List<HpReviewVO> getHpReview(HashMap<String, String> paraMap) {
		List<HpReviewVO> getHpReview = dao.getHpReview(paraMap);
		return getHpReview;
	}

	@Override
	public int getReivewTotalCount(HashMap<String, String> paraMap) {
		int reviewTotlaCount = dao.getReviewTotalCount(paraMap);
		return reviewTotlaCount;
	}

	@Override
	public HpReviewVO getHpReviewMe(HashMap<String, String> paraMap) {
		HpReviewVO reviewMe = dao.getHpReviewMe(paraMap);
		return reviewMe;
	}

}
