package com.synergy.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.NoticeVO;

public interface InterService {

	String getContent();

	HashMap<String, List<NoticeVO>> selectNoticeList(); // 공지사항 최근 3개 글목록 불러오기

	List<HpReviewVO> getRankList(); // 병원 평점순위 별 리스트 보여주기

}
