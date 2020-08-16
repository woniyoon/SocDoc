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

	/*// === 병원목록 가져오기 ===
	@Override
	public List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap) {
		List<HashMap<String, String>> hpinfovoList = dao.hpinfovoList(paraMap);
		return hpinfovoList;
	}*/

	/*@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}*/


	@Override
	public List<HashMap<String, String>> hpinfovoList(HashMap<String, Object> paraMap) {
		List<HashMap<String, String>> hpinfovoList = dao.hpinfovoList(paraMap);
		return hpinfovoList;
	}

/*	@Override
	public List<HpInfoVO> hpinfovoListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpinfovoList = dao.hpinfovoListSearchWithPaging(paraMap);
		return hpinfovoList;
	}

	@Override
	public List<HashMap<String, String>> hpinfovoList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> hpinfovoList = dao.hpinfovoList(paraMap);
		return hpinfovoList;
	}

	@Override
	public List<HpInfoVO> searchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpinfovoList = dao.hpinfovoListSearchWithPaging(paraMap);
		return hpinfovoList;
	}
*/




}
