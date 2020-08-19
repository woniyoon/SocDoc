package com.synergy.socdoc.mypage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.QnaBoardVO;
import com.synergy.socdoc.member.ReservationVO;

@Repository
public class MyPageDAO implements InterMyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// == 총 게시물 건수(totalCount)를 구하기(검색이 있을때와 검색이 없을때로 나뉜다.) ==
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("mypage.getTotalCount", paraMap);
		return n;
	}

	
	// == 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것) ==
	@Override
	public List<QnaBoardVO> boardListSearchWithPaging(HashMap<String, String> paraMap) {
		List<QnaBoardVO> askList = sqlsession.selectList("mypage.boardListSearchWithPaging",paraMap);
		return askList;
	}

	
	// == 글1개를 보여주기 ==
	@Override
	public QnaBoardVO getView(String qnaSeq) {
		QnaBoardVO boardvo = sqlsession.selectOne("mypage.getView", qnaSeq);
		return boardvo;
	}

	// 문의내역 삭제 (글)
	@Override
	public int deleteBoard(HashMap<String,String> paraMap) {
		int n = sqlsession.delete("mypage.deleteBoard", paraMap);
		return n;
	}


	// 문의내역 삭제 (목록)
	@Override
	public int dele(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mypage.deleteBoard", paraMap);
		return n;
	}


	// 문의내역 삭제 (목록)
	@Override
	public int goDel(String qnaSeq) {
		int n = sqlsession.delete("mypage.deleteBoard", qnaSeq);
		return n;
	}

	
	// 내 건강 페이지 보이기(select)
	@Override
	public MemberVO viewMyHealth(String userid) {
		MemberVO membervo = sqlsession.selectOne("mypage.viewMyHealth", userid);
		return membervo;
	}
	
	@Override
	public List<MemberVO> viewMyHealthTest() {
		List<MemberVO> memberList = sqlsession.selectList("mypage.viewMyHealthTest");
		return memberList;
	}
	
	
	// 내 건강 새로 저장하기(update)
	@Override
	public int updateHealth(HashMap<String, String> paraMap) {
		int n = sqlsession.update("mypage.updateHealth", paraMap);
		return n;
	}
	

	@Override
	public int updateHealth2(String userid) {
		int n = sqlsession.update("mypage.updateHealth2", userid);
		return n;
	}
	

	// 내 건강 새로 저장하기(insert)
	@Override
	public int insertHealth(MemberVO membervo) {
		int n = sqlsession.insert("mypage.insertHealth", membervo);
		return n;
	}



	// 내 건강 페이지 삭제하기(delete)
	@Override
	public int delHealth(String userid) {
		int n = sqlsession.update("mypage.delHealth", userid);
		return n;
	}


	// 즐겨찾기 게시판 불러오기
	@Override
	public int getTotalBookMarkCount(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("mypage.getTotalBookMarkCount", paraMap);
		return n;
	}


	// 페이징 처리한 즐겨찾기목록 가져오기 
	@Override
	public List<HashMap<String, String>> bookMarkListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> bookMarkList = sqlsession.selectList("mypage.bookMarkListSearchWithPaging",paraMap);
		return bookMarkList;
	}


	// 즐겨찾기에서 userid 들고오기
	@Override
	public String getUserid() {
		String userid = sqlsession.selectOne("mypage.getUserid");
		return userid;
	}


	// 예약확인 갯수 구하기
	@Override
	public int getTotalCountReservation(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("mypage.getTotalCountReservation", paraMap);
		return n;
	}


	// 예약확인 페이지 목록 불러오기
	@Override
	public List<HashMap<String, String>> reservationListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reservationList = sqlsession.selectList("mypage.reservationListSearchWithPaging",paraMap);
		return reservationList;
	}


	// 즐겨찾기에서 목록 삭제하기
	@Override
	public int goDelBM(String bookSeq) {
		int n = sqlsession.delete("mypage.goDelBM", bookSeq);
		return n;
	}


	// 진료이력조회
	@Override
	public List<HashMap<String, String>> historyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> historyList = sqlsession.selectList("mypage.historyListSearchWithPaging",paraMap);
		return historyList;
	}


	// 내 후기
	@Override
	public List<HashMap<String, String>> reviewListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewList = sqlsession.selectList("mypage.reviewListSearchWithPaging",paraMap);
		return reviewList;
	}


	@Override
	public int getTotalCountReview(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("mypage.getTotalCountReview", paraMap);
		return n;
	}


	// 예약확인 - 병원이름 클릭시 예약상세정보
	@Override
	public HashMap<String, String> reservationDetailListSearchWithPaging(HashMap<String, String> paraMap) {
		HashMap<String, String> reservationDetail = sqlsession.selectOne("mypage.reservationDetailListSearchWithPaging",paraMap);
		return reservationDetail;
	}


	// 회원정보수정 로그인
	@Override
	public MemberVO loginInfoEdit(HashMap<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("mypage.loginInfoEdit", paraMap);
		return loginuser;
	}


	// 회원정보수정(기본정보 변경)
	@Override
	public int updateInfo(MemberVO vo) {
		int n = sqlsession.update("mypage.updateInfo", vo);
		return n;
	}


	// 비밀번호 재설정 
	@Override
	public int goUpdatePwd(MemberVO vo) {
		int n = sqlsession.update("mypage.goUpdatePwd", vo);
		return n;
	}


	//////////////////////////////////////////////////////////////
	
	@Override
	public List<HashMap<String, String>> bookMarkList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> bookMarkList = sqlsession.selectList("mypage.bookMarkList",paraMap);
		return bookMarkList;
	}


	@Override
	public List<HashMap<String, String>> reservationList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reservationList = sqlsession.selectList("mypage.reservationList",paraMap);
		return reservationList;
	}


	@Override
	public List<HashMap<String, String>> historyList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> historyList = sqlsession.selectList("mypage.historyList",paraMap);
		return historyList;
	}


	@Override
	public List<HashMap<String, String>> reviewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewList = sqlsession.selectList("mypage.reviewList",paraMap);
		return reviewList;
	}

	///////////////////////////////////////////////////////////////////////////////
	

	// 댓글쓰기
	@Override
	public int addComment(CommentVO commentvo) {
		int n = sqlsession.insert("mypage.addComment", commentvo);
		return n;
	}
	
	// 게시물에 딸린 댓글 조회하기
	@Override
	public List<CommentVO> getCommentList(String parentSeq) {
		List<CommentVO> commentList = sqlsession.selectList("mypage.getCommentList", parentSeq);
		return commentList;
	}
	
	// 문의글에 답변 상태 변경하기
	@Override
	public void updateStatus(String parentSeq) {
		sqlsession.update("mypage.updateStatus", parentSeq);
	}


	// === 딸린 댓글을 삭제한다.(딸린 댓글이 있는 경우 댓글도 동시에 삭제한다.) === //  
	@Override
	public void deleteComment(HashMap<String, String> paraMap) {
		sqlsession.delete("mypage.deleteComment", paraMap);
	}


	// 최근진료내역 갯수
	@Override
	public int getTotalCountHistory(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("mypage.getTotalCountHistory", paraMap);
		return n;
	}


	


	// 방문예정시간 구하기
	/*@Override
	public String getHourSeq(HashMap<String, String> paraMap) {
		String hourSeq = sqlsession.selectOne("mypage.getHourSeq", paraMap);
		return hourSeq;
	}*/


	


	


	


	

	


	


	


}
