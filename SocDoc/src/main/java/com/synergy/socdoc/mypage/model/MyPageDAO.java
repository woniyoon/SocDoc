package com.synergy.socdoc.mypage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int addHealth(MemberVO membervo) {
		int n = sqlsession.update("mypage.addHealth", membervo);
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
	public List<ReservationVO> reservationListSearchWithPaging(HashMap<String, String> paraMap) {
		List<ReservationVO> reservationList = sqlsession.selectList("mypage.reservationListSearchWithPaging",paraMap);
		return reservationList;
	}


	


	


	


}
