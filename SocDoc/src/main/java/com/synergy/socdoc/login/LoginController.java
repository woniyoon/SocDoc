package com.synergy.socdoc.login;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.common.Sha256;
import com.synergy.socdoc.mail.GoogleMail;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private InterLoginService service;
	
	// === 로그인 폼 페이지 요청 === //
	@RequestMapping("/login.sd")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login/loginform.tiles1");
		
		return mav;
	}

	// === 로그인 처리 === //
	@RequestMapping(value="/loginEnd.sd", method= {RequestMethod.POST})
	public ModelAndView loginEnd(HttpServletRequest request, ModelAndView mav) {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birthDate = request.getParameter("birthDate");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // 암호화
		paraMap.put("email", email);
		paraMap.put("name", name);
		paraMap.put("phone", phone);
		paraMap.put("birthDate", birthDate);
		
		MemberVO loginuser = service.getLoginMember(paraMap);
		
		if(loginuser == null) {
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
		} else {
//			String msg = "건강한 하루되세요 누구님 환영합니다.";
//			String loc = request.getContextPath() + "/index.sd";
//			mav.addObject("msg", msg);
//			mav.addObject("loc", loc);
			mav.setViewName("login/loginEnd.tiles1"); 
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
			if(session.getAttribute("gobackURL") != null) {
	    		// 세션에 저장된 돌아갈 페이지 주소(gobackURL)가 있다라면 
	    		
	    		String gobackURL = (String) session.getAttribute("gobackURL");
	    		mav.addObject("gobackURL", gobackURL); // request 영역에 저장시키는 것이다.
	    		
	    		session.removeAttribute("gobackURL");  // 중요!!!!
	    	}
		}	
			/*else {
			
			if(loginuser.isIdleStatus() == true) { 
				// 로그인을 한지 1년이 지나서 휴면상태에 빠진 경우
				String msg = "로그인을 한지 1년이 지나서 휴면상태에 빠졌습니다.";
				String loc = "javascript:history.back()";
				
				mav.addObject("msg", msg);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");
			
			} else {
				
				if(loginuser.isRequirePwdChange() == true ) { 
					// 암호를 최근 3개월 동안 변경하지 않은 경우 
					session.setAttribute("loginuser", loginuser);
					
					String msg = "암호를 최근 3개월 동안 변경하지 않으셨습니다. 암호변경을 위해 나의정보 페이지로 이동합니다.";
					String loc = request.getContextPath()+"/myinfo.sd";
					mav.addObject("msg", msg);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
				} 
				
				else { 
					// 이상없이 로그인 할 때
					session.setAttribute("loginuser", loginuser);
					
					if(session.getAttribute("gobackURL") != null) {
			    		// 세션에 저장된 돌아갈 페이지 주소(gobackURL)가 있다라면 
			    		
			    		String gobackURL = (String) session.getAttribute("gobackURL");
			    		mav.addObject("gobackURL", gobackURL);
			    		
			    		session.removeAttribute("gobackURL");
			    	}
					
					mav.setViewName("login/loginEnd.tiles1");
				}
			}
		}*/
		return mav;
	}
	@RequestMapping(value="/hpLoginEnd.sd", method= {RequestMethod.POST})
	public ModelAndView hpLoginEnd(HttpServletRequest request, ModelAndView mav) {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String hpSeq = request.getParameter("hpSeq");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String regId = request.getParameter("regId");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // 암호화
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("email", email);
		paraMap.put("name", name);
		paraMap.put("regId", regId);
		
		HpMemberVO hpLoginuser = service.getHpLoginMember(paraMap);
	
		if(hpLoginuser == null) {
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
		} else {
//			String msg = "속닥 로그인 성공 희희바리~~ 건강한 하루 보내세요 ^~^";
//			String loc = request.getContextPath() + "/index.sd";
//			mav.addObject("msg", msg);
//			mav.addObject("loc", loc);
			mav.setViewName("login/loginEnd.tiles1"); 
			HttpSession session = request.getSession();
			session.setAttribute("hpLoginuser", hpLoginuser);
			
			if(session.getAttribute("gobackURL") != null) {
	    		// 세션에 저장된 돌아갈 페이지 주소(gobackURL)가 있다라면 
	    		
	    		String gobackURL = (String) session.getAttribute("gobackURL");
	    		mav.addObject("gobackURL", gobackURL); // request 영역에 저장시키는 것이다.
	    		
	    		session.removeAttribute("gobackURL");  // 중요!!!!
	    	}
		}	
		return mav;
	}
	
	// 로그아웃 처리 //
	@RequestMapping(value="/logout.sd")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav) { 
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("loginuser");
		if(object != null) {
			session.removeAttribute("loginuser");
			session.invalidate();
		}
		String msg = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/index.sd";
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}
	@RequestMapping(value="/hpLogout.sd")
	public ModelAndView hpLogout(HttpServletRequest request, ModelAndView mav) { 
		
		HttpSession session = request.getSession();
		Object object = session.getAttribute("hpLoginuser");
		if(object != null) {
			session.removeAttribute("hpLoginuser");
			session.invalidate();
		}
		String msg = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/index.sd";
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}
	
	// === 회원가입 폼 페이지 요청 === //
	@RequestMapping(value="/register.sd", method= {RequestMethod.GET})
	public String register(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		//System.out.println(ctxPath+"/register.sd로 접속하셨습니다.");
	
		return "login/register.tiles1";
	}

	// 회원 회원가입 //
	@RequestMapping(value="/registerEnd.sd", method= {RequestMethod.POST})
	public String register(MemberVO vo, HttpServletRequest request) {
		
		HashMap<String, String> paraMap = new HashMap<>();
		String pwd = Sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd); 
		
		HttpSession session = request.getSession();
		int n = service.register(vo);
	
		String msg = "";
		String loc = "";
		if(n==1) {
			session.setAttribute("loginuser", vo);
			msg = "가입 성공하셨습니다.";
			loc = request.getContextPath() + "/index.sd";
		} else {
			msg = "다시 시도해주세요!";
			loc = "javascript:history.back()";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg";
	}
	@RequestMapping(value="/hpRegisterEnd.sd", method= {RequestMethod.POST})
	public String hpRegisterEnd(HpMemberVO vo, HttpServletRequest request) {
		
		HashMap<String, String> paraMap = new HashMap<>();
		String pwd = Sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd); 
		
		HttpSession session = request.getSession();
		int n = service.hpRegister(vo);
	
		String msg = "";
		String loc = "";
		if(n==1) {
			session.setAttribute("hpLoginuser", vo);
			msg = "가입 성공하셨습니다.";
			loc = request.getContextPath() + "/index.sd";
		} else {
			msg = "다시 시도해주세요!";
			loc = "history.back()";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg";
	}
	
	// === 회원가입 이메일 인증키 난수 만들기 === //
	@ResponseBody
	@RequestMapping(value="/emailCode.sd", method = {RequestMethod.POST})
	public String emailCode(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		Random rnd = new Random();
		String certificationCode = "";
		
		int randnum = 0;
		for(int i=0; i<7; i++) {
			randnum = rnd.nextInt(9 - 0 + 1) + 0;
			certificationCode += randnum;
		}
		
		// 랜덤하게 생성한 인증코드(certificationCode)를 비밀번호 찾기를 하고자 하는 사용자의 email로 전송시킨다.
		GoogleMail mail = new GoogleMail();
        HttpSession session = request.getSession();
		
        boolean isSent;
        try {
        	//System.out.println("~~~~~ 메일전송  시작 ~~~~~");
			mail.sendmail(email, certificationCode);
			session.setAttribute("certificationCode", certificationCode);
			isSent = true;
        } catch (Exception e) {
			e.printStackTrace();
			isSent= false;
		}
        JSONObject json = new JSONObject();
        json.put("isSent", isSent);
        return json.toString();  
	}
	@ResponseBody
	@RequestMapping(value="/hpEmailCode.sd", method = {RequestMethod.POST})
	public String hpEmailCode(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		Random rnd = new Random();
		String hpCertificationCode = "";
		
		int randnum = 0;
		for(int i=0; i<7; i++) {
			randnum = rnd.nextInt(9 - 0 + 1) + 0;
			hpCertificationCode += randnum;
		}
		
		// 랜덤하게 생성한 인증코드(certificationCode)를 비밀번호 찾기를 하고자 하는 사용자의 email로 전송시킨다.
		GoogleMail mail = new GoogleMail();
        HttpSession session = request.getSession();
		
        boolean isSent;
        try {
        	//System.out.println("~~~~~ 메일전송  시작 ~~~~~");
			mail.sendmail(email, hpCertificationCode);
			session.setAttribute("hpCertificationCode", hpCertificationCode);
			isSent = true;
        } catch (Exception e) {
			e.printStackTrace();
			isSent= false;
		}
        JSONObject json = new JSONObject();
        json.put("isSent", isSent);
        return json.toString();  
	}
	
	// === 회원가입 이메일 인증확인 === //
	@ResponseBody
	@RequestMapping(value="/verifyCertificationFrm.sd", method={RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String verifyCertification(HttpServletRequest request) {
		
		String userCertificationCode = request.getParameter("userCertificationCode");

		HttpSession session = request.getSession();
		String certificationCode = (String)session.getAttribute("certificationCode");
	
		// System.out.println("userCertificationCode 인증 코드 : "+userCertificationCode);
		// System.out.println("certificationCode 인증 코드 : "+certificationCode);
		
		boolean isbool=false;
		if( certificationCode.equals(userCertificationCode) ) {
			isbool=true;
			// System.out.println("인증코드 맞음");
		}
		else {
			isbool=false;
			// System.out.println("인증코드 안 맞음");
		}
		//session.removeAttribute("certificationCode"); // 세션에 저장된 인증코드 삭제하기
		JSONObject json = new JSONObject();
        json.put("isbool", isbool);
        return json.toString();  
	}
	@ResponseBody
	@RequestMapping(value="/hpVerifyCertificationFrm.sd", method={RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String hpVerifyCertificationFrm(HttpServletRequest request) {
		
		String hpUserCertificationCode = request.getParameter("hpUserCertificationCode");

		HttpSession session = request.getSession();
		String hpCertificationCode = (String)session.getAttribute("hpCertificationCode");
	
		// System.out.println("hpUserCertificationCode 인증 코드 : "+hpUserCertificationCode);
		// System.out.println("hpCertificationCode 인증 코드 : "+hpCertificationCode);
		
		boolean isbool=false;
		if( hpCertificationCode.equals(hpUserCertificationCode) ) {
			isbool=true;
			// System.out.println("인증코드 맞음");
		}
		else {
			isbool=false;
			// System.out.println("인증코드 안 맞음");
		}
		JSONObject json = new JSONObject();
        json.put("isbool", isbool);
        return json.toString();  
	}

	// === 회원가입 아이디 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/idChk.sd", method= {RequestMethod.POST})
	public String idChk(HttpServletRequest request) {
		String userid= request.getParameter("userid");
		
		boolean isUse = service.idChk(userid);
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	@ResponseBody
	@RequestMapping(value="/hpIdChk.sd", method= {RequestMethod.POST})
	public String hpIdChk(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		
		boolean isUse = service.hpIdChk(userid);
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 회원가입 이메일 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/emailChk.sd", method= {RequestMethod.POST})
	public String emailChk(HttpServletRequest request) {
		String email= request.getParameter("email");
		
		boolean isUse = service.emailChk(email);
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	@ResponseBody
	@RequestMapping(value="/hpEmailChk.sd", method= {RequestMethod.POST})
	public String hpEmailChk(HttpServletRequest request) {
		String email = request.getParameter("email");
		
		boolean isUse = service.hpEmailChk(email);
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 회원가입 사업자번호 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/regIdChk.sd", method= {RequestMethod.POST})
	public String regIdChk(HttpServletRequest request) {
		String regId = request.getParameter("regId");
		
		boolean isUse = service.regIdChk(regId);
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 아이디 찾기 === //
	@RequestMapping("/idFind.sd")
	public ModelAndView idFind(ModelAndView mav) {
		mav.setViewName("login/idFind.tiles1");
		return mav;
	}
	@RequestMapping("/hpIdFind.sd")
	public ModelAndView hpIdFind(ModelAndView mav) {
		mav.setViewName("login/idFind.tiles1");
		return mav;
	}
	
	// === 아이디 찾기 결과 === //
	@RequestMapping("/idFindResult.sd")
	public ModelAndView idFindResult(HttpServletRequest request, ModelAndView mav) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		//System.out.println(name);
		//System.out.println(email);
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("name", name);
		paraMap.put("email", email);
		
		MemberVO member = service.idFindResult(paraMap);
		
		int check = 0;
		if(member == null) {			
			String msg = "입력하신 정보는 존재하지 않습니다.";
			String loc = request.getContextPath() + "/idFind.sd";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		} else {
			mav.addObject("userid",member.getUserid());
			mav.addObject("registerDate", member.getRegisterDate());
			
			mav.setViewName("login/idFindResult.tiles1");
			check = 1;
		}
		mav.addObject("check", check);
		
		return mav;
	}
	@RequestMapping("/hpIdFindResult.sd")
	public ModelAndView hpIdFindResult(HttpServletRequest request, ModelAndView mav) {
		String regId = request.getParameter("regId");
		String email = request.getParameter("email");
		//System.out.println(regId);
		//System.out.println(email);
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("regId", regId);
		paraMap.put("email", email);
		
		HpMemberVO hpMember = service.hpIdFindResult(paraMap);
		int check = 0;
		if(hpMember == null) {			
			String msg = "입력하신 정보는 존재하지 않습니다.";
			String loc = request.getContextPath() + "/idFind.sd";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		} else {
			mav.addObject("userid",hpMember.getUserid());
			mav.addObject("registerDate", hpMember.getRegisterDate());

			mav.setViewName("login/idFindResult.tiles1");
			check = 2;
		}
		mav.addObject("check", check);
		
		return mav;
	}	
	
	// === 비밀번호 찾기 === //
	@RequestMapping("/pwdFind.sd")
	public ModelAndView pwdFind(ModelAndView mav) {
		mav.setViewName("login/pwdFind.tiles1");
		return mav;
	}
	@RequestMapping("/hpPwdFind.sd")
	public ModelAndView hpPwdFind( ModelAndView mav) {
		mav.setViewName("login/pwdFind.tiles1");
		return mav;
	}
	
	// === 비밀번호 재설정 전 확인 === //
	@RequestMapping("/pwdUpdate.sd")
	public ModelAndView pwdUpdate(HttpServletRequest request, HttpSession session, MemberVO vo, ModelAndView mav) {
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String type = request.getParameter("type");
		System.out.println(name);
		System.out.println(userid);
		System.out.println(email);
		System.out.println(code);
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("name", name);
		paraMap.put("userid", userid);
		paraMap.put("email", email);

		int n = service.checkMember(paraMap);

		if(n == 0) {
			String msg = "입력하신 정보는 존재하지 않습니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		} else {
			mav.addObject("name", name);
			mav.addObject("userid", userid);
			mav.addObject("email", email);
			mav.addObject("type", type);
			mav.setViewName("login/pwdUpdate.tiles1");
		}
		return mav;
	}
	@RequestMapping("/hpPwdUpdate.sd")
	public ModelAndView hpPwdUpdate(HttpServletRequest request, HttpSession session, MemberVO vo, ModelAndView mav) {
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String type = request.getParameter("type");
		System.out.println(name);
		System.out.println(userid);
		System.out.println(email);
		System.out.println(code);
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("name", name);
		paraMap.put("userid", userid);
		paraMap.put("email", email);

		int n = service.hpCheckMember(paraMap);

		if(n == 0) {
			String msg = "입력하신 정보는 존재하지 않습니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		} else {
			mav.addObject("name", name);
			mav.addObject("userid", userid);
			mav.addObject("email", email);
			mav.addObject("type", type);
			mav.setViewName("login/pwdUpdate.tiles1");
		}
		return mav;
	}
	
	// 비밀번호 바꾸기 // 
	@RequestMapping("/changePwd.sd")
	public ModelAndView changePwd(HttpServletRequest request, HttpSession session, ModelAndView mav) {	
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("pwd2", Sha256.encrypt(pwd2));
		paraMap.put("userid", userid);
		paraMap.put("name", name);
		paraMap.put("email", email);
		
		String msg = "";
		String loc = "";
		
		int n = service.pwdUpdate(paraMap);

		msg = "비밀번호가 성공적으로 변경됐습니다.";
		loc = request.getContextPath() + "/login.sd";

		if(n == 0) {
			msg = "다시 시도해주세요!";
			loc = request.getContextPath() + "/pwdFind";
		}
		session.invalidate(); // 세션 끊기

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		
		return mav;
	}
	@RequestMapping("/hpChangePwd.sd")
	public ModelAndView hpChangePwd(HttpServletRequest request, HttpSession session, ModelAndView mav) {	
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		HashMap<String, String> paraMap = new HashMap<>();	
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("pwd2", Sha256.encrypt(pwd2));
		paraMap.put("userid", userid);
		paraMap.put("name", name);
		paraMap.put("email", email);
		
		String msg = "";
		String loc = "";
		
		int n = service.hpPwdUpdate(paraMap);

		msg = "비밀번호가 성공적으로 변경됐습니다.";
		loc = request.getContextPath() + "/login.sd";

		if(n == 0) {
			msg = "다시 시도해주세요!";
			loc = request.getContextPath() + "/pwdFind";
		}
		session.invalidate(); // 세션 끊기

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		
		return mav;
	}
}
