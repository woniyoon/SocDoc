package com.synergy.socdoc.login;

import java.util.HashMap;

import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterLoginDAO {
	// 로그인 처리 //
	MemberVO getLoginMember(HashMap<String, String> paraMap);
	HpMemberVO getHpLoginMember(HashMap<String, String> paraMap);
	
	// === 회원가입 아이디 중복검사 === //
	int idChk(String userid);
	int hpIdChk(String userid);
	
	// === 회원가입 이메일 중복검사 === //
	int emailChk(String email);
	int hpEmailChk(String email);
	
	// 회원가입 //
	int register(MemberVO vo);
	int hpRegister(HpMemberVO vo);
	


}
