package com.synergy.socdoc.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;


@Service
public class LoginService implements InterLoginService {
	
	@Autowired
	private InterLoginDAO dao;
	
/*	@Autowired
	private AES256 aes;*/
	
	// 로그인 처리 //
	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		MemberVO loginuser = dao.getLoginMember(paraMap); // DB에 넘기자.
		// === #48. aes 의존객체를 사용하여 로그인 되어진 사용자(loginuser)의 이메일 값을 복호화 하다록 한다. === //
		/*if(loginuser != null) { HpMemberVO
			if(loginuser.getLastlogindategap() >= 12) { 
				// 마지막으로 로그인 한 날짜 시간이 현재일로부터 1년(12개월)이 지났으면 해당 로그인 계정을 비활성화(휴면)시킨다.
				loginuser.setStatus(0); 
			}
			else { // ☆★☆★ db에서 가지고 온 복호화 풀기
				if(loginuser.getPwdchangegap() > 3) {
					// 마지막으로 로그인 한 날짜 시간이 현재일로부터 1년(12개월)이 지났으면 해당 로그인 계정을 비활성화(휴면)시킨다.
					loginuser.setRequirePwdChange(true); // 디폴트가 false인데 true를 줘서 비활성화(휴면)시키겠다.
				}
				dao.setLastLoginDate(paraMap); // 마지막으로 로그인 한 날짜시간 변경(기록)하기
				
				try {
					loginuser.setEmail(aes.decrypt(loginuser.getEmail())); // (loginuser.getEmail()) 암호화 되어진 이메일을 decrypt 복호화 해줘서 setEmail에 넣어주고 loginuser에 넣어주겠다. / 빨간줄을 catch해주면 된다.
				} catch (UnsupportedEncodingException | GeneralSecurityException e) {
					e.printStackTrace();
				}
			}
		}*/
		return loginuser; 
	}
	@Override
	public HpMemberVO getHpLoginMember(HashMap<String, String> paraMap) {
		HpMemberVO hpLoginuser = dao.getHpLoginMember(paraMap); // DB에 넘기자.
		return hpLoginuser;
	}
	
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
	
	// === 회원가입 이메일 중복검사 === //
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
	
	// 회원가입 //
	@Override
	public int register(MemberVO vo) {
		int n = dao.register(vo);
		return n;
	}
	@Override
	public int hpRegister(HpMemberVO vo) {
		int n = dao.hpRegister(vo);
		return n;
	}

	
}
