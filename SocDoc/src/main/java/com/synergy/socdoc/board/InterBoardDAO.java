package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.NoticeVO;

public interface InterBoardDAO {

	
	
/*	// 총 게시물 건수(totalCount) 구하기 (검색조건이 있을 때와 없을 때로 나뉘어진다.)
	int getTotalCount(HashMap<String, String> paraMap);
	
	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	List<NoticeVO> boardListSearchWithPaging(HashMap<String, String> paraMap);
	
*/
	
	
	// 게시물 목록 조회
	public List<NoticeVO> noticeList(HashMap<String, String> paraMap);
	public List<HealthInfoVO> infoList(HashMap<String, String> paraMap);
	//public List<HealthInfoVO> healthinfo();
	public int getTotalNoticeList(HashMap<String, String> paraMap);
	
}
