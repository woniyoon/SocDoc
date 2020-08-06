package com.synergy.socdoc.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService implements InterLoginService {
	
	@Autowired
	private InterLoginDAO dao;
	
	// === 회원가입 회원 아이디 중복검사 === //
	@Override
	public boolean idChk(String userid) {
		int n = dao.idChk(userid);
		boolean result;
		if(n==0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}
	
	// === 회원가입 회원 이메일 중복검사 === //
	@Override
	public boolean emailChk(String email) {
		int n = dao.emailChk(email);
		boolean result;
		if(n==0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}
	
	// === 회원가입 병원 아이디 중복검사 === //
	@Override
	public boolean hpIdChk(String hpUserid) {
		int n = dao.hpIdChk(hpUserid);
		boolean result;
		if(n==0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}
	
	// === 회원가입 병원 이메일 중복검사 === //
	@Override
	public boolean hpEmailChk(String hpEmail) {
		int n = dao.hpEmailChk(hpEmail);
		boolean result;
		if(n==0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}

}
