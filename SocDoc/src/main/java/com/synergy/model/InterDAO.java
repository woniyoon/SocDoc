package com.synergy.model;

import java.util.List;

import com.synergy.socdoc.member.NoticeVO;

public interface InterDAO {

	String getContent();

	List<NoticeVO> selectNoticeList(); // 공지사항 최근 3개 글목록 불러오기

}
