package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;


@Service
public class ReviewMenuService implements InterReviewMenuService {

	
	@Autowired
	private InterReviewMenuDAO dao;

	@Override
	public List<HpInfoVO> getHpList(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = dao.getHpList(paraMap);
		return hpList;
	}
	
	
}
