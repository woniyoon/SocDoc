package com.synergy.socdoc.login;

import java.util.HashMap;

import com.synergy.socdoc.member.MemberVO;

public interface InterLoginDAO {
	
	// === 회원가입 회원 아이디 중복검사 === //
	int idChk(String userid);
	
	// === 회원가입 회원 이메일 중복검사 === //
	int emailChk(String email);
	
	// === 회원가입 병원 아이디 중복검사 === //
	int hpIdChk(String hpUserid);
	
	// === 회원가입 병원 이메일 중복검사 === //
	int hpEmailChk(String hpEmail);
	
	// 회원 회원가입 //
	void register(MemberVO vo);
	
	// 로그인 처리 //
	MemberVO getLoginMember(HashMap<String, String> paraMap);

	void setLastLoginDate(HashMap<String, String> paraMap);
}
