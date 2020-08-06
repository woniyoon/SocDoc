package com.synergy.socdoc.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService implements InterLoginService {
	
	@Autowired
	private InterLoginDAO dao;
	
	// === 회원가입 아이디 중복검사 === //
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

}
