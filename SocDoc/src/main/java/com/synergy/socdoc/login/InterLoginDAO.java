package com.synergy.socdoc.login;

public interface InterLoginDAO {
	
	// === 회원가입 아이디 중복검사 === //
	int idChk(String userid);

}
