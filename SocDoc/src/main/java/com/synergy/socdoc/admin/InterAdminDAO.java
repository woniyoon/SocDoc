package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.HpReviewVO;
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

	int hpMemberCount(HashMap<String, String> paraMap); // 병원회원관리 총 회원 수 구하기
	List<HpMemberVO> hpmemberListPaging(HashMap<String, String> paraMap); // 병원회원 목록 (페이징처리)

	int hpInfoCount(HashMap<String, String> paraMap); // 병원(정보)등록 총 게시물 건수 구하기
	List<HpMemberVO> hpInfoListPaging(HashMap<String, String> paraMap); // 병원등록 목록 (페이징처리)

	int qnaListCount(HashMap<String, String> paraMap); // 문의관리 총 게시물 건수 구하기 
	List<QnaBoardVO> qnaListPaging(HashMap<String, String> paraMap); // 문의관리 글 목록 (페이징처리)

	QnaBoardVO getQnaView(String qnaSeq); // QnA 글 조회

	int reviewTotalCount(HashMap<String, String> paraMap); // 후기관리 총 게시물 건수 구하기
	List<HpReviewVO> reviewListPaging(HashMap<String, String> paraMap); // 후기관리 글 목록 (페이징처리)

	int noticeInsert(HashMap<String, String> paraMap); // 공지사항 글쓰기
	int delNotice(String noticeSeq); // 공지사항 글삭제
	int updateNotice(NoticeVO noticevo); // 공지사항 글수정

	HealthInfoVO healthInfoView(String infoSeq); // 건강정보 글 조회
	int infoInsert(HealthInfoVO healthvo); // 건강정보 글쓰기

	int addComment(CommentVO commentvo); // 댓글쓰기
	List<CommentVO> getCommentList(String parentSeq); // 게시물에 딸린 댓글 조회하기
	void updateStatus(String parentSeq); // 문의글에 답변 상태 변경하기

}
