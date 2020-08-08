package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HealthInfoVO;
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
/*
	// 공지사항 목록 불러오기
	@Override
	public HashMap<String, List<NoticeVO>> selectNoticeList() {
		List<NoticeVO> noticevoList = dao.selectNoticeList();
		
		HashMap<String, List<NoticeVO>> map = new HashMap<>();
		map.put("noticevoList", noticevoList);
		
		return map;
	}

	*/
	// 건강정보 목록 불러오기
	@Override
	public HashMap<String, List<HealthInfoVO>> selectHealthInfoList() {
		List<HealthInfoVO> healthvoList = dao.selectHealthList();
		
		HashMap<String, List<HealthInfoVO>> map = new HashMap<>();
		map.put("healthvoList", healthvoList);
		
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
	
	// 회원관리 총 게시물 건수 구하기
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

	// 공지사항 글 목록 (페이징처리)
	@Override
	public List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> noticeList = dao.noticeListPaging(paraMap);
		return noticeList;
	}

	// 공지사항 총 게시물 건수 구하기
	@Override
	public int noticeTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.noticeTotalCount(paraMap);
		return totalCount;
	}

	
	
}
