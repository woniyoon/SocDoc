package com.synergy.socdoc.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.detail.model.InterDetailDAO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.PharReviewVO;
import com.synergy.socdoc.member.PharmacyVO;

@Service
public class DetailService implements InterDetailService {

	
	@Autowired
	private InterDetailDAO dao;
	
	
	//------------  병원
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

	
	//--------------- 약국
	
	@Override
	public PharmacyVO pharmacyDetail(String phSeq) {
		PharmacyVO phDetail = dao.pharmacyDetail(phSeq);
		return phDetail;
	}

	@Override
	public String pharmacyRating(String phSeq) {
		String pharmacyRating = dao.pharmacyRating(phSeq);
		return pharmacyRating;
	}

	@Override
	public PharReviewVO getPhReviewMe(HashMap<String, String> paraMap) {
		PharReviewVO reviewMe = dao.getPhReviewMe(paraMap);
		return reviewMe;
	}

	@Override
	public List<PharReviewVO> getPhReview(HashMap<String, String> paraMap) {
		List<PharReviewVO> getPhReview = dao.getPhReview(paraMap);
		return getPhReview;
	}

	@Override
	public int getReviewTotalCountPh(HashMap<String, String> paraMap) {
		int reviewTotlaCount = dao.getReviewTotalCountPh(paraMap);
		return reviewTotlaCount;
	}

	@Override
	public int reviewDeletePh(HashMap<String, String> paraMap) {
		int n = dao.reviewDeletePh(paraMap);
		return n;
	}

	@Override
	public int addReviewPh(HashMap<String, String> paraMap) {
		int n = dao.addReviewPh(paraMap);
		return n;
	}

	

	

}
