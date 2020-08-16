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
	
	// 즐겨찾기
	@Override
	public int readBookMark(HashMap<String, String> paraMap) {
		int n = dao.readBookMark(paraMap);
		return n;
	}
	
	@Override
	public int delBookMark(HashMap<String, String> paraMap) {
		int n = dao.delBookMark(paraMap);
		return n;
	}

	@Override
	public int addBookMark(HashMap<String, String> paraMap) {
		int n = dao.addBookMark(paraMap);
		return n;
	}

	// 리뷰
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

	@Override
	public int reviewDelete(HashMap<String, String> paraMap) {
		int n = dao.reviewDelete(paraMap);
		return n;
	}

	@Override
	public int addReview(HashMap<String, String> paraMap) {
		int n = dao.addReview(paraMap);
		return n;
	}

	

	

}
