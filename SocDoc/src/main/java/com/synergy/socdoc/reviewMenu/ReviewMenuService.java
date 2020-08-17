package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;


@Service
public class ReviewMenuService implements InterReviewMenuService {

	
	@Autowired
	private InterReviewMenuDAO dao;

	@Override
	public List<HpInfoVO> getHpList(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = dao.getHpList(paraMap);
		return hpList;
	}

	@Override
	public int getReviewMenuTotalPage(HashMap<String, String> paraMap) {
		int n = dao.getReviewMenuTotalPage(paraMap);
		return n;
	}

	@Override
	public List<HpReviewVO> readReviewDetail(String hpSeq) {
		List<HpReviewVO> reviewList = dao.readReviewDetail(hpSeq);
		return reviewList;
	}
	
	
}
