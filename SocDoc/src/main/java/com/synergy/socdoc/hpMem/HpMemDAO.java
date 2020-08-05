package com.synergy.socdoc.hpMem;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class HpMemDAO implements InterHpMemDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public HpInfoVO getHpInvo(String hpSeq) {
		HpInfoVO hpInfo = sqlsession.selectOne("hpMem.getHpInvo", hpSeq);
		return hpInfo;
	}

}
