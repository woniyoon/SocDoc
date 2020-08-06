package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;


public interface InterAdminDAO {

/*
	int getTotalCount(HashMap<String, String> paraMap);  // 총 게시물 건수 구하기

	List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap); // 페이징 한 글목록 가져오기

*/
	List<MemberVO> selectMemberList(); // 회원 정보 불러오기
	
	List<NoticeVO> selectNoticeList(); // 공지사항 목록 불러오기
}
