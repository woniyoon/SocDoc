package com.synergy.socdoc.reservation.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;

@Repository
public class ReserveDAO implements InterReserveDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public String getContent() {
		String content = sqlsession.selectOne("test.getContent");
		return content;
	}

	// 병원 정렬하기 
	@Override
	public List<HpInfoVO> hospital_select() {
		List<HpInfoVO> hpinfovoList = sqlsession.selectList("test.hospital_select");
		return hpinfovoList;
	}

	@Override
	public MemberVO viewMyinfo(String userid) {
		MemberVO membervo = sqlsession.selectOne("test.viewMyinfo", userid);
	      return membervo;
	}

}
