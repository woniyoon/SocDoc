package com.synergy.socdoc.searchMenu.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class SearchMenuDAO implements InterSearchMenuDAO {

	@Autowired	
	private SqlSessionTemplate sqlsession;
		
	@Override
	public List<HpInfoVO> searchHospitalSelect() {
		List<HpInfoVO> hpMap = sqlsession.selectList("searchMenu.hpMapSelect");
		return hpMap;
	}

}
