package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.NoticeVO;

public interface InterBoardDAO {

	
	// === 게시물 목록 조회 === //
	public List<NoticeVO> noticeList(HashMap<String, String> paraMap);
	public List<HealthInfoVO> infoList(HashMap<String, String> paraMap);
	
	// === 전체 목록 개수 가져오기 === //
	public int getTotalNoticeList(HashMap<String, String> paraMap);
	public int getTotalInfoList(HashMap<String, String> paraMap);
	
	// === 글보기 === //
	public NoticeVO getView(String noticeSeq);
	public HealthInfoVO getInfoView(String infoseq);
	
	// === 더보기 방식(페이징처리)으로 상품정보를 잘라서(startRno ~ endRno) 조회해오기 === //
	public List<HealthInfoVO> selectByInfo(HashMap<String, String> paraMap);	
}
