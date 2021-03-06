package com.synergy.socdoc.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.synergy.socdoc.common.MyUtil;
import com.synergy.socdoc.common.Sha256;
import com.synergy.socdoc.mail.GoogleMail;
import com.synergy.socdoc.mail.GoogleMail2;
import com.synergy.socdoc.member.CommentVO;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.QnaBoardVO;
import com.synergy.socdoc.member.ReservationVO;
import com.synergy.socdoc.mypage.service.InterMyPageService;


@Controller  
public class MypageController {

	@Autowired
	private InterMyPageService service;
	
	// === 마이페이지 메인 페이지 요청 === // 
	@RequestMapping(value="/mypage.sd")
	public ModelAndView requiredLogin_mypage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		
		/*if( loginuser.getUserid().trim() == null) {
			String msg = "로그인이 필요한 서비스입니다.";
			String loc = request.getContextPath()+"/login.sd";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			mav.setViewName("msg");
		}*/
		
		
		
		String userid = loginuser.getUserid();
		mav.addObject("userid",userid);
		
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		///////////////////////////////////////////////////////내 건강
		
		MemberVO membervo = service.viewMyHealth(userid);
		mav.addObject("membervo", membervo);
		
		////////////////////////////////////////////////////////즐겨찾기
		
		List<HashMap<String,String>> bookMarkList = service.bookMarkList(paraMap);
		mav.addObject("bookMarkList",bookMarkList);
		
		////////////////////////////////////////////////////////예약확인
		
		List<HashMap<String,String>> reservationList = service.reservationList(paraMap);
		mav.addObject("reservationList",reservationList);
		
		////////////////////////////////////////////////////////진료이력
		
		List<HashMap<String,String>> historyList = service.historyList(paraMap);
		mav.addObject("historyList",historyList);
		
		////////////////////////////////////////////////////////내후기
		
		List<HashMap<String,String>> reviewList = service.reviewList(paraMap);
		mav.addObject("reviewList",reviewList);
		
		mav.setViewName("myPage/main.tiles2");
	
		return mav;
	}
	
	// === 회원정보 수정 페이지 - 비밀번호 입력 페이지 === // 
	@RequestMapping(value="/infoEdit.sd")
	public String infoEdit() {
	
		return "myPage/infoEdit.tiles2";
	}

	// === 회원정보 수정 페이지2 - 기본정보변경 & 비밀번호 변경 페이지 === // 
	@RequestMapping(value="/infoEdit2.sd")
	public ModelAndView infoEdit2(HttpServletRequest request, ModelAndView mav) {
	
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		// String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd));
		
		loginuser = service.loginInfoEdit(paraMap);
		
		if(loginuser == null) {
			String msg = "암호가 일치하지 않습니다.";
			String loc = "javascript:history.back()";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("msg"); 
		} else {
			
			mav.setViewName("myPage/infoEdit2.tiles2"); 
			session.setAttribute("loginuser", loginuser);
		}	
		
		return mav;
	}
	
	// === 회원가입 이메일 인증키 난수 만들기 === //
	@ResponseBody
	@RequestMapping(value="/hpEmailCode2.sd", method = {RequestMethod.POST})
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
		GoogleMail2 mail = new GoogleMail2();
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
	
	
	
	
	// === 회원가입 이메일 인증확인 === //
	@ResponseBody
	@RequestMapping(value="/verifyCertificationFrm2.sd", method={RequestMethod.POST}, produces="text/plain;charset=UTF-8")
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
	
	
	
	// === 문의내역 페이지 === // 
	@RequestMapping(value="/askList.sd")
	public ModelAndView askList(HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		
		List<QnaBoardVO> askList = null;
		
		/*String searchType = request.getParameter("searchType");*/
        String searchWord = request.getParameter("searchWord");
        // System.out.println(searchWord);
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        
        if(searchWord == null || searchWord.trim().isEmpty()) {
           searchWord = "";
        }
        
        /*if(searchType == null) {
        	searchType = "";
         }*/
        
        HashMap<String,String> paraMap = new HashMap<>();
      /*  paraMap.put("searchType", searchType); // "컬럼"*/ 
       paraMap.put("userid", userid);
       paraMap.put("searchWord", searchWord); // 검색어를 담는다.
        
        // 먼저 총 게시물 건수(totalCount)를 구해와야한다. 
        // 총 게시물 건수(totalCount)는 검색조건이 있을때와 없는때로 나뉘어진다.
        int totalCount = 0;              // 총 게시물 건수
        int sizePerPage = 10;            // 한 페이지당 보여줄 게시물 건수
        int currentShowPageNo = 0; 		 // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 
        int totalPage = 0;               // 총 페이지 수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
        
        int startRno = 0;      			 // 시작 행번호
        int endRno = 0;      			 // 끌 행번호
        
        // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정한다. 
        
        // 총 게시물 건수(totalCount)
        totalCount = service.getTotalCount(paraMap);
//    	System.out.println("~~~~ 확인용 totalCount : " + totalCount);
        
        // 만약에 총 게시물 건수(totalCount)가 127개라면, 
        // 총 페이지 수(totalPage)는 13개가 되어야 한다. 
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );	 // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> (int)13.0 ==> 13
										 								 // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> (int)12.0 ==> 12
        
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면
        	
        	currentShowPageNo = 1;
        	// 즉, 초기화면인 /list.action 은 /list.action?currentShowPageNo=1 로 하겠다는 말이다.
        }
        else {
	        try {
	        	currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
	        		currentShowPageNo = 1;
	        	}
	        	
	        } catch(NumberFormatException e) {
	        	currentShowPageNo = 1;
	        }
        }
        
        // **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
    	/*
    	     currentShowPageNo      startRno     endRno
    	    --------------------------------------------
    	         1 page        ===>    1           10
    	         2 page        ===>    11          20
    	         3 page        ===>    21          30
    	         4 page        ===>    31          40
    	         ......                ...         ...
    	 */
        
        startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
   		endRno = startRno + sizePerPage - 1; 

   		paraMap.put("startRno", String.valueOf(startRno));
   		paraMap.put("endRno", String.valueOf(endRno));
        
   		askList = service.boardListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		
		// === #119. 페이지바 만들기 === //
		String pageBar = "";
        
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이번호의 개수 이다.
		/*
		 	1 2 3 4 5 6 7 8 9 10  다음 		 -- 1개블럭
		 이전	11 12 13 14 15 16 17 18 19 20  다음 -- 1개블럭
		 이전	21 22 23
		 */
		
		int loop = 1;
		/*
		 	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //
		
	/*
	    1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
	    11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
	    21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
	    
	    currentShowPageNo         pageNo
	   ----------------------------------
	         1                      1 = ((1 - 1)/10) * 10 + 1
	         2                      1 = ((2 - 1)/10) * 10 + 1
	         3                      1 = ((3 - 1)/10) * 10 + 1
	         4                      1
	         5                      1
	         6                      1
	         7                      1 
	         8                      1
	         9                      1
	         10                     1 = ((10 - 1)/10) * 10 + 1
	        
	         11                    11 = ((11 - 1)/10) * 10 + 1
	         12                    11 = ((12 - 1)/10) * 10 + 1
	         13                    11 = ((13 - 1)/10) * 10 + 1
	         14                    11
	         15                    11
	         16                    11
	         17                    11
	         18                    11 
	         19                    11 
	         20                    11 = ((20 - 1)/10) * 10 + 1
	         
	         21                    21 = ((21 - 1)/10) * 10 + 1
	         22                    21 = ((22 - 1)/10) * 10 + 1
	         23                    21 = ((23 - 1)/10) * 10 + 1
	         ..                    ..
	         29                    21
	         30                    21 = ((30 - 1)/10) * 10 + 1
	*/
		
		String url = "askList.sd";
		
		// === [이전] 만들기 === 
		if(pageNo != 1) {
//			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			pageBar +=" <a class='arrow pprev' href='\"+url+\"?searchWord=\"+searchWord+\"&currentShowPageNo=1'></a>";
			pageBar +=" <a class='arrow prev' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'></a>";
		}
	
		while ( !(loop > blockSize || pageNo > totalPage) ) {

			if(pageNo == currentShowPageNo) {
				//pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center; border: solid 1px gray; color: red; padding: 2px 4px;'>"+pageNo+"</li>";
				pageBar += "<a class='active'>"+pageNo+"</a>";
			}
			else {
				pageBar += "<a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a>";
			}
			loop++;
			pageNo++;
			
		}// end of while--------------------------------------
		
		
		// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar +=" <a class='arrow next' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo+1)+"'></a>";
			pageBar +=" <a class='arrow nnext' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'></a>";
		}
		
		mav.addObject("pageBar", pageBar);
		
		////////////////////////////////////////////////////
		String gobackURL = MyUtil.getCurrentURL(request);
		/*// === #121. 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
		// 			  사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 			  현재 페이지 주소를 뷰단으로 넘겨준다.
*/
//		System.out.println("~~~~~ 확인용 gobackURL : " + gobackURL);
		
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("totalCount", totalCount);

		
		//////////////////////////////////////////////////////
		// === #69. 글조회수(readCount)증가 (DML문 update)는
		//          반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고,
		//          웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		//          이것을 하기 위해서는 session 을 사용하여 처리하면 된다.

		session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		/*
		   session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
		   session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		      반드시 웹브라우저에서 주소창에 "/list.action" 이라고 입력해야만 얻어올 수 있다. 
		*/
		//////////////////////////////////////////////////////
		
		mav.addObject("askList",askList);
		mav.setViewName("myPage/askList.tiles2");
		
		return mav;
		
	}
	
	
	// === 회원정보수정하기 (기본정보변경) === // 
	@RequestMapping(value="/infoStore.sd", method= {RequestMethod.POST})
	public String infoStore(MemberVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		String pwd = request.getParameter("pwd");
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setUserid(userid);
		vo.setPwd(Sha256.encrypt(pwd));
		
		int n = service.updateInfo(vo);
		
		System.out.println(pwd);
	
		String msg = "";
		String loc = "";
		if(n==1) {
			session.setAttribute("loginuser", vo);
			msg = "정보가 수정되었습니다.";
			loc = request.getContextPath() + "/infoEdit.sd";
		} else {
			msg = "다시 시도해주세요!";
			loc = "javascript:history.back()";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg";
	}
	
	
	// === 비밀번호 재설정 === //
	@RequestMapping(value="/goUpdatePwd.sd")
	public String goUpdatePwd(MemberVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		String pwd = request.getParameter("pwd");
		
		vo.setUserid(userid);
		vo.setPwd(Sha256.encrypt(pwd));
		
		int n = service.goUpdatePwd(vo);
	
		String msg = "";
		String loc = "";
		if(n==1) {
			session.setAttribute("loginuser", vo);
			msg = "비밀번호가 수정되었습니다.";
			loc = request.getContextPath() + "/infoEdit.sd";
		} else {
			msg = "다시 시도해주세요!";
			loc = "javascript:history.back()";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "msg";
	}
	
	// === 문의하기 페이지 === // 
	@RequestMapping(value="/ask.sd")
	public ModelAndView ask(HttpServletRequest request, ModelAndView mav) {
		
		
		// 조회하고자 하는 글번호 받아오기 
		String qnaSeq = request.getParameter("qnaSeq");
		String parentSeq = request.getParameter("parentSeq");
		
		// === #123. 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
		// 			  사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 			  현재 페이지 주소를 뷰단으로 넘겨준다.
		
		String gobackURL = request.getParameter("gobackURL");
		mav.addObject("gobackURL", gobackURL);
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = null;
		
		if(loginuser != null) {
			userid = loginuser.getUserid();
			// userid 는 로그인 되어진 사용자의 userid 이다.
		}
		
		// === #68. !!! 중요 !!! 
	    //     글1개를 보여주는 페이지 요청은 select 와 함께 
		//     DML문(지금은 글조회수 증가인 update문)이 포함되어져 있다.
		//     이럴경우 웹브라우저에서 페이지 새로고침(F5)을 했을때 DML문이 실행되어
		//     매번 글조회수 증가가 발생한다.
		//     그래서 우리는 웹브라우저에서 페이지 새로고침(F5)을 했을때는
		//     단순히 select만 해주고 DML문(지금은 글조회수 증가인 update문)은 
		//     실행하지 않도록 해주어야 한다. !!! === //
		
		QnaBoardVO boardvo = null;
		
		// 위의 글목록보기 #69. 에서 session.setAttribute("readCountPermission", "yes"); 해두었다.
	    if( "yes".equals(session.getAttribute("readCountPermission")) ) {
	    	// 글목록보기를 클릭한 다음에 특정글을 조회해온 경우이다.
	    	
	    	/*boardvo = service.getView(seq, userid);
			// 글조회수 증가와 함께 글1개를 조회를 해주는 것 
*/	    	
	    	boardvo = service.getViewWithNoAddCount(qnaSeq);
	    	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
	    	
	    	session.removeAttribute("readCountPermission");
	    	// 중요함!! session 에 저장된 readCountPermission 을 삭제한다.
	    }
	    else {
	    	// 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.
	    	
	    	boardvo = service.getViewWithNoAddCount(qnaSeq);
	    	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
	    }
		
		
		mav.addObject("boardvo", boardvo);
		mav.setViewName("myPage/ask.tiles2");
		
		return mav;
		
	}
	
	// === 문의내역(목록) 삭제하기 페이지 === //
	@RequestMapping(value="/goDel.sd" ,method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView goDel(@RequestParam("items") String[] items, ModelAndView mav, HttpServletRequest request) throws Exception {
		// 삭제할 사용자 ID마다 반복해서 사용자 삭제 
		for (String qnaSeq : items) { 
			System.out.println("글삭제 = " + qnaSeq); 
			int n = service.goDel(qnaSeq); 
		} 
		
		// 목록 페이지로 이동
		/*mav.addObject("msg", "글삭제 성공!!");*/
		mav.addObject("loc",request.getContextPath()+"/askList.sd");
		
		mav.setViewName("msg");
		
		return mav;

       }

	
	// === 문의내역(글) 삭제하기 페이지 === //
	@RequestMapping(value="/deleteAsk.sd")
	public ModelAndView deleteAsk(HttpServletRequest request, ModelAndView mav) throws Throwable {
		
		String qnaSeq = request.getParameter("qnaSeq");
		String parentSeq = request.getParameter("parentSeq");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("qnaSeq", qnaSeq);
		paraMap.put("parentSeq", parentSeq);
		
		System.out.println("parentSeq:"+parentSeq);
		
		int n = service.del(paraMap);
		
		if(n == 0) {
			mav.addObject("msg", "글삭제 실패!! 관리자에게 문의하세요.");
			mav.addObject("loc", request.getContextPath()+"/ask.sd?qnaSeq="+qnaSeq);
		}
		else {
			mav.addObject("msg", "글삭제 성공!!");
			mav.addObject("loc", request.getContextPath()+"/askList.sd"); 
		}
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	// === 내 건강 페이지 보이기(select) === // 
	@RequestMapping(value="/myHealth.sd")
	public ModelAndView myHealth(HttpServletRequest request, ModelAndView mav) {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
	
		mav.addObject("userid",userid);
		
		 
		
		MemberVO membervo = service.viewMyHealth(userid);
		
		// List<MemberVO> memberList = service.viewMyHealthTest();
		
		
		
		mav.addObject("membervo", membervo);
		mav.setViewName("myPage/myHealth.tiles2");

		return mav;
	}
	
	// === 내 건강 페이지 새로 추가하기(update) === // 
	@RequestMapping(value="/addHealth.sd")
	public ModelAndView addHealth(HttpServletRequest request, MemberVO membervo, ModelAndView mav) {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		System.out.println(userid);
		
		mav.addObject("userid",userid);
		
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String bloodType = request.getParameter("bloodType");
		String allergy = request.getParameter("allergy");
		String history = request.getParameter("history");
		String medicine = request.getParameter("medicine");
		
		HashMap<String,String> paraMap = new HashMap<>();
		 paraMap.put("userid", userid);
	     paraMap.put("height", height);
	     paraMap.put("weight", weight);
	     paraMap.put("bloodType", bloodType);
	     paraMap.put("allergy", allergy);
	     paraMap.put("history", history);
	     paraMap.put("medicine", medicine);
	     
	     mav.addObject("paraMap", paraMap);
		// membervo = service.viewMyHealth(userid);
		
		int n = service.updateHealth(paraMap);
		
		// int n = service.updateHealth(userid);
		
		mav.addObject("msg", "내 건강 저장 성공!!");
		
	    mav.addObject("membervo", membervo);
		
		mav.addObject("loc", request.getContextPath()+"/myHealth.sd?userid="+membervo.getUserid());
		mav.setViewName("msg");
		
		return mav;
	}
	
	// === 내 건강 페이지 초기화하기 (delete) === // 
	@RequestMapping(value="/delHealth.sd")
	public ModelAndView delHealth(HttpServletRequest request, ModelAndView mav) throws Throwable {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		mav.addObject("userid",userid);
		
		int n = service.delHealth(userid);
		
		mav.addObject("msg", "내 건강을 초기화 하였습니다.");
		mav.addObject("loc", request.getContextPath()+"/myHealth.sd"); 
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	// === 병원 즐겨찾기 페이지 === // 
	@RequestMapping(value="/bookMark.sd")
	public ModelAndView bookMark(HttpServletRequest request, ModelAndView mav) {
		
		/*List<HpInfoVO> bookMarkList = null;*/
		
		/*// userid 들오기
		String userid = service.userid();*/
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		String hpSeq = request.getParameter("hpSeq");
		String bookSeq = request.getParameter("bookSeq");
		 
		mav.addObject("userid", userid);
		mav.addObject("hpSeq", hpSeq);
		mav.addObject("bookSeq", bookSeq);
		
		/*String searchType = request.getParameter("searchType");*/
        String searchWord = request.getParameter("searchWord");
        // System.out.println(searchWord);
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        
        
        HashMap<String,String> paraMap = new HashMap<>();
        
        // 먼저 총 게시물 건수(totalCount)를 구해와야한다. 
        // 총 게시물 건수(totalCount)는 검색조건이 있을때와 없는때로 나뉘어진다.
        int totalCount = 0;              // 총 게시물 건수
        int sizePerPage = 10;            // 한 페이지당 보여줄 게시물 건수
        int currentShowPageNo = 0; 		 // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 
        int totalPage = 0;               // 총 페이지 수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
        
        int startRno = 0;      			 // 시작 행번호
        int endRno = 0;      			 // 끌 행번호
        
        // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정한다. 
        
        // 총 게시물 건수(totalCount)
        paraMap.put("userid", userid);
        
        totalCount = service.getTotalBookMarkCount(paraMap);
//    	System.out.println("~~~~ 확인용 totalCount : " + totalCount);
        
       
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );	 // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> (int)13.0 ==> 13
										 								 // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> (int)12.0 ==> 12
        
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면
        	
        	currentShowPageNo = 1;
        	// 즉, 초기화면인 /list.action 은 /list.action?currentShowPageNo=1 로 하겠다는 말이다.
        }
        else {
	        try {
	        	currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
	        		currentShowPageNo = 1;
	        	}
	        	
	        } catch(NumberFormatException e) {
	        	currentShowPageNo = 1;
	        }
        }
        
        startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
   		endRno = startRno + sizePerPage - 1; 

   		paraMap.put("startRno", String.valueOf(startRno));
   		paraMap.put("endRno", String.valueOf(endRno));
   		paraMap.put("userid", userid);
   		paraMap.put("hpSeq", hpSeq);
   		paraMap.put("bookSeq", bookSeq);
   		
        
   		List<HashMap<String,String>> bookMarkList = service.bookMarkListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		
		// === #119. 페이지바 만들기 === //
		String pageBar = "";
        
		int blockSize = 10;
		
		
		int loop = 1;
		/*
		 	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //
		
	
		
		String url = "bookMark.sd";
		
		// === [이전] 만들기 === 
		if(pageNo != 1) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			pageBar +=" <a class='arrow pprev' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo=1'></a>";
			pageBar +=" <a class='arrow prev' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'></a>";
		}
	
		while ( !(loop > blockSize || pageNo > totalPage) ) {

			if(pageNo == currentShowPageNo) {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center; border: solid 1px gray; color: red; padding: 2px 4px;'>"+pageNo+"</li>";
				pageBar += "<a class='active'>"+pageNo+"</a>";
			}
			else {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
				pageBar += "<a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a>";
			}
			loop++;
			pageNo++;
			
		}// end of while--------------------------------------
		
		
		/*// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);*/
		
		
		// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar +=" <a class='arrow next' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo+1)+"'></a>";
			pageBar +=" <a class='arrow nnext' href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'></a>";
		}
		
		mav.addObject("pageBar", pageBar);
		
		////////////////////////////////////////////////////
		String gobackURL = MyUtil.getCurrentURL(request);
		/*// === #121. 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
		// 			  사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 			  현재 페이지 주소를 뷰단으로 넘겨준다.
*/
//		System.out.println("~~~~~ 확인용 gobackURL : " + gobackURL);
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("totalCount", totalCount);

		
		//////////////////////////////////////////////////////
		// === #69. 글조회수(readCount)증가 (DML문 update)는
		//          반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고,
		//          웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		//          이것을 하기 위해서는 session 을 사용하여 처리하면 된다.

		HttpSession session2 = request.getSession();
		session2.setAttribute("readCountPermission", "yes");
		/*
		   session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
		   session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		      반드시 웹브라우저에서 주소창에 "/list.action" 이라고 입력해야만 얻어올 수 있다. 
		*/
		//////////////////////////////////////////////////////
		
		mav.addObject("bookMarkList",bookMarkList);
		
		mav.setViewName("myPage/bookMark2.tiles2");
		
		return mav;
		
	}
	
	
	// === 즐겨찾기(목록) 삭제하기 페이지 === //
	@RequestMapping(value="/goDelBM.sd" ,method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView goDelBM(@RequestParam("items") String[] items, ModelAndView mav, HttpServletRequest request) throws Exception {
		
		// 삭제할 사용자 ID마다 반복해서 사용자 삭제 
		for (String bookSeq : items) {
			int n = service.goDelBM(bookSeq); 
		} 
		
		// 목록 페이지로 이동
		/*mav.addObject("msg", "글삭제 성공!!");*/
		mav.addObject("loc",request.getContextPath()+"/bookMark.sd");
		
		mav.setViewName("msg");
		
		return mav;

       }
	
	
	// === 예약확인 페이지 === // 
	@RequestMapping(value="/reservation.sd")
	public ModelAndView reservation(HttpServletRequest request, ModelAndView mav) {
		
		// List<ReservationVO> reservationList = null;
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		String reservSeq = request.getParameter("reservSeq");
		
		mav.addObject("userid", userid);
		mav.addObject("reservSeq", reservSeq);
		
		/*String searchType = request.getParameter("searchType");*/
        String searchType = request.getParameter("searchType");
        // System.out.println(searchWord);
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        
       /* if(searchType == null || searchType.trim().isEmpty()) {
        	searchType = "";
        }*/
        
        if(searchType == null) {
        	searchType = "";
         }
        
        HashMap<String,String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType); // "컬럼"
       // paraMap.put("searchWord", searchWord); // 검색어를 담는다.
        paraMap.put("userid", userid);
        paraMap.put("reservSeq", reservSeq);
        
        // 먼저 총 게시물 건수(totalCount)를 구해와야한다. 
        // 총 게시물 건수(totalCount)는 검색조건이 있을때와 없는때로 나뉘어진다.
        int totalCount = 0;              // 총 게시물 건수
        int sizePerPage = 10;            // 한 페이지당 보여줄 게시물 건수
        int currentShowPageNo = 0; 		 // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 
        int totalPage = 0;               // 총 페이지 수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
        
        int startRno = 0;      			 // 시작 행번호
        int endRno = 0;      			 // 끌 행번호
        
        // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정한다. 
        
        // 총 게시물 건수(totalCount)
        totalCount = service.getTotalCountReservation(paraMap);
//    	System.out.println("~~~~ 확인용 totalCount : " + totalCount);
        
        // 만약에 총 게시물 건수(totalCount)가 127개라면, 
        // 총 페이지 수(totalPage)는 13개가 되어야 한다. 
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );	 // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> (int)13.0 ==> 13
										 								 // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> (int)12.0 ==> 12
        
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면
        	
        	currentShowPageNo = 1;
        	// 즉, 초기화면인 /list.action 은 /list.action?currentShowPageNo=1 로 하겠다는 말이다.
        }
        else {
	        try {
	        	currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
	        		currentShowPageNo = 1;
	        	}
	        	
	        } catch(NumberFormatException e) {
	        	currentShowPageNo = 1;
	        }
        }
        
        startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
   		endRno = startRno + sizePerPage - 1; 

   		paraMap.put("startRno", String.valueOf(startRno));
   		paraMap.put("endRno", String.valueOf(endRno));
   		
   		
   		String hour = request.getParameter("hour");
   		paraMap.put("hour", hour);
   		mav.addObject("hour",hour);
   		
   		String visitdate = request.getParameter("visitdate");
   		paraMap.put("visitdate", visitdate);
   		mav.addObject("visitdate",visitdate);
   		
   		
   		// String hourSeq = service.getHourSeq(paraMap);
   		
   		// paraMap.put("hourSeq", hourSeq);
   		// addObject("hourSeq", hourSeq);
   		
   		if(reservSeq != null) {
   			
   		}
   		
   		List<HashMap<String,String>> reservationList = service.reservationListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
   		
   		
		if(!"".equals(searchType)) {
			mav.addObject("paraMap", paraMap);
		}
		
		
		// === #119. 페이지바 만들기 === //
		String pageBar = "";
        
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
	
		
		String url = "reservation.sd";
		
		
		// === [이전] 만들기 === 
		if(pageNo != 1) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			pageBar +=" <a class='arrow pprev' href='"+url+"?searchType="+searchType+"&currentShowPageNo=1'></a>";
			pageBar +=" <a class='arrow prev' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo-1)+"'></a>";
		}
	
		while ( !(loop > blockSize || pageNo > totalPage) ) {

			if(pageNo == currentShowPageNo) {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center; border: solid 1px gray; color: red; padding: 2px 4px;'>"+pageNo+"</li>";
				pageBar += "<a class='active'>"+pageNo+"</a>";
			}
			else {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
				pageBar += "<a href='"+url+"?searchType="+searchType+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a>";
			}
			loop++;
			pageNo++;
			
		}// end of while--------------------------------------
		
		
		/*// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);*/
		
		
		// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar +=" <a class='arrow next' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo+1)+"'></a>";
			pageBar +=" <a class='arrow nnext' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+totalPage+"'></a>";
		}
		
		mav.addObject("pageBar", pageBar);
		
		////////////////////////////////////////////////////
		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("totalCount", totalCount);

		session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
	
		//List<HashMap<String,String>> reservationDetail = service.reservationDetailListSearchWithPaging(paraMap);
   		
		mav.addObject("reservationList",reservationList);
		//mav.addObject("reservationDetail",reservationDetail);
		
		mav.setViewName("myPage/reservation.tiles2");
		return mav;
		
	}
	
	
	// === 예약확인-팝업 페이지 === // 
	@RequestMapping(value="/hospitalNamePopup.sd")
	public String hospitalNamePopup() {
	
		return "/hospitalNamePopup";
	}
	
	// === 최근 진료이력조회 페이지 === // 
	@RequestMapping(value="/viewHistory.sd")
	public ModelAndView viewHistory(HttpServletRequest request, ModelAndView mav, MemberVO membervo) {
	
		// List<ReservationVO> reservationList = null;
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		String name = loginuser.getName();
		//String memberSeq = String.valueOf(loginuser.getMemberSeq());
		
		mav.addObject("userid", userid);
		mav.addObject("name", name);
		//mav.addObject("memberSeq", memberSeq);
		
		/*String searchType = request.getParameter("searchType");*/
        String searchType = request.getParameter("searchType");
        // System.out.println(searchWord);
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        
       /* if(searchType == null || searchType.trim().isEmpty()) {
        	searchType = "";
        }*/
        
        if(searchType == null) {
        	searchType = "";
         }
        
        membervo = service.viewMyHealth(userid);
		
		// List<MemberVO> memberList = service.viewMyHealthTest();
		
		mav.addObject("membervo", membervo);
        
        HashMap<String,String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType); // "컬럼"
       // paraMap.put("searchWord", searchWord); // 검색어를 담는다.
        paraMap.put("userid", userid);
        paraMap.put("name", name);
        //paraMap.put("memberSeq", memberSeq);
        
        //System.out.println(userid);
        //System.out.println(name);
        
        // 먼저 총 게시물 건수(totalCount)를 구해와야한다. 
        // 총 게시물 건수(totalCount)는 검색조건이 있을때와 없는때로 나뉘어진다.
        int totalCount = 0;              // 총 게시물 건수
        int sizePerPage = 10;            // 한 페이지당 보여줄 게시물 건수
        int currentShowPageNo = 0; 		 // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 
        int totalPage = 0;               // 총 페이지 수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
        
        int startRno = 0;      			 // 시작 행번호
        int endRno = 0;      			 // 끌 행번호
        
        // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정한다. 
        
        // 총 게시물 건수(totalCount)
        totalCount = service.getTotalCountHistory(paraMap);
//		    	System.out.println("~~~~ 확인용 totalCount : " + totalCount);
        
        // 만약에 총 게시물 건수(totalCount)가 127개라면, 
        // 총 페이지 수(totalPage)는 13개가 되어야 한다. 
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );	 // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> (int)13.0 ==> 13
										 								 // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> (int)12.0 ==> 12
        
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면
        	
        	currentShowPageNo = 1;
        	// 즉, 초기화면인 /list.action 은 /list.action?currentShowPageNo=1 로 하겠다는 말이다.
        }
        else {
	        try {
	        	currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
	        		currentShowPageNo = 1;
	        	}
	        	
	        } catch(NumberFormatException e) {
	        	currentShowPageNo = 1;
	        }
        }
        
        startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
   		endRno = startRno + sizePerPage - 1; 

   		paraMap.put("startRno", String.valueOf(startRno));
   		paraMap.put("endRno", String.valueOf(endRno));
   		
   		String hour = request.getParameter("hour");
   		paraMap.put("hour", hour);
   		mav.addObject("hour",hour);
   		
   		String visitdate = request.getParameter("visitdate");
   		paraMap.put("visitdate", visitdate);
   		mav.addObject("visitdate",visitdate);
   		
   		
   		// String hourSeq = service.getHourSeq(paraMap);
   		
   		// paraMap.put("hourSeq", hourSeq);
   		// addObject("hourSeq", hourSeq);
   		
   		List<HashMap<String,String>> historyList = service.historyListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		if(!"".equals(searchType)) {
			mav.addObject("paraMap", paraMap);
		}
		
		
		// === #119. 페이지바 만들기 === //
		String pageBar = "";
        
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
	
		
		String url = "viewHistory.sd";
		
		// === [이전] 만들기 === 
		if(pageNo != 1) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			pageBar +=" <a class='arrow pprev' href='"+url+"?searchType="+searchType+"&currentShowPageNo=1'></a>";
			pageBar +=" <a class='arrow prev' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo-1)+"'></a>";
		}
	
		while ( !(loop > blockSize || pageNo > totalPage) ) {

			if(pageNo == currentShowPageNo) {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center; border: solid 1px gray; color: red; padding: 2px 4px;'>"+pageNo+"</li>";
				pageBar += "<a class='active'>"+pageNo+"</a>";
			}
			else {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
				pageBar += "<a href='"+url+"?searchType="+searchType+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a>";
			}
			loop++;
			pageNo++;
			
		}// end of while--------------------------------------
		
		
		/*// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);*/
		
		
		// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar +=" <a class='arrow next' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo+1)+"'></a>";
			pageBar +=" <a class='arrow nnext' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+totalPage+"'></a>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		////////////////////////////////////////////////////
		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("totalCount", totalCount);

		session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
	
		
		mav.addObject("historyList",historyList);
		
		mav.setViewName("myPage/viewHistory.tiles2");
		
		return mav;
		
	}
	
	
	// === 후기 페이지 보이기 === //  
	@RequestMapping(value="/review.sd")
	public ModelAndView review(HttpServletRequest request, ModelAndView mav) {
	
		// List<ReservationVO> reservationList = null;
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		mav.addObject("userid", userid);
		
		/*String searchType = request.getParameter("searchType");*/
        String searchType = request.getParameter("searchType");
        // System.out.println(searchWord);
        String str_currentShowPageNo = request.getParameter("currentShowPageNo");
        
       /* if(searchType == null || searchType.trim().isEmpty()) {reviewList
        	searchType = "";
        }*/
        
        if(searchType == null) {
        	searchType = "";
         }
        
        HashMap<String,String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType); // "컬럼"
       // paraMap.put("searchWord", searchWord); // 검색어를 담는다.
        paraMap.put("userid", userid);
        
        // 먼저 총 게시물 건수(totalCount)를 구해와야한다. 
        // 총 게시물 건수(totalCount)는 검색조건이 있을때와 없는때로 나뉘어진다.
        int totalCount = 0;              // 총 게시물 건수
        int sizePerPage = 10;            // 한 페이지당 보여줄 게시물 건수
        int currentShowPageNo = 0; 		 // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 
        int totalPage = 0;               // 총 페이지 수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
        
        int startRno = 0;      			 // 시작 행번호
        int endRno = 0;      			 // 끌 행번호
        
        // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정한다. 
        
        // 총 게시물 건수(totalCount)
        totalCount = service.getTotalCountReview(paraMap);
//		    	System.out.println("~~~~ 확인용 totalCount : " + totalCount);
        
        // 만약에 총 게시물 건수(totalCount)가 127개라면, 
        // 총 페이지 수(totalPage)는 13개가 되어야 한다. 
        totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );	 // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> (int)13.0 ==> 13
										 								 // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> (int)12.0 ==> 12
        
        if(str_currentShowPageNo == null) {
        	// 게시판에 보여지는 초기화면
        	
        	currentShowPageNo = 1;
        	// 즉, 초기화면인 /list.action 은 /list.action?currentShowPageNo=1 로 하겠다는 말이다.
        }
        else {
	        try {
	        	currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	        	if( currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
	        		currentShowPageNo = 1;
	        	}
	        	
	        } catch(NumberFormatException e) {
	        	currentShowPageNo = 1;
	        }
        }
        
        startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
   		endRno = startRno + sizePerPage - 1; 

   		paraMap.put("startRno", String.valueOf(startRno));
   		paraMap.put("endRno", String.valueOf(endRno));
   		
   		List<HashMap<String,String>> reviewList = service.reviewListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		if(!"".equals(searchType)) {
			mav.addObject("paraMap", paraMap);
		}
		
		
		// === #119. 페이지바 만들기 === //
		String pageBar = "";
        
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
	
		
		String url = "review.sd";
		
		// === [이전] 만들기 === 
		if(pageNo != 1) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			pageBar +=" <a class='arrow pprev' href='"+url+"?searchType="+searchType+"&currentShowPageNo=1'></a>";
			pageBar +=" <a class='arrow prev' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo-1)+"'></a>";
		}
	
		while ( !(loop > blockSize || pageNo > totalPage) ) {

			if(pageNo == currentShowPageNo) {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center; border: solid 1px gray; color: red; padding: 2px 4px;'>"+pageNo+"</li>";
				pageBar += "<a class='active'>"+pageNo+"</a>";
			}
			else {
			//	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; text-align: center;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
				pageBar += "<a href='"+url+"?searchType="+searchType+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a>";
			}
			loop++;
			pageNo++;
			
		}// end of while--------------------------------------
		
		
		/*// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);*/
		
		
		// === [다음] 만들기 === 
		if( !(pageNo > totalPage) ) {
		//	pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar +=" <a class='arrow next' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+(pageNo+1)+"'></a>";
			pageBar +=" <a class='arrow nnext' href='"+url+"?searchType="+searchType+"&currentShowPageNo="+totalPage+"'></a>";
		}
		
		mav.addObject("pageBar", pageBar);
		
		System.out.println("endRno:"+endRno);
		
		////////////////////////////////////////////////////
		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("totalCount", totalCount);

		session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
	
		
		mav.addObject("reviewList",reviewList);
		
		mav.setViewName("myPage/review.tiles2");
		
		return mav;
		
	}
	
	// 예약확인 - 병원이름 클릭시 예약상세정보
	@ResponseBody
	@RequestMapping(value="/getDetail.sd", produces="text/plain;charset=UTF-8")
	public String getDetail(HttpServletRequest request, MemberVO membervo) {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		String reservSeq = request.getParameter("reservSeq");
		 
//		mav.addObject("userid", userid);
//		mav.addObject("reservSeq", reservSeq);
		
		System.out.println(reservSeq);
		
		HashMap<String,String> paraMap = new HashMap<>();

		paraMap.put("userid", userid);
   		paraMap.put("reservSeq", reservSeq);
		
   		HashMap<String,String> reservationDetail = service.reservationDetailListSearchWithPaging(paraMap);
   		// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
   		JsonObject json = new JsonObject();
   		
   		json.addProperty("hpName", reservationDetail.get("hpName"));
   		json.addProperty("hour", reservationDetail.get("hour"));
   		json.addProperty("visitdate", reservationDetail.get("visitdate"));
   		json.addProperty("status", reservationDetail.get("status"));
   		json.addProperty("address", reservationDetail.get("address"));
   		json.addProperty("phone", reservationDetail.get("phone"));
   		json.addProperty("dept", reservationDetail.get("dept"));
   		json.addProperty("reservSeq", reservSeq);
   		
   		
		/*mav.addObject("reservationDetail",reservationDetail);
		
		mav.setViewName("myPage/reservation.tiles2");*/
		
		return json.toString();
		
	}
	
	/* 문의관리 댓글쓰기 */
	@ResponseBody
    @RequestMapping(value="/addComment.sd", method= {RequestMethod.POST})      
    public String addComment(HttpServletRequest request, CommentVO commentvo) {
	   
	// System.out.println(commentvo.getContent() +"/"+commentvo.getParentSeq());
	   String jsonStr = "";
	   
	   try {
		   
		   int n = service.addComment(commentvo);
		   
		   if(n == 1) {
			   service.updateStatus(commentvo.getParentSeq());
		   }
		   
		   JSONObject jsonObj = new JSONObject();
		   jsonObj.put("n", n);
		   
		   jsonStr = jsonObj.toString();
	   
	   } catch (Throwable e) {

		   e.printStackTrace();
	   }
	   
	   return jsonStr;
	   
    }
	
	
	/* 문의관리 댓글 읽어오기 */
	@ResponseBody
    @RequestMapping(value="/readComment.sd", produces="text/plain;charset=UTF-8")      
    public String readComment(HttpServletRequest request) {
	   
	   String parentSeq = request.getParameter("parentSeq"); 
	  // System.out.println("parentSeq:"+parentSeq);
	   List<CommentVO> commentList = service.getCommentList(parentSeq);
	   
	   JSONArray jsonArr = new JSONArray();
	   
	   if(commentList != null) {
		   for(CommentVO cmtvo : commentList) {
		       JSONObject jsonObj = new JSONObject();
		       jsonObj.put("regDate", cmtvo.getRegDate());
		       jsonObj.put("content", cmtvo.getContent());
		    		
		       jsonArr.put(jsonObj);
		    }
	   }
	    
	   return jsonArr.toString();
    } 
	
	
}
