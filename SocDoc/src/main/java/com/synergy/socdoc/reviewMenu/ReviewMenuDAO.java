package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

@Repository
public class ReviewMenuDAO implements InterReviewMenuDAO {

	
	@Autowired	
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HpInfoVO> getHpList(HashMap<String, String> paraMap) {
		List<HpInfoVO> HpList = sqlsession.selectList("reviewMenu.getHpList", paraMap);
		return HpList;
	}

	@Override
	public int getReviewMenuTotalPage(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("reviewMenu.getReviewMenuTotalPage",paraMap);
		return n;
	}

	@Override
	public List<HpReviewVO> readReviewDetail(String hpSeq) {
		List<HpReviewVO> reviewList = sqlsession.selectList("reviewMenu.readReviewDetail", hpSeq);
		return reviewList;
	}
	
	
}
