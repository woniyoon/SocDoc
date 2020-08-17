package com.synergy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.model.InterDAO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.NoticeVO;

@Service
public class TestService implements InterService {
	
	@Autowired
	private InterDAO dao;

	@Override
	public String getContent() {
		String content = dao.getContent();
		return content;
	}

	// 공지사항 최근 3개 글목록 불러오기
	@Override
	public HashMap<String, List<NoticeVO>> selectNoticeList() {
		List<NoticeVO> noticevoList = dao.selectNoticeList();
		
		HashMap<String, List<NoticeVO>> map = new HashMap<>();
		map.put("noticevoList", noticevoList);
		
		return map;
	}

	// 병원 평점순위 별 리스트 보여주기
	@Override
	public List<HpReviewVO> getRankList() {
		List<HpReviewVO> hpRankList = dao.getRankList();
		return hpRankList;
	}

}
