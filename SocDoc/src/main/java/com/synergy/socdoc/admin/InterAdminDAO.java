package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;


public interface InterAdminDAO {

	int getTotalCount(HashMap<String, String> paraMap);  // 총 게시물 건수 구하기

	List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap); // 페이징 한 글목록 가져오기

	List<MemberVO> selectMemberList(); // 회원 정보 불러오기
 
	List<QnaBoardVO> selectQnAList(); // 문의관리 목록 불러오기

	NoticeVO getView(String noticeSeq); // 공지사항 글 조회

	int noticeTotalCount(HashMap<String, String> paraMap); // 공지사항 총 게시물 건수 구하기
	List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap); // 공지사항 글 목록 (페이징처리)

	int healthInfoCount(HashMap<String, String> paraMap); // 건강정보 총 게시물 건수 구하기
	List<HealthInfoVO> healthInfoPaging(HashMap<String, String> paraMap); // 건강정보 글 목록 (페이징처리)

	List<FaqBoardVO> selectfaqList(); // faq 목록 불러오기


}
