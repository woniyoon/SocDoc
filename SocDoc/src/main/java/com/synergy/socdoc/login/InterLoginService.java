package com.synergy.socdoc.login;

import java.util.HashMap;

import com.synergy.socdoc.member.MemberVO;

public interface InterLoginService {
	
	// === 회원가입 회원 아이디 중복검사 === //
	public boolean idChk(String userid);
	
	// === 회원가입 회원 이메일 중복검사 === //
	public boolean emailChk(String email);

	// === 회원가입 병원 아이디 중복검사 === //
	public boolean hpIdChk(String hpUserid);

	// === 회원가입 병원 이메일 중복검사 === //
	public boolean hpEmailChk(String hpEmail);
	
	// 회원 회원가입
	void register(MemberVO vo);
	
	// 로그인 처리 //
	public MemberVO getLoginMember(HashMap<String, String> paraMap);
	

}
