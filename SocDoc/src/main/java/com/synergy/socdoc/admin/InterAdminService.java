package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;

public interface InterAdminService {
/*
	int getTotalCount(HashMap<String, String> paraMap); // 총 게시물 건수 구하기

	List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap); // 페이징 한 글목록 가져오기

*/	
	HashMap<String, List<MemberVO>> selectMemberList(); // 회원 정보 불러오기

	HashMap<String, List<NoticeVO>> selectNoticeList(); // 공지사항 목록 불러오기

	HashMap<String, List<HealthInfoVO>> selectHealthInfoList(); // 건강정보 목록 불러오기
	

}
