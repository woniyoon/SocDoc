package com.synergy.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.NoticeVO;

public interface InterService {

	String getContent();

	HashMap<String, List<NoticeVO>> selectNoticeList(); // 공지사항 최근 3개 글목록 불러오기

}
