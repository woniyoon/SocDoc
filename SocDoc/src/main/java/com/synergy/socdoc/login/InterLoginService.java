package com.synergy.socdoc.login;

import java.util.HashMap;

import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;

public interface InterLoginService {
	// 로그인 처리 //
	public MemberVO getLoginMember(HashMap<String, String> paraMap);
	public HpMemberVO getHpLoginMember(HashMap<String, String> paraMap);
	
	// === 회원가입 아이디 중복검사 === //
	public boolean idChk(String userid);
	public boolean hpIdChk(String userid);
	
	// === 회원가입 이메일 중복검사 === //
	public boolean emailChk(String email);
	public boolean hpEmailChk(String email);

	// 회원 회원가입
	public int register(MemberVO vo);
	public int hpRegister(HpMemberVO vo);
	
	

	

}
