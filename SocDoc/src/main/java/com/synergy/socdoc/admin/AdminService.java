package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;

@Component
@Service
public class AdminService implements InterAdminService {
	
	@Autowired
	private InterAdminDAO dao;
	
	@Override
	public HashMap<String, List<MemberVO>> selectMemberList() {
		List<MemberVO> membervoList = dao.selectMemberList();
		
		HashMap<String, List<MemberVO>> map = new HashMap<>();
		map.put("membervoList", membervoList);
		
		return map;
	}

	// 문의관리 목록 불러오기
	@Override
	public HashMap<String, List<QnaBoardVO>> selectQnAList() {
		List<QnaBoardVO> qnavoList = dao.selectQnAList();
		
		HashMap<String, List<QnaBoardVO>> map = new HashMap<>();
		map.put("qnavoList", qnavoList);
		
		return map;
	}

	// 공지사항 글 조회
	@Override
	public NoticeVO getView(String seq) {
		NoticeVO noticevo = dao.getView(seq);
		return noticevo;
	}
	
	// 회원관리 총 회원 수 구하기
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}

	// 회원관리 페이징 한 글목록 가져오기
	@Override
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberListSearchWithPaging(paraMap);
		return memberList;
	}

	// 공지사항 총 게시물 건수 구하기
	@Override
	public int noticeTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.noticeTotalCount(paraMap);
		return totalCount;
	}
	// 공지사항 글 목록 (페이징처리)
	@Override
	public List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> noticeList = dao.noticeListPaging(paraMap);
		return noticeList;
	}

	// 건강정보 총 게시물 건수 구하기
	@Override
	public int healthInfoCount(HashMap<String, String> paraMap) {
		int totalCount = dao.healthInfoCount(paraMap);
		return totalCount;
	}
	// 건강정보 글 목록 (페이징처리)
	@Override
	public List<HealthInfoVO> healthInfoPaging(HashMap<String, String> paraMap) {
		List<HealthInfoVO> healthInfoList = dao.healthInfoPaging(paraMap);
		return healthInfoList;
	}
	
	// faq 목록 불러오기
	@Override
	public HashMap<String, List<FaqBoardVO>> selectfaqList() {
		List<FaqBoardVO> faqvoList = dao.selectfaqList();
		
		HashMap<String, List<FaqBoardVO>> map = new HashMap<>();
		map.put("faqvoList", faqvoList);
		
		return map;
	}

	
	// 병원회원관리 총 회원 수 구하기
	@Override
	public int hpMemberCount(HashMap<String, String> paraMap) {
		int totalCount = dao.hpMemberCount(paraMap);
		return totalCount;
	}
	// 병원회원 목록 (페이징처리)
	@Override
	public List<HpMemberVO> hpmemberListPaging(HashMap<String, String> paraMap) {
		List<HpMemberVO> hospitalList = dao.hpmemberListPaging(paraMap);
		return hospitalList;
	}
	

	// 병원(정보)등록 총 게시물 건수 구하기
	@Override
	public int hpInfoCount(HashMap<String, String> paraMap) {
		int totalCount = dao.hpInfoCount(paraMap);
		return totalCount;
	}
	// 병원등록 목록 (페이징처리)
	@Override
	public List<HashMap<String, String>> hpInfoListPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> hpInfoList = dao.hpInfoListPaging(paraMap);
		return hpInfoList;
	}

	
	// 문의관리 총 게시물 건수 구하기
	@Override
	public int qnaListCount(HashMap<String, String> paraMap) {
		int totalCount = dao.qnaListCount(paraMap);
		return totalCount;
	}
	// 문의관리 글 목록 (페이징처리)
	@Override
	public List<QnaBoardVO> qnaListPaging(HashMap<String, String> paraMap) {
		List<QnaBoardVO> qnavoList = dao.qnaListPaging(paraMap);
		return qnavoList;
	}

	
	// QnA 글 조회
	@Override
	public QnaBoardVO getQnaView(String qnaSeq) {
		QnaBoardVO qnavo = dao.getQnaView(qnaSeq);
		return qnavo;
	}

	
	// 후기관리 총 게시물 건수 구하기
	@Override
	public int reviewTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.reviewTotalCount(paraMap);
		return totalCount;
	}
	// 후기관리 글 목록 (페이징처리)
	@Override
	public List<HashMap<String, String>> reviewListPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewvoList = dao.reviewListPaging(paraMap);
		return reviewvoList;
	}

	
	// 공지사항 글쓰기
	@Override
	public int noticeInsert(HashMap<String, String> paraMap) {
		int n = dao.noticeInsert(paraMap);
		return n;
	}
	// 공지사항 글삭제
	@Override
	public int delNotice(String noticeSeq) {
		int n = dao.delNotice(noticeSeq);
		return n;
	}
	// 공지사항 글수정
	@Override
	public int editNotice(NoticeVO noticevo) {
		int n = dao.updateNotice(noticevo);
		return n;
	}

	
	// 건강정보 글 조회
	@Override
	public HealthInfoVO healthInfoView(String infoSeq) {
		HealthInfoVO healthvo = dao.healthInfoView(infoSeq);
		return healthvo;
	}
	// 건강정보 글쓰기
	@Override
	public int infoInsert(HealthInfoVO healthvo) {
		int n = dao.infoInsert(healthvo);
		return n;
	}

	
	// 댓글쓰기
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int addComment(CommentVO commentvo) {
		int n = 0;
		
		n = dao.addComment(commentvo);

		return n;
	}
	// 게시물에 딸린 댓글 조회하기
	@Override
	public List<CommentVO> getCommentList(String parentSeq) {
		List<CommentVO> commentList = dao.getCommentList(parentSeq);
		return commentList;
	}
	// 문의글에 답변 상태 변경하기
	@Override
	public void updateStatus(String parentSeq) {
		dao.updateStatus(parentSeq);
	}

	
	// 회원 탈퇴 시키기
	@Override
	public void updateMember(String userid) {
		dao.updateMember(userid);
	}

	
	// 후기 글삭제
	@Override
	public void delReview(String rno) {
		dao.delReview(rno);
	}


	// FAQ 글쓰기
	@Override
	public int faqInsert(HashMap<String, String> paraMap) {
		int n = dao.faqInsert(paraMap);
		return n;
	}
	
	// FAQ 글삭제 
	@Override
	public void delFAQ(String faqSeq) {
		dao.delFAQ(faqSeq);
	}

	// 병원 수정내용 상세정보 모달로 보기
	@Override
	public HashMap<String, String> getHpInfoDetail(HashMap<String, String> paraMap) {
		HashMap<String, String> hpinfoDetail = dao.getHpInfoDetail(paraMap);
		return hpinfoDetail;
	}
	// 병원 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getOpeningHours(HashMap<String,String> paraMap) {
		List<HashMap<String, String>> openingHours = dao.getOpeningHours(paraMap);
		return openingHours;
	}

	// 병원정보 수정 승인
	@Override
	public void updateInfoStatus(String submitId) {
		dao.updateInfoStatus(submitId);
	}

	// 병원회원 상태 변경
	@Override
	public void updateHpMemStatus(int hpSeq) {
		dao.updateHpMemStatus(hpSeq);
	}

	// 병원 정보 신청테이블에서 셀렉트
	@Override
	public HpInfoVO getHpApplication(String hpSeq) {
		HpInfoVO hvo = dao.getHpApplication(hpSeq);
		return hvo;
	}

	@Override
	public int updateHpApplication(HpInfoVO hvo) {
		int n = dao.updateHpApplication(hvo);
		return n;
	}

	// 병원정보 신청 반려
	@Override
	public void updateRejectInfo(String submitId) {
		dao.updateRejectInfo(submitId);
	}

	// 병원회원 상세 정보 가져오기
	@Override
	public HashMap<String, String> detailInfo(HashMap<String, String> paraMap) {
		HashMap<String, String> hpinfoDetail = dao.detailInfo(paraMap);
		return hpinfoDetail;
	}
	// 병원회원 상세 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getTimeTbl(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> openingHours = dao.getTimeTbl(paraMap);
		return openingHours;
	}

	// 승인 후에 오픈시간 신청 게시판에서 정보 가져오기 (AOP)
	@Override
	public List<HashMap<String, String>> getAllScheduleEdit(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> schedule = dao.getAllScheduleEdit(paraMap);
		return schedule;
	}
	@Override
	public int updateHpSchedule(List<HashMap<String, String>> scheduleList) {
		int result = dao.updateHpSchedule(scheduleList);
		return result;
	}

	
	// 건강정보 상세 글보기에서 삭제하기
	@Override
	public int delHealthInfo(String infoSeq) {
		int n = dao.delHealthInfo(infoSeq);
		return n;
	}
	
	

}
