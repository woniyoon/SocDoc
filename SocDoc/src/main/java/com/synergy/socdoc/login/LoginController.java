package com.synergy.socdoc.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synergy.socdoc.common.Sha256;

@Controller
public class LoginController {

	@Autowired
	private InterLoginService service;
	
	// === 로그인 폼 페이지 요청 === //
	@RequestMapping("/login.sd")
	public String login(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/loginform.sd로 접속하셨습니다.");
		
		return "login/loginform.tiles1";
	}

	// === 로그인 폼 페이지 요청 === //
/*	@RequestMapping(value="/loginEnd.sd", method= {RequestMethod.POST})
	public ModelAndView loginEnd(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // 암호화 하겠다.
		
		MemberVO loginuser = service.getLoginMember(paraMap);
		
		HttpSession session = request.getSession();
		
		if(loginuser == null) {
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg"); // 타일즈가 없어서 2순위?
			//	/WEB-INF/views/msg.jsp 파일을 생성한다.
			
		} else {
			
			if(loginuser.isIdleStatus() == true) { // == true 빼도 됨. 
				// 로그인을 한지 1년이 지나서 휴면상태에 빠진 경우
				String msg = "로그인을 한지 1년이 지나서 휴면상태에 빠졌습니다.";
				String loc = "javascript:history.back()";
				
				mav.addObject("msg", msg);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");
				//	/WEB-INF/views/msg.jsp 파일을 생성한다.
			
			} else {
				
				if(loginuser.isRequirePwdChange() == true ) { // == true 빼도 됨.  // 복호화 되어진 loginuser
					// 암호를 최근 3개월 동안 변경하지 않은 경우 
					session.setAttribute("loginuser", loginuser);
					
					String msg = "암호를 최근 3개월 동안 변경하지 않으셨습니다. 암호변경을 위해 나의정보 페이지로 이동합니다.";
					String loc = request.getContextPath()+"/myinfo.action";
								//		/board/myinfo.action
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
					//	/WEB-INF/views/tiles1/login/loginEnd.jsp 파일을 생성한다.
				}
			}
		}
		
		return mav;
	}*/
	
	// === 회원가입 폼 페이지 요청 === //
	@RequestMapping("/register.sd")
	public String register(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/register.sd로 접속하셨습니다.");
		
		return "login/register.tiles1";
	}
	
	// === 회원가입 아이디 중복검사 === //
	@ResponseBody
	@RequestMapping(value="/login/idChk.sd", method= {RequestMethod.POST})
	public String idChk(HttpServletRequest request) {
		String userid= request.getParameter("userid");
		
		boolean isUse = service.idChk(userid);
		System.out.println("isUse 값 : " + isUse);
		/*String ctxPath = request.getContextPath();*/
		JSONObject json = new JSONObject();
		json.put("isUse", isUse);
		
		return json.toString();
	}
	
	// === 아이디 찾기 === //
	@RequestMapping("/idFind.sd")
	public String idFind(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/idFind.sd로 접속하셨습니다.");
		
		return "login/idFind.tiles1";
	}
	
	// === 아이디 찾기 결과 === //
	@RequestMapping("/idFindResult.sd")
	public String idFindResult(HttpServletRequest request) {
		
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/idFindResult.sd로 접속하셨습니다.");
		
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
