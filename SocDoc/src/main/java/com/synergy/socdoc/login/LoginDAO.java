package com.synergy.socdoc.login;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;

@Repository
public class LoginDAO implements InterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 로그인 처리 //
	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("newMem.getLoginMember", paraMap);
		return loginuser;
	}
	@Override
	public HpMemberVO getHpLoginMember(HashMap<String, String> paraMap) {
		HpMemberVO loginuser = sqlsession.selectOne("newMem.getHpLoginMember", paraMap);
		return loginuser;
	}
	
	// === 회원가입  아이디 중복검사 === //
	@Override
	public int idChk(String userid) { // 파라미터가 많다면 (String, String, ...) 웬만하면 map으로 보내는게 훨 편하다. // boardvo나 hashmap
		int result = sqlsession.selectOne("newMem.idChk", userid);
		//System.out.println(result);
		return result;
	}
	@Override
	public int hpIdChk(String hpUserid) {
		int result = sqlsession.selectOne("newMem.hpIdChk", hpUserid);
		//System.out.println(result);
		return result;
	}
	
	// === 회원가입  이메일 중복검사 === //
	@Override
	public int emailChk(String email) {
		int result = sqlsession.selectOne("newMem.emailChk", email);
		//System.out.println(result);
		return result;
	}
	@Override
	public int hpEmailChk(String hpEmail) {
		int result = sqlsession.selectOne("newMem.hpEmailChk", hpEmail);
		//System.out.println(result);
		return result;
	}

	// 회원가입 //
	@Override
	public int register(MemberVO vo) {
		int n = sqlsession.insert("newMem.register", vo);
		return n;
	}
	@Override
	public int hpRegister(HpMemberVO vo) {
		int n = sqlsession.insert("newMem.hpRegister", vo);
		return n;
	}

	


	

}
