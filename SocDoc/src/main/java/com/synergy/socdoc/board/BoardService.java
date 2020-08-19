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
	
	// === 게시물 목록 조회 === //
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
	
	// === 전체 목록 개수 가져오기 === //
	@Override
	public int getTotalNoticeList(HashMap<String, String> paraMap) {
		int result = dao.getTotalNoticeList(paraMap);
		return result;
	}
	@Override
	public int getTotalInfoList(HashMap<String, String> paraMap) {
		int result = dao.getTotalInfoList(paraMap);
		return result;
	}
	
	// === 글보기 === //
	@Override
	public NoticeVO getView(String noticeSeq) {
		NoticeVO noticevo = dao.getView(noticeSeq);
		return noticevo;
	}
	@Override
	public HealthInfoVO getInfoView(String infoSeq) {
		HealthInfoVO infovo = dao.getInfoView(infoSeq);
		return infovo;
	}
	
	// === 더보기 방식(페이징처리)으로 상품정보를 잘라서(startRno ~ endRno) 조회해오기 === //
	@Override
	public List<HealthInfoVO> selectByInfo(HashMap<String, String> paraMap) {
		List<HealthInfoVO> selectByInfo = dao.selectByInfo(paraMap);
		return selectByInfo;
	}
}
