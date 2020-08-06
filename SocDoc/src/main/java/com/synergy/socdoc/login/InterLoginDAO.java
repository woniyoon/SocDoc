package com.synergy.socdoc.login;

import java.util.HashMap;

public interface InterLoginDAO {
	
	// === 회원가입 회원 아이디 중복검사 === //
	int idChk(String userid);
	
	// === 회원가입 회원 이메일 중복검사 === //
	int emailChk(String email);
	
	// === 회원가입 병원 아이디 중복검사 === //
	int hpIdChk(String hpUserid);
	
	// === 회원가입 병원 이메일 중복검사 === //
	int hpEmailChk(String hpEmail);
}
