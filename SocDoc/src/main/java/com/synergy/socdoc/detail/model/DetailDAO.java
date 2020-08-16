package com.synergy.socdoc.detail.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

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
	public List<HpReviewVO> getHpReview(HashMap<String, String> paraMap) {
		List<HpReviewVO> getHpReview = sqlsession.selectList("detail.getHpReview",paraMap);
		return getHpReview;
	}

	@Override
	public int getReviewTotalCount(HashMap<String, String> paraMap) {
		int reviewTotalCount = sqlsession.selectOne("detail.getReviewTotalCount",paraMap);
		return reviewTotalCount;
	}

	@Override
	public HpReviewVO getHpReviewMe(HashMap<String, String> paraMap) {
		HpReviewVO reviewMe = sqlsession.selectOne("detail.getHpReviewMe", paraMap);
		return reviewMe;
	}

}
