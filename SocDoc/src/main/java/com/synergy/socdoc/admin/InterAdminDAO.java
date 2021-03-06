package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
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
	List<HashMap<String, String>> hpInfoListPaging(HashMap<String, String> paraMap); // 병원등록 목록 (페이징처리)

	int qnaListCount(HashMap<String, String> paraMap); // 문의관리 총 게시물 건수 구하기 
	List<QnaBoardVO> qnaListPaging(HashMap<String, String> paraMap); // 문의관리 글 목록 (페이징처리)

	QnaBoardVO getQnaView(String qnaSeq); // QnA 글 조회

	int reviewTotalCount(HashMap<String, String> paraMap); // 후기관리 총 게시물 건수 구하기
	List<HashMap<String, String>> reviewListPaging(HashMap<String, String> paraMap); // 후기관리 글 목록 (페이징처리)

	int noticeInsert(HashMap<String, String> paraMap); // 공지사항 글쓰기
	int delNotice(String noticeSeq); // 공지사항 글삭제
	int updateNotice(NoticeVO noticevo); // 공지사항 글수정

	HealthInfoVO healthInfoView(String infoSeq); // 건강정보 글 조회
	int infoInsert(HealthInfoVO healthvo); // 건강정보 글쓰기

	int addCommentAdmin(CommentVO commentvo); // 댓글쓰기
	List<CommentVO> getCommentList(String parentSeq); // 게시물에 딸린 댓글 조회하기
	void updateStatus(String parentSeq); // 문의글에 답변 상태 변경하기

	void updateMember(String userid); // 회원 탈퇴 시키기

	void delReview(String rno);	// 후기 글삭제

	int faqInsert(HashMap<String, String> paraMap); // FAQ 글쓰기

	void delFAQ(String faqSeq); // FAQ 글삭제

	HashMap<String, String> getHpInfoDetail(HashMap<String, String> paraMap); // 병원 상세정보 모달로 보기
	List<HashMap<String, String>> getOpeningHours(HashMap<String, String> paraMap); // 병원 영업시간 가져오기
	void updateInfoStatus(String submitId); // 병원정보 수정 승인
	void updateHpMemStatus(int hpSeq); // 병원회원 상태 변경
	HpInfoVO getHpApplication(String hpSeq);
	int updateHpApplication(HpInfoVO hvo);
	void updateRejectInfo(String submitId); // 병원정보 신청 반려

	HashMap<String, String> detailInfo(HashMap<String, String> paraMap); // 병원회원 상세 정보 가져오기
	List<HashMap<String, String>> getTimeTbl(HashMap<String, String> paraMap); // 병원회원 상세 영업시간 가져오기

	List<HashMap<String, String>> getAllScheduleEdit(HashMap<String, String> paraMap); // 승인 후에 오픈시간 신청 게시판에서 정보 가져오기 (AOP)
	int updateHpSchedule(List<HashMap<String, String>> scheduleList);

	int delHealthInfo(String infoSeq); // 건강정보 상세 글보기에서 삭제하기

	int rejectUpdate(HashMap<String, String> paraMap); // 모달창에서 병원정보 신청 반려

}
