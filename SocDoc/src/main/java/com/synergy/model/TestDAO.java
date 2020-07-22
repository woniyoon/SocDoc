package com.synergy.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO implements InterDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public String getContent() {
		String content = sqlsession.selectOne("test.getContent");
		
		return content;
	}

}
