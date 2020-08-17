package com.synergy.socdoc.login;

import java.util.HashMap;
import java.util.List;

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
	
	// === 회원가입 사업자번호 중복검사 === //
	public boolean regIdChk(String regId);
	
	// === 회원 회원가입 === //
	public int register(MemberVO vo);
	public int hpRegister(HpMemberVO vo);
	
	// 누구세요? 뭐지? ㅠ
	public List<MemberVO> idFind(MemberVO vo);
	
	// === 아이디 찾기 === //
	public MemberVO idFindResult(HashMap<String, String> paraMap);
	public HpMemberVO hpIdFindResult(HashMap<String, String> paraMap);
	
	// === 비밀번호 찾기,변경 === //
	public int pwdUpdate(HashMap<String, String> paraMap);
	public int hpPwdUpdate(HashMap<String, String> paraMap);
		
	// === 존재하는 회원인지 확인 === //
	public int checkMember(HashMap<String, String> paraMap);
	public int hpCheckMember(HashMap<String, String> paraMap);
	

	

}
