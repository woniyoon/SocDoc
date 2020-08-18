package com.synergy.socdoc.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.reservation.model.InterReserveDAO;

@Service
public class ReserveService implements InterReserveService {
	
	@Autowired
	private InterReserveDAO dao;

	@Override
	public String getContent() {
		String content = dao.getContent();
		return content;
	}
	
	// === 환자정보가져오기(내자신) ===
	@Override
	public MemberVO viewMyinfo(String userid) {
		MemberVO membervo = dao.viewMyinfo(userid);
	      return membervo;
	}

	// === 진료과목가져오기 ===
	@Override
	public List<String> deptIdList() {
		List<String> deptIdList = dao.deptIdList();
		return deptIdList;
	}


	@Override
	public List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap) {
		List<HashMap<String, String>> hpinfovoList = dao.hpinfovoList(paraMap);
		return hpinfovoList;
	}
	
	// 먼저 총 게시물 건수(totalCount)를 구해와야한다
	@Override
	public int getTotalCount(HashMap<String, Object> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	//검색기능있는 병원목록보여주기
	@Override
	public List<HpInfoVO> searchwWithPaging(HashMap<String, Object> paraMap) {
		List<HpInfoVO> hpinfovoList = dao.searchwWithPaging(paraMap);
		return hpinfovoList;
	}

	@Override
	public List<String> getHours(HashMap<String, String> paraMap) {
		List<String> hours = dao.getHours(paraMap);
		return hours;
	}

	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = dao.getOpeningHours(hpSeq);
		return openingHours;
	}

	@Override
	public int makeReservation(HashMap<String, String> paraMap) {
		int n = dao.makeReservation(paraMap);
		return n;
	}

	@Override
	public String getReservSeq(HashMap<String, String> paraMap) {
		String reservseq = dao.getReservSeq(paraMap);
		return reservseq;
	}

	@Override
	public MemberVO selectMemberInfo(String userid) {
		MemberVO mvo = dao.selectMemberInfo(userid);
		return mvo;
	}
	



}
