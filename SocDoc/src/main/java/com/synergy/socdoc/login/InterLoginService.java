package com.synergy.socdoc.login;

public interface InterLoginService {
	
	// === 회원가입 아이디 중복검사 === //
	boolean idChk(String userid);

}
