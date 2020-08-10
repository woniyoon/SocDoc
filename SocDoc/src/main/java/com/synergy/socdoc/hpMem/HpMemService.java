package com.synergy.socdoc.hpMem;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public class HpMemService implements InterHpMemService {

	@Autowired
	private InterHpMemDAO dao;
	
	@Override
	public HpInfoVO getHpInfo(String hpSeq) {
		HpInfoVO hpInfo = dao.getHpInfo(hpSeq);
		
		return hpInfo;
	}

	// 신청테이블에서 정보 가져오기
	@Override
	public List<HpInfoVO> getInfoUpdateList(String hpSeq) {
		List<HpInfoVO> hpInfoList = dao.getInfoUpdateList(hpSeq);
		return hpInfoList;
	}

	@Override
	public HpInfoVO getHpInfoDetail(String submitId) {
		HpInfoVO hpInfoDetail = dao.getHpInfoDetail(submitId);
		return hpInfoDetail;
	}

	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = dao.getOpeningHours(hpSeq);
		return openingHours;
	}

	@Override
	public List<HashMap<String, String>> getScheduleTbl(String submitId) {
		List<HashMap<String, String>> scheduleTbl = dao.getScheduleTbl(submitId);
		return scheduleTbl;
	}

	@Override
	public List<HashMap<String, String>> getRecentReviews(String hpSeq) {
		List<HashMap<String, String>> reviewList = dao.getRecentReviews(hpSeq);
		return reviewList;
	}

	@Override
	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> visitorsList = dao.getVisitors(paraMap);
		return visitorsList;
	}

	@Override
	public int getNumOfVisitors(String hpSeq) {
		int numOfVisitors = dao.getNumOfVisitors(hpSeq);
		return numOfVisitors;
	}

}
