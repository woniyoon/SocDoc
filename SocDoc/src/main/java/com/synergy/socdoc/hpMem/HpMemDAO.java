package com.synergy.socdoc.hpMem;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class HpMemDAO implements InterHpMemDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public HpInfoVO getHpInfo(String hpSeq) {
		HpInfoVO hpInfo = sqlsession.selectOne("hpMem.getHpInfo", hpSeq);
		return hpInfo;
	}

	@Override
	public List<HpInfoVO> getInfoUpdateList(String hpSeq) {
		List<HpInfoVO> hpInfoList = sqlsession.selectList("hpMem.getInfoUpdateList", hpSeq);
		System.out.println("데이터 가져옴! ");
		System.out.println("hpInfoList 크기 : " + hpInfoList.size());
		return hpInfoList;
	}

	@Override
	public HpInfoVO getHpInfoDetail(String submitId) {
		HpInfoVO hpInfoDetail = sqlsession.selectOne("hpMem.getHpInfoDetail", submitId);
		
		return hpInfoDetail;
	}

	// 병원의 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = sqlsession.selectList("hpMem.getOpeningHours", hpSeq);
		return openingHours;
	}

	// 신청테이블에서 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getScheduleTbl(String submitId) {
		List<HashMap<String, String>> scheduleTbl = sqlsession.selectList("hpMem.getScheduleTbl", submitId);
		System.out.println(scheduleTbl.size());
		return scheduleTbl;
	}


}
