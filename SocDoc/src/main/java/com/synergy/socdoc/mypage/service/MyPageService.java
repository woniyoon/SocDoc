package com.synergy.socdoc.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.QnaBoardVO;
import com.synergy.socdoc.member.ReservationVO;
import com.synergy.socdoc.mypage.model.InterMyPageDAO;


@Service
public class MyPageService implements InterMyPageService {
	
	@Autowired
	private InterMyPageDAO dao;


	// == 총 게시물 건수(totalCount)를 구하기(검색이 있을때와 검색이 없을때로 나뉜다.) ==
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	
	// == 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것) ==
	@Override
	public List<QnaBoardVO> boardListSearchWithPaging(HashMap<String, String> paraMap) {
		List<QnaBoardVO> askList = dao.boardListSearchWithPaging(paraMap);
		return askList;
	}


	// == 글1개를 보여주기 ==
	// (먼저, 로그인을 한 상태에서 다른 사람의 글을 조회할 경우에는 글조회수 컬럼 1증가)
	@Override
	public QnaBoardVO getView(String qnaSeq, String userid) {
							// userid 는 로그인을 한 상태이라면 로그인한 사용자의 id이고,
							// 로그인을 안 한 상태이라면 userid 는 null 이다.
		QnaBoardVO boardvo = dao.getView(qnaSeq);
		
/*		if(boardvo != null && userid != null &&
		   !boardvo.getUserid().equals(userid)) {
			// 글조회수 증가는 다른 사람의 글을 읽을때만 증가하도록 해야 한다.
			// 로그인 하지 않은 상태에서는 글 조회수 증가는 없다.
			
			boardvo = dao.getView(seq); // 글1개를 보여주기
		}*/
		
		return boardvo;
	}


	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
	@Override
	public QnaBoardVO getViewWithNoAddCount(String qnaSeq) {
		QnaBoardVO boardvo = dao.getView(qnaSeq);
		return boardvo;
	}


	// 문의내역 1개글 삭제하기 (글)
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int del(HashMap<String,String> paraMap) throws Throwable {
		// dao.deleteComment(paraMap); // 딸린 댓글을 삭제한다.(딸린 댓글이 있는 경우 댓글도 동시에 삭제한다.)
		int n = dao.deleteBoard(paraMap); // 글을 삭제한다.
		return n;
	}


	// 문의내역 1개글 삭제하기 (목록)
	@Override
	public int goDel(Map<String, Object> paraMap) {
		int n= dao.dele(paraMap);
		return n;
	}


	// 문의내역 1개글 삭제하기 (목록)
	@Override
	public int goDel(String qnaSeq) {
		int n = dao.goDel(qnaSeq);
		return n;
	}

	
	// 내 건강 페이지 보이기(select)
	@Override
	public MemberVO viewMyHealth(String userid) {
		MemberVO membervo = dao.viewMyHealth(userid);
		return membervo;
	}
	
	
	@Override
	public List<MemberVO> viewMyHealthTest() {
		List<MemberVO> membervo = dao.viewMyHealthTest();
		return membervo;
	}
	


	// 내 건강 새로 저장하기(update)
	@Override
	public int updateHealth(HashMap<String, String> paraMap) {
		int n = dao.updateHealth(paraMap);
		return n;
	}
	
	
	@Override
	public int updateHealth(String userid) {
		int n = dao.updateHealth2(userid);
		return n;
	}


	// 내 건강 새로 저장하기(insert)
	@Override
	public int insertHealth(MemberVO membervo) {
		int n = dao.insertHealth(membervo);
		return n;
	}

	// 내 건강 페이지 삭제하기(delete)
	@Override
	public int delHealth(String userid) {
		int n = dao.delHealth(userid); 
		return n;
	}


	// 즐겨찾기 게시판 불러오기
	@Override
	public int getTotalBookMarkCount(HashMap<String, String> paraMap) {
		int n = dao.getTotalBookMarkCount(paraMap);
		return n;
	}


	// 페이징 처리한 즐겨찾기목록 가져오기 
	@Override
	public List<HashMap<String, String>> bookMarkListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> bookMarkList = dao.bookMarkListSearchWithPaging(paraMap);
		return bookMarkList;
	}


	// 즐겨찾기에서 userid 들고오기
	@Override
	public String userid() {
		String userid = dao.getUserid();
		return userid;
	}


	// 예약확인 갯수 구하기
	@Override
	public int getTotalCountReservation(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountReservation(paraMap);
		return n;
	}


	// 예약확인 페이지 목록 불러오기
	@Override
	public List<HashMap<String, String>> reservationListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reservationList = dao.reservationListSearchWithPaging(paraMap);
		return reservationList;
	}


	// 즐겨찾기에서 목록 삭제하기 
	@Override
	public int goDelBM(String bookSeq) {
		int n = dao.goDelBM(bookSeq);
		return n;
	}


	// 진료이력조회
	@Override
	public List<HashMap<String, String>> historyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> historyList = dao.historyListSearchWithPaging(paraMap);
		return historyList;
	}


	// 내 후기
	@Override
	public List<HashMap<String, String>> reviewListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewList = dao.reviewListSearchWithPaging(paraMap);
		return reviewList;
	}


	// 리뷰갯수
	@Override
	public int getTotalCountReview(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountReview(paraMap);
		return n;
	}


	// 예약확인 - 병원이름 클릭시 예약상세정보
	@Override
	public HashMap<String, String> reservationDetailListSearchWithPaging(HashMap<String, String> paraMap) {
		HashMap<String, String> reservationDetail = dao.reservationDetailListSearchWithPaging(paraMap);
		return reservationDetail;
	}

	




	/*// 방문 예정시간 구하기
	@Override
	public String getHourSeq(HashMap<String, String> paraMap) {
		String hourSeq = dao.getHourSeq(paraMap);
		return hourSeq;
	}*/


	


	


	


	


	


	

	

	

}
