package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class ReviewMenuDAO implements InterReviewMenuDAO {

	
	@Autowired	
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HpInfoVO> getHpList(HashMap<String, String> paraMap) {
		List<HpInfoVO> HpList = sqlsession.selectList("reviewMenu.getHpList", paraMap);
		return HpList;
	}
	
	
}
