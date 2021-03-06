package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;

@Component
@Repository
public class AdminDAO implements InterAdminDAO {

	@Resource
	private SqlSessionTemplate sqlsession;


	@Override
	public List<MemberVO> selectMemberList() {
		List<MemberVO> membervoList = sqlsession.selectList("admin.selectMemberList");
		return membervoList;
	}
/*
	// 건강정보 목록 불러오기
	@Override
	public List<HealthInfoVO> selectHealthList() {
		List<HealthInfoVO> healthvoList = sqlsession.selectList("admin.selectHealthList");
		return healthvoList;
	}

*/
	// 문의관리 목록 불러오기
	@Override
	public List<QnaBoardVO> selectQnAList() {
		List<QnaBoardVO> qnavoList = sqlsession.selectList("admin.selectQnAList");
		return qnavoList;
	}

	// 공지사항 글 조회
	@Override
	public NoticeVO getView(String noticeSeq) {
		NoticeVO noticevo = sqlsession.selectOne("admin.getView", noticeSeq);
		return noticevo;
	}

	// 회원관리 총 게시물 건수 구하기
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.getTotalCount", paraMap);
		return totalCount;
	}
	// 회원관리 페이징 한 글목록 가져오기
	@Override
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.memberListSearchWithPaging", paraMap);
		return memberList;
	}


	// 공지사항 총 게시물 건수 구하기
	@Override
	public int noticeTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.noticeTotalCount", paraMap);
		return totalCount;
	}
	// 공지사항 글 목록 (페이징처리)
	@Override
	public List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> noticeList = sqlsession.selectList("admin.noticeListPaging", paraMap);
		return noticeList;
	}

	
	// 건강정보 총 게시물 건수 구하기
	@Override
	public int healthInfoCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.healthInfoCount", paraMap);
		return totalCount;
	}
	// 건강정보 글 목록 (페이징처리)
	@Override
	public List<HealthInfoVO> healthInfoPaging(HashMap<String, String> paraMap) {
		List<HealthInfoVO> healthInfoList = sqlsession.selectList("admin.healthInfoPaging", paraMap);
		return healthInfoList;
	}
	
	
	// faq 목록 불러오기
	@Override
	public List<FaqBoardVO> selectfaqList() {
		List<FaqBoardVO> faqvoList = sqlsession.selectList("admin.selectfaqList");
		return faqvoList;
	}
	
	
	// 병원회원관리 총 회원 수 구하기
	@Override
	public int hpMemberCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.hpMemberCount", paraMap);
		return totalCount;
	}
	// 병원회원 목록 (페이징처리)
	@Override
	public List<HpMemberVO> hpmemberListPaging(HashMap<String, String> paraMap) {
		List<HpMemberVO> hospitalList = sqlsession.selectList("admin.hpmemberListPaging", paraMap);
		return hospitalList;
	}
	
	
	// 병원(정보)등록 총 게시물 건수 구하기
	@Override
	public int hpInfoCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.hpInfoCount", paraMap);
		return totalCount;
	}
	// 병원등록 목록 (페이징처리)
	@Override
	public List<HashMap<String, String>> hpInfoListPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> hpInfoList = sqlsession.selectList("admin.hpInfoListPaging", paraMap);
		return hpInfoList;
	}
	
	
	// 문의관리 총 게시물 건수 구하기
	@Override
	public int qnaListCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.qnaListCount", paraMap);
		return totalCount;
	}
	// 문의관리 글 목록 (페이징처리)
	@Override
	public List<QnaBoardVO> qnaListPaging(HashMap<String, String> paraMap) {
		List<QnaBoardVO> qnavoList = sqlsession.selectList("admin.qnaListPaging", paraMap);
		return qnavoList;
	}

	
	// QnA 글 조회
	@Override
	public QnaBoardVO getQnaView(String qnaSeq) {
		QnaBoardVO qnavo = sqlsession.selectOne("admin.getQnaView", qnaSeq);
		return qnavo;
	}
	
	// 후기관리 총 게시물 건수 구하기
	@Override
	public int reviewTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.reviewTotalCount", paraMap);
		return totalCount;
	}
	// 후기관리 글 목록 (페이징처리)
	@Override
	public List<HashMap<String, String>> reviewListPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewvoList = sqlsession.selectList("admin.reviewListPaging", paraMap);
		return reviewvoList;
	}

	
	// 공지사항 글쓰기 
	@Override
	public int noticeInsert(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("admin.noticeInsert", paraMap);
		return n;
	}
	// 공지사항 글삭제
	@Override
	public int delNotice(String noticeSeq) {
		int n = sqlsession.delete("admin.delNotice", noticeSeq);
		return n;
	}
	// 공지사항 글수정
	@Override
	public int updateNotice(NoticeVO noticevo) {
		int n = sqlsession.update("admin.updateNotice", noticevo);
		return n;
	}
	
	
	// 건강정보 글 조회
	@Override
	public HealthInfoVO healthInfoView(String infoSeq) {
		HealthInfoVO healthvo = sqlsession.selectOne("admin.healthInfoView", infoSeq);
		return healthvo;
	}
	// 건강정보 글쓰기
	@Override
	public int infoInsert(HealthInfoVO healthvo) {
		int n = sqlsession.insert("admin.infoInsert", healthvo);
		return n;
	}
	
	
	// 댓글쓰기
	@Override
	public int addCommentAdmin(CommentVO commentvo) {
		int n = sqlsession.insert("admin.addComment", commentvo);
		return n;
	}
	// 게시물에 딸린 댓글 조회하기
	@Override
	public List<CommentVO> getCommentList(String parentSeq) {
		List<CommentVO> commentList = sqlsession.selectList("admin.getCommentList", parentSeq);
		return commentList;
	}
	// 문의글에 답변 상태 변경하기
	@Override
	public void updateStatus(String parentSeq) {
		sqlsession.update("admin.updateStatus", parentSeq);
	}
	
	// 회원 탈퇴 시키기
	@Override
	public void updateMember(String userid) {
		sqlsession.update("admin.updateMember", userid);
	}
	
	// 후기 글삭제
	@Override
	public void delReview(String rno) {
		sqlsession.delete("admin.delReview", rno);
	}
	
	// FAQ 글쓰기
	@Override
	public int faqInsert(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("admin.faqInsert", paraMap);
		return n;
	}
	
	// FAQ 글삭제
	@Override
	public void delFAQ(String faqSeq) {
		sqlsession.delete("admin.delFAQ", faqSeq);
	}
	
	// 병원 상세정보 모달로 보기
	@Override
	public HashMap<String, String> getHpInfoDetail(HashMap<String, String> paraMap) {
		HashMap<String, String> hpinfoDetail = sqlsession.selectOne("admin.getHpInfoDetail", paraMap);
		return hpinfoDetail;
	}
	// 병원 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getOpeningHours(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> openingHours = sqlsession.selectList("admin.getOpeningHours", paraMap);
		return openingHours;
	}
	// 병원정보 수정 승인
	@Override
	public void updateInfoStatus(String submitId) {
		sqlsession.update("admin.updateInfoStatus", submitId);
	}
	// 병원회원 상태 변경
	@Override
	public void updateHpMemStatus(int hpSeq) {
		sqlsession.update("admin.updateHpMemStatus", hpSeq);
	}
	@Override
	public HpInfoVO getHpApplication(String hpSeq) {
		HpInfoVO hvo = sqlsession.selectOne("admin.getHpApplication", hpSeq);
		return hvo;
	}
	@Override
	public int updateHpApplication(HpInfoVO hvo) {
		int n = sqlsession.update("admin.updateHpApplication", hvo);
		return n;
	}
	// 병원정보 신청 반려
	@Override
	public void updateRejectInfo(String submitId) {
		sqlsession.update("admin.updateRejectInfo", submitId);
	}
	
	// 병원회원 상세 정보 가져오기
	@Override
	public HashMap<String, String> detailInfo(HashMap<String, String> paraMap) {
		HashMap<String, String> hpinfoDetail = sqlsession.selectOne("admin.detailInfo", paraMap);
		return hpinfoDetail;
	}
	// 병원회원 상세 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getTimeTbl(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> openingHours = sqlsession.selectList("admin.getTimeTbl", paraMap);
		return openingHours;
	}
	@Override
	public List<HashMap<String, String>> getAllScheduleEdit(HashMap<String, String> paraMap) {
		List<HashMap<String,String>> schedule = sqlsession.selectList("admin.getAllScheduleEdit", paraMap);
		return schedule;
	}
	@Override
	public int updateHpSchedule(List<HashMap<String, String>> scheduleList) {
		int n = 0;
		
		for(int i=0; i<scheduleList.size(); i++) {
			n += sqlsession.update("admin.updateHpSchedule", scheduleList.get(i));
		}
	
		return n;
	}
	
	
	// 건강정보 상세 글보기에서 삭제하기
	@Override
	public int delHealthInfo(String infoSeq) {
		int n = sqlsession.delete("admin.delHealthInfo", infoSeq);
		return n;
	}
	
	// 모달창에서 병원정보 신청 반려
	@Override
	public int rejectUpdate(HashMap<String, String> paraMap) {
		int n = sqlsession.update("admin.rejectUpdate", paraMap);
		return n;
	}
	

}
