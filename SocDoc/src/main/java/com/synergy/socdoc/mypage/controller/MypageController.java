package com.synergy.socdoc.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synergy.service.InterService;


@Controller  
public class MypageController {

	@Autowired
	private InterService service;
	
	// === 마이페이지 메인 페이지 요청 === // 
	@RequestMapping(value="/mypage.sd")
	public String mypage() {
	
		return "myPage/main.tiles2";
	}
	
	// === 회원정보 수정 페이지 === // 
	@RequestMapping(value="/infoEdit.sd")
	public String infoEdit() {
	
		return "myPage/infoEdit.tiles2";
	}
	
	// === 회원정보 수정 페이지2 - 기본정보변경 & 비밀번호 변경 페이지 === // 
	@RequestMapping(value="/infoEdit2.sd")
	public String infoEdit2() {
	
		return "myPage/infoEdit2.tiles2";
	}
	
	// === 문의내역 페이지 === // 
	@RequestMapping(value="/askList.sd")
	public String askList() {
	
		return "myPage/askList.tiles2";
	}
	
	// === 내 건강 페이지 === // 
	@RequestMapping(value="/myHealth.sd")
	public String myHealth() {
	
		return "myPage/myHealth.tiles2";
	}
	
	// === 병원 즐겨찾기 페이지 === // 
	@RequestMapping(value="/bookMark.sd")
	public String bookMark() {
	
		return "myPage/bookMark.tiles2";
	}
	
	// === 예약확인 페이지 === // 
	@RequestMapping(value="/reservation.sd")
	public String reservation() {
	
		return "myPage/reservation.tiles2";
	}
	
	// === 예약확인 페이지 === // 
	@RequestMapping(value="/viewHistory.sd")
	public String viewHistory() {
	
		return "myPage/viewHistory.tiles2";
	}
}
