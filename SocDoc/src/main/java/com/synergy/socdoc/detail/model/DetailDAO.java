package com.synergy.socdoc.detail.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.PharReviewVO;
import com.synergy.socdoc.member.PharmacyVO;

@Repository
public class DetailDAO implements InterDetailDAO {

	@Autowired	
	private SqlSessionTemplate sqlsession;
	
	
	
	@Override
	public HpInfoVO hospitalDetail(String hpSeq) {
		HpInfoVO hpDetail = sqlsession.selectOne("detail.hospitalDetail",hpSeq);
		return hpDetail;
	}

	@Override
	public String hospitalRating(String hpSeq) {
		String hospitalRating = sqlsession.selectOne("detail.hospitalRating",hpSeq);
		return hospitalRating;
	}
	
	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = sqlsession.selectList("detail.getOpeningHours", hpSeq);
		return openingHours;
	}

	
	// 즐겨찾기
	@Override
	public int readBookMark(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("detail.readBookMark",paraMap);
		return n;
	}
	
	@Override
	public int delBookMark(HashMap<String, String> paraMap) {
		int n = sqlsession.delete("detail.delBookMark",paraMap);
		return n;
	}

	@Override
	public int addBookMark(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("detail.addBookMark",paraMap);
		return n;
	}
	
	// 내리뷰
	@Override
	public HpReviewVO getHpReviewMe(HashMap<String, String> paraMap) {
		HpReviewVO reviewMe = sqlsession.selectOne("detail.getHpReviewMe", paraMap);
		return reviewMe;
	}

	// 리뷰 읽어오기
	@Override
	public List<HpReviewVO> getHpReview(HashMap<String, String> paraMap) {
		List<HpReviewVO> getHpReview = sqlsession.selectList("detail.getHpReview",paraMap);
		return getHpReview;
	}

	@Override
	public int getReviewTotalCount(HashMap<String, String> paraMap) {
		int reviewTotalCount = sqlsession.selectOne("detail.getReviewTotalCount",paraMap);
		return reviewTotalCount;
	}

	//리뷰 삭제
	@Override
	public int reviewDelete(HashMap<String, String> paraMap) {
		int n = sqlsession.delete("detail.reviewDelete", paraMap);
		return n;
	}

	@Override
	public int addReview(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("detail.addReview", paraMap);
		return n;
	}

	
	
	// -------------- 약국
	@Override
	public PharmacyVO pharmacyDetail(String pharmSeq) {
		PharmacyVO phDetail = sqlsession.selectOne("detail.pharmacyDetail",pharmSeq);
		return phDetail;
	}

	@Override
	public String pharmacyRating(String pharmSeq) {
		String pharmacyRating = sqlsession.selectOne("detail.pharmacyRating",pharmSeq);
		return pharmacyRating;
	}

	@Override
	public PharReviewVO getPhReviewMe(HashMap<String, String> paraMap) {
		PharReviewVO reviewMe = sqlsession.selectOne("detail.getPhReviewMe", paraMap);
		return reviewMe;
	}

	@Override
	public List<PharReviewVO> getPhReview(HashMap<String, String> paraMap) {
		List<PharReviewVO> PharReviewVO = sqlsession.selectList("detail.getPhReview",paraMap);
		return PharReviewVO;
	}

	@Override
	public int getReviewTotalCountPh(HashMap<String, String> paraMap) {
		int reviewTotalCount = sqlsession.selectOne("detail.getReviewTotalCountPh",paraMap);
		return reviewTotalCount;
	}

	@Override
	public int reviewDeletePh(HashMap<String, String> paraMap) {
		int n = sqlsession.delete("detail.reviewDeletePh", paraMap);
		return n;
	}

	@Override
	public int addReviewPh(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("detail.addReviewPh", paraMap);
		return n;
	}

	
	

	

}
