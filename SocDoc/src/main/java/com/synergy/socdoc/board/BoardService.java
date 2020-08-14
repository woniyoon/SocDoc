package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.NoticeVO;

@Service
public class BoardService implements InterBoardService {
	
	@Autowired
	private InterBoardDAO dao;
	
/*	// 총 게시물 건수(totalCount) 구하기 검색조건이 있을 때와 없을 때로 나뉘어진다.
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap); // dao한테 보내자~1
		return n;
	}

	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<NoticeVO> boardListSearchWithPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> boardList = dao.boardListSearchWithPaging(paraMap);
		return boardList;
	}*/

	
	// 게시물 목록 조회
//	@Override
//	public List<NoticeVO> noticeList() {
//		List<NoticeVO> noticeList = dao.noticeList();
//		return noticeList;
//	}
//	@Override
//	public List<HealthInfoVO> healthinfo() {
//		List<HealthInfoVO> healthinfo = dao.healthinfo();
//		return healthinfo;
//	}
	@Override
	public List<NoticeVO> noticeList(HashMap<String, String> paraMap) {
		List<NoticeVO> noticeList = dao.noticeList(paraMap);
		return noticeList;
	}
	@Override
	public List<HealthInfoVO> infoList(HashMap<String, String> paraMap) {
		List<HealthInfoVO> infoList = dao.infoList(paraMap);
		return infoList;
	}
	
	
	@Override
	public int getTotalNoticeList(HashMap<String, String> paraMap) {
		int result = dao.getTotalNoticeList(paraMap);
		return result;
	}
	
}
