package com.synergy.socdoc.login;

import java.util.HashMap;
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
		
		/*String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/loginform.sd로 접속하셨습니다.");*/
		mav.setViewName("login/loginform.tiles1");
		
		return mav;
	}

	// === 로그인 처리 === //
	@RequestMapping(value="/loginEnd.sd", method= {RequestMethod.POST})
	public ModelAndView loginEnd(HttpServletRequest request, ModelAndView mav) {
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // 암호화
		
		MemberVO loginuser = service.getLoginMember(paraMap);
		
		if(loginuser == null) {
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
		} else {
			String msg = "속닥 로그인 성공 희희바리~~ 건강한 하루 보내세요 ^~^";
			String loc = request.getContextPath() + "/index.sd";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
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
					// 아무런 이상없이 로그인 하는 경우(휴면기간도 아니고 암호변경기간도 아닌 완전깔끔한 상태일 때)
					session.setAttribute("loginuser", loginuser); // 세션에 값을 넣어준다.
					
					if(session.getAttribute("gobackURL") != null) {
			    		// 세션에 저장된 돌아갈 페이지 주소(gobackURL)가 있다라면 
			    		
			    		String gobackURL = (String) session.getAttribute("gobackURL");
			    		mav.addObject("gobackURL", gobackURL); // request 영역에 저장시키는 것이다.
			    		
			    		session.removeAttribute("gobackURL");  // 중요!!!!
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
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // 암호화
		
		HpMemberVO loginuser = service.getHpLoginMember(paraMap);
	
		if(loginuser == null) {
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
		} else {
			String msg = "속닥 로그인 성공 희희바리~~ 건강한 하루 보내세요 ^~^";
			String loc = request.getContextPath() + "/index.sd";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
		}	
		return mav;
	}	
	// 로그아웃 처리 //
	@RequestMapping(value="/logout.sd")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav) {  //직접 세션해도 되고, HttpServletRequest request 해도 됨)
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/index.sd";
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}
	@RequestMapping(value="/hpLogout.sd")
	public ModelAndView hpLogout(HttpServletRequest request, ModelAndView mav) {  //직접 세션해도 되고, HttpServletRequest request 해도 됨)
		
		HttpSession session = request.getSession();
		session.invalidate();
		
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
		System.out.println(ctxPath+"/register.sd로 접속하셨습니다.");
	
		return "login/register.tiles1";
	}

	// 회원 회원가입 //
	@RequestMapping(value="/registerEnd.sd", method= {RequestMethod.POST})
	public String register(MemberVO vo, HttpServletRequest request) {
		/*System.out.println("회원가입 성공??");
		System.out.println(" 이름 :" + vo.getName());
		System.out.println(" 번호 " + vo.getPhone());
		System.out.println(" 아이디 " + vo.getUserid());
		System.out.println(" 비번 : " + vo.getPwd());
		System.out.println(" 이메일 : " + vo.getEmail());
		System.out.println("생년월일 : " + vo.getBirthDate());
		System.out.println("성별 : " + vo.getGender());*/
		
		HashMap<String, String> paraMap = new HashMap<>();
		String pwd = Sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd); // pwd를 vo로 보내주자
		
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
			loc = "history.back()";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg";
	}
	// 병원 회원가입 //
	@RequestMapping(value="/hpRegisterEnd.sd", method= {RequestMethod.POST})
	public String hpRegisterEnd(HpMemberVO vo, HttpServletRequest request) {
		/*System.out.println("회원가입 성공??");
		System.out.println(" 이름 :" + vo.getName());
		System.out.println(" 아이디 " + vo.getUserid());
		System.out.println(" 비번 : " + vo.getPwd());
		System.out.println(" 이메일 : " + vo.getEmail());
		System.out.println(" 사업자 : " + vo.getRegId());*/
		
		HashMap<String, String> paraMap = new HashMap<>();
		String pwd = Sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd); // pwd를 vo로 보내주자
		
		HttpSession session = request.getSession();
		int n = service.hpRegister(vo);
	
		String msg = "";
		String loc = "";
		if(n==1) {
			session.setAttribute("loginuser", vo);
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
	
	// === 회원가입 회원 이메일 인증키 난수 만들기 === //
	@ResponseBody
	@RequestMapping(value="/emailCode.sd", method = {RequestMethod.POST})
	public String emailCode(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		Random rnd = new Random();	// 인증키를 랜덤하게 생성하도록 한다.
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
        	System.out.println("~~~~~~~~~~~~~~~~ 메일전송  시작 ~~~~~~~~~~~~~~~~");
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
	// === 회원가입 병원 이메일 인증키 난수 만들기 === //
	@ResponseBody
	@RequestMapping(value="/hpEmailCode.sd", method = {RequestMethod.POST})
	public String hpEmailCode(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		Random rnd = new Random(); 	// 인증키를 랜덤하게 생성하도록 한다.
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
        	System.out.println("~~~~~~~~~~~~~~~~ 메일전송  시작 ~~~~~~~~~~~~~~~~");
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
	
	// === 회원가입 회원 이메일 인증확인 === //
	@ResponseBody
	@RequestMapping(value="/verifyCertificationFrm.sd", method={RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String verifyCertification(HttpServletRequest request) {
		
		String userCertificationCode = request.getParameter("userCertificationCode");

		HttpSession session = request.getSession();
		String certificationCode = (String)session.getAttribute("certificationCode");
	
		System.out.println("userCertificationCode 인증 코드 : "+userCertificationCode);
		System.out.println("certificationCode 인증 코드 : "+certificationCode);
		
		boolean isbool=false;
		if( certificationCode.equals(userCertificationCode) ) {
			isbool=true;
			System.out.println("인증코드 맞음");
		}
		else {
			isbool=false;
			System.out.println("인증코드 안 맞음");
		}
		/*
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);*/
		//session.removeAttribute("certificationCode"); // 세션에 저장된 인증코드 삭제하기
		JSONObject json = new JSONObject();
        json.put("isbool", isbool);
        return json.toString();  
	}
	// === 회원가입 병원 이메일 인증확인 === //
		@ResponseBody
		@RequestMapping(value="/hpVerifyCertificationFrm.sd", method={RequestMethod.POST}, produces="text/plain;charset=UTF-8")
		public String hpVerifyCertificationFrm(HttpServletRequest request) {
			
			String hpUserCertificationCode = request.getParameter("hpUserCertificationCode");

			HttpSession session = request.getSession();
			String hpCertificationCode = (String)session.getAttribute("hpCertificationCode");
		
			System.out.println("hpUserCertificationCode 인증 코드 : "+hpUserCertificationCode);
			System.out.println("hpCertificationCode 인증 코드 : "+hpCertificationCode);
			
			boolean isbool=false;
			if( hpCertificationCode.equals(hpUserCertificationCode) ) {
				isbool=true;
				System.out.println("인증코드 맞음");
			}
			else {
				isbool=false;
				System.out.println("인증코드 안 맞음");
			}
			/*
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);*/
			
			// !!! 중요 !!! //
			// 세션에 저장된 인증코드 삭제하기 !!!!
			//session.removeAttribute("certificationCode");
			JSONObject json = new JSONObject();
	        json.put("isbool", isbool);
	        return json.toString();  
		}


	// === 회원가입 회원 아이디 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/idChk.sd", method= {RequestMethod.POST})
	public String idChk(HttpServletRequest request) {
		String userid= request.getParameter("userid");
		
		boolean isUse = service.idChk(userid);
		//System.out.println("isUse 값 : " + isUse);
		/*String ctxPath = request.getContextPath();*/
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 회원가입 병원 아이디 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/hpIdChk.sd", method= {RequestMethod.POST})
	public String hpIdChk(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		
		boolean isUse = service.hpIdChk(userid);
		//System.out.println("isUse 값 : " + isUse);
		/*String ctxPath = request.getContextPath();*/
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 회원가입 회원 이메일 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/emailChk.sd", method= {RequestMethod.POST})
	public String emailChk(HttpServletRequest request) {
		String email= request.getParameter("email");
		
		boolean isUse = service.emailChk(email);
		//System.out.println("emailChk 값 : " + isUse);
		/*String ctxPath = request.getContextPath();*/
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 회원가입 병원 이메일 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/hpEmailChk.sd", method= {RequestMethod.POST})
	public String hpEmailChk(HttpServletRequest request) {
		String email = request.getParameter("email");
		
		boolean isUse = service.hpEmailChk(email);
		//System.out.println("isUse 값 : " + isUse);
		/*String ctxPath = request.getContextPath();*/
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 아이디 찾기 === //
	@RequestMapping("/idFind.sd")
	public String idFind(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		//System.out.println(ctxPath+"/idFind.sd로 접속하셨습니다.");
		
		return "login/idFind.tiles1";
	}
	
	// === 아이디 찾기 결과 === //
	@RequestMapping("/idFindResult.sd")
	public String idFindResult(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		//System.out.println(ctxPath+"/idFindResult.sd로 접속하셨습니다.");
		
		return "login/idFindResult.tiles1";
	}
	
	// === 비밀번호 찾기 === //
	@RequestMapping("/pwdFind.sd")
	public String pwdFind(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/pwdFind.sd로 접속하셨습니다.");
		
		return "login/pwdFind.tiles1";
	}
	
	// === 비밀번호 재설정 === //
	@RequestMapping("/pwdUpdate.sd")
	public String pwdUpdate(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/pwdUpdate.sd로 접속하셨습니다.");
		
		return "login/pwdUpdate.tiles1";
	}
	
	// === 게시판 list === //
	@RequestMapping("/noticeList.sd")
	public String noticeList(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/noticeList.sd로 접속하셨습니다.");
		
		return "notice/noticeList.tiles1";
	}
	
	// === 게시판 view === //
	@RequestMapping("/noticeView.sd")
	public String noticeView(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/noticeView.sd로 접속하셨습니다.");
		
		return "notice/noticeView.tiles1";
	}
	
	// === 게시판 write === //
	@RequestMapping("/noticeWrite.sd")
	public String noticeWrite(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/noticeWrite.sd로 접속하셨습니다.");
		
		return "notice/noticeWrite.tiles1";
	}
}
