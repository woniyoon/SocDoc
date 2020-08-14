package com.synergy.socdoc.detail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class DetailDAO implements InterDetailDAO {

	@Autowired	
	private SqlSessionTemplate sqlsession;
	
	@Override
	public HpInfoVO hospitalDetail(String hpSeq) {
		HpInfoVO hpDetail = sqlsession.selectOne("detail.hospitalDetail",hpSeq);
		return hpDetail;
	}

}
