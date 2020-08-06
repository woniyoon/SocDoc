package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;

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

	// 공지사항 목록 불러오기
	@Override
	public HashMap<String, List<NoticeVO>> selectNoticeList() {
		List<NoticeVO> noticevoList = dao.selectNoticeList();
		
		HashMap<String, List<NoticeVO>> map = new HashMap<>();
		map.put("noticevoList", noticevoList);
		
		return map;
	}
	
/*
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}

	@Overrides
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberListSearchWithPaging(paraMap);
		return null;
	}
*/
	
	
}
