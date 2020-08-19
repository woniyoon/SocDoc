package com.synergy.socdoc.center.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.QnaBoardVO;

@Repository
public class CenterDAO implements InterCenterDAO {

	
	@Autowired	
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> faqSelect() {
		List<HashMap<String, String>> faqList = sqlsession.selectList("center.faqSelect");
		return faqList;
	}

	@Override
	public int inquiryAdd(QnaBoardVO qvo) {
		int n = sqlsession.insert("center.inquiryAdd",qvo);
		return n;
	}
	
	
}
