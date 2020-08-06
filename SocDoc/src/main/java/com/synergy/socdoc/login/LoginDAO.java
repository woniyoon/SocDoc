package com.synergy.socdoc.login;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements InterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// === 회원가입 회원 아이디 중복검사 === //
	@Override
	public int idChk(String userid) { // 파라미터가 많다면 (String, String, ...) 웬만하면 map으로 보내는게 훨 편하다. // boardvo나 hashmap
		int result = sqlsession.selectOne("newMem.idChk", userid);
		System.out.println(result);
		return result;
	}
	
	// === 회원가입 회원 이메일 중복검사 === //
	@Override
	public int emailChk(String email) {
		int result = sqlsession.selectOne("newMem.emailChk", email);
		System.out.println(result);
		return result;
	}

	// === 회원가입 병원 아이디 중복검사 === //
	@Override
	public int hpIdChk(String hpUserid) {
		int result = sqlsession.selectOne("newMem.hpIdChk", hpUserid);
		System.out.println(result);
		return result;
	}

	// === 회원가입 병원 이메일 중복검사 === //
	@Override
	public int hpEmailChk(String hpEmail) {
		int result = sqlsession.selectOne("newMem.hpEmailChk", hpEmail);
		System.out.println(result);
		return result;
	}

	

	

}
