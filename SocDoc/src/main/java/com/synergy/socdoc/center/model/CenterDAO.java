package com.synergy.socdoc.center.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CenterDAO implements InterCenterDAO {

	
	@Autowired	
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> faqSelect() {
		List<HashMap<String, String>> faqList = sqlsession.selectList("center.faqSelect");
		return faqList;
	}
	
	
}
