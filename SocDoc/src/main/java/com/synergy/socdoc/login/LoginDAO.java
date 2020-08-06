package com.synergy.socdoc.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements InterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// === 회원가입 아이디 중복검사 === //
	@Override
	public int idChk(String userid) { // 파라미터가 많다면 (String, String, ...) 웬만하면 map으로 보내는게 훨 편하다. // boardvo나 hashmap
		int result = sqlsession.selectOne("newMem.idChk", userid);
		System.out.println(result);
		return result;
	}
}
