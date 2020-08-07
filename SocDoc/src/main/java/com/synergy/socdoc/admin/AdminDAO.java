package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

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


	// 공지사항 목록 불러오기
	@Override
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> noticevoList = sqlsession.selectList("admin.selectNoticeList");
		return noticevoList;
	}


	// 건강정보 목록 불러오기
	@Override
	public List<HealthInfoVO> selectHealthList() {
		List<HealthInfoVO> healthvoList = sqlsession.selectList("admin.selectHealthList");
		return healthvoList;
	}

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

/*	
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.getTotalCount", paraMap);
		return totalCount;
	}

	@Override
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.memberListSearchWithPaging", paraMap);
		return memberList;
	}	

*/	
}
