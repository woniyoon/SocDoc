package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;

public interface InterAdminService {

	int getTotalCount(HashMap<String, String> paraMap); // 회원관리 총 게시물 건수 구하기

	List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap); // 회원관리 페이징 한 글목록 가져오기
	
	HashMap<String, List<MemberVO>> selectMemberList(); // 회원 정보 불러오기

	HashMap<String, List<QnaBoardVO>> selectQnAList(); // 문의관리 목록 불러오기

	NoticeVO getView(String noticeSeq); // 공지사항 글 조회

	int noticeTotalCount(HashMap<String, String> paraMap); // 공지사항 총 게시물 건수 구하기
	List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap);  // 공지사항 글 목록 (페이징처리)

	int healthInfoCount(HashMap<String, String> paraMap);
	List<HealthInfoVO> healthInfoPaging(HashMap<String, String> paraMap);

}
