package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
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
	
	

}
