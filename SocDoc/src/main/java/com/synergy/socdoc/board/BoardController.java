package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.synergy.socdoc.common.MyUtil;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.NoticeVO;

@Controller
public class BoardController {
	
	@Autowired
	private InterBoardService service;
	
	// === 게시판 list === //
/*	@RequestMapping(value="/noticeList.sd", method= {RequestMethod.GET})
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mav) {
		
		List<NoticeVO> noticeList = null;
		
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNO = request.getParameter("currentShowPageNO"); 
		
		// 검색어가 없다면 아무것도 안준다.
		if(searchWord == null || searchWord.trim().isEmpty()) { 
			searchWord = ""; // 검색어가 없다면  searchWord는 = "" 이다.
	    }
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("searchWord", searchWord); // 검색어 담자
				
		// 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을 때로 나뉘어진다.
		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 10; // 한페이지당 보여줄 게시물 건수
		int currentShowPageNO = 0;// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로  설정함.
		int totalPage = 0;// 총페이지 수(웹브라우저상에 보여줄 총 페이지 개수, 페이지바)
		int startRno = 0; //시작 행번호
		int endRno = 0;//끝 행번호
		
		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCount(paraMap);   // 이 파라맵이 해쉬맵이다
		//System.out.println("~~~~~ 확인용 : "+ totalCount);
		
		// 총 게시물 건수(totalCount)가 127개라면 총페이지 수(totalPage)는 13개가 되어야 한다.
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		if(str_currentShowPageNO == null) { // 게시판에 보여지는 초기화면이 비어있다면
			// 게시판에 보여지는 초기화면
			currentShowPageNO = 1; // 즉, 초기화면인 /list.action은 /list.action?currentShowPageNO=1로 하겠다는 말.
		}
		else {
			// get 방식이라 유저가 장난칠 수 있으니까 아무거나 입력하지 못하게 막아버리자    //  토탈페이지도 큰 숫자로 쓰면 막아버리자
			try{
				currentShowPageNO = Integer.parseInt(str_currentShowPageNO);
				if( currentShowPageNO < 1 || currentShowPageNO > totalPage ) { // 1보다 작거나 그 이상의 큰 수를 쓰면
					currentShowPageNO = 1; // 1 페이지로~
				}
			}catch(NumberFormatException e) {
				currentShowPageNO = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		startRno = ((currentShowPageNO - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1; 

		paraMap.put("startRno", String.valueOf(startRno)); // 해쉬맵에 담자startRno 근데 파라맵이 스트링 타입이라 스트링 아니면 안들어가서 숫자->문자열로 변환시킨다.
		paraMap.put("endRno", String.valueOf(endRno)); // 해쉬맵에 담자startRno
		
		noticeList = service.boardListSearchWithPaging(paraMap); // 위에 페이징안한거 복붙해오는데 지금은 페이징 처리한거니까 이름 살짝 바꿔주자 !!  파라맵에 다 담겨져 있다.// 메소드 새롭게 만든다. service.boardListSearch(paraMap)
	    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것) --> 해쉬맵에 키값 searchWord = ""; 이거땜에 알 수 있다?
		
	    if(!"".equals(searchWord)) { // 검색어가 있다면 파라맵을 넘겨주겠다.
	       mav.addObject("paraMap", paraMap); 
	    }
	    
	    
	    // === #119. 페이지바 만들기 === //
	    String pageBar = "<ul style='list-style: none;'>";
	    
	    int blockSize = 10; // blockSize는 1개 블럭(토막)당 보여지는 페이지 번호의 개수이다.

	    int loop = 1; // loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수(지금은 10개(== blockSize)) 10개 까지만 증가하는 용도다.
	    
		int pageNo = ((currentShowPageNO - 1)/blockSize) * blockSize + 1;
		// ☆★☆★☆★*** !! 공식이다. !! ***☆★☆★☆★ //
	    
		String url = "list.action"; // url 이건데
		// 맨마지막 값에 물음표?가 있냐 없냐 나누자.
	      
	      
		// === [이전] 만들기 === //
	    if(pageNo != 1) { // 1이 아니라면 2번째부터 만들어라??? ㅅㅂ
	       pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?&searchWord="+searchWord+"&currentShowPageNO="+(pageNo-1)+"'>[이전]</a></li>";
	    }
	    
	    // 페이징 만들기 
	    while (!(loop > blockSize || pageNo > totalPage )) { // while(조건) = while문을 빠져나가는 조건 참이라면 !(true)는 거짓일 때 빠져나간다.

	         
	         if(pageNo == currentShowPageNO) { // 페이지번호랑 currentShowPageNO 이 같다면
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px grey; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
	         }
	         else {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt;'>"
							+ "<a href='"+url+"?&searchWord="+searchWord+"&currentShowPageNO="+pageNo+"'>"
							+ pageNo+"</a></li>"; // url 추가해주기 겟방식이니 그 다음엔 물음표 넣어주자 searchType=하고 리퀘스트겟파라미터에서  searchType 받아오자
	         }
	         
	         loop ++; // 매번 증가하겠다.  1 2 3 4 5 6 7 8 9 10 / 11에 빠져나가야함. 즉 while(!(11>blockSize)) 11보다 크면 빠져나가라
	         pageNo ++; // totalPage 보다 크면 빠져나가라
	         
	    } // end of while ----------------------------
	      
	      
	    // === [다음] 만들기 === 증가되어진 상태에서 빠져나온다.//
	    if( !(pageNo > totalPage) ) { // 맨 마지막 페이지(pageNo > totalPage)로 빠져나온게 아니라면!! 그때만 다음 보여라
	      
	    	  pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
						+ "<a href='"+url+"?&searchWord="+searchWord+"&currentShowPageNO="+(pageNo)+"'>[다음]</a></li>";      
	      
	    }
	      
	    pageBar += "</ul>"; //페이지바를 뷰단으로 넘겨야 한다.
	      
	    mav.addObject("pageBar", pageBar);
	      
	      
	      
	      
	    // 검색어에 내 이름'강동원' 쓴 상태로 목록보기를 누르면 내가 검색하던 창으로 '작성자 : 강동원'정보만 보이게 / 전체목록보기를 누르면 전체로 가게~~ 
		////////////////////////////////////////////////////
		  
		//  === #121. 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
		// 			사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 			현재 페이지 주소를 뷰단으로 넘겨준다.
	    String gobackURL = MyUtil.getCurrentURL(request); // url을 넘기자
	      
	    mav.addObject("gobackURL",gobackURL); // gobackURL를 리퀘스트로 넘겨주자. 
	      
		// System.out.println("~~~~~~~~~확인용 gobackURL : "+ gobackURL);
		
		
		
	    
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		///////////////////////////////////////////////////////////////
		// === #69. 글조회수(readCount)증가 (DML문 update)는
		//          반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만 증가되고,
		//          웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 되지 않도록 해야 한다.
		//          이것을 하기 위해서는 session 을 사용하여 처리하면 된다.
		//
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes"); 
		////////////////////////////////////////////////////////////////
		mav.addObject("noticeList",noticeList);	// ModelAndView 객체에 속성 값 넣어준다. / View에 attributeName으로 attributeValue을 전달
		mav.setViewName("notice/noticeList.tiles1");	// setViewName = 보여줄 .jsp파일 지정하기 /  ViewResolver에 전달할 viewName 설정
		
		return mav;
	}
	*/
	
	
	// === 게시판 list === //
	@RequestMapping(value = "/noticeList.sd", method = RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mav) {
		
		//List<NoticeVO> noticeList = service.noticeList();
		//System.out.println("공지사항 게시글 수 " + noticeList.size());
		JSONObject json = new JSONObject();
		
		mav.setViewName("notice/noticeList.tiles1");
		//mav.addObject("noticeList",noticeList);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax/noticeBoard.sd", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String noticeBrdList(HttpServletRequest request) {
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		String searchWord = request.getParameter("searchWord");
		String currentShowPageNoStr = request.getParameter("currentShowPageNo");
		
		if(searchWord == null) {
			searchWord = "";
		}

		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 10; // 한페이지당 보여줄 게시물 건수
		int currentShowPageNO = 0;// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로  설정함.
		int totalPage = 0;// 총페이지 수(웹브라우저상에 보여줄 총 페이지 개수, 페이지바)
		
		totalCount = service.getTotalNoticeList(paraMap);   // 이 파라맵이 해쉬맵이다
		
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		
		if(currentShowPageNoStr == null) { // 게시판에 보여지는 초기화면이 비어있다면
			currentShowPageNO = 1;
		}
		else {
	
			try{
				currentShowPageNO = Integer.parseInt(currentShowPageNoStr);
				if( currentShowPageNO < 1 || currentShowPageNO > totalPage ) {
					currentShowPageNO = 1; 
				}
			}catch(NumberFormatException e) {
				currentShowPageNO = 1;
			}
		}	
		
		int startRno = 0;
		int endRno = 0;
		
		startRno = ((currentShowPageNO - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1; 
		
		paraMap.put("startRno", String.valueOf(startRno)); 
		paraMap.put("endRno", String.valueOf(endRno));
		
		List<NoticeVO> noticeList = service.noticeList(paraMap);

		JsonArray jsonArr = new JsonArray();
		
		for(int i=0; i<noticeList.size(); i++) {
			JsonObject obj = new JsonObject();
//	 		select V.rno, V.noticeSeq, V.subject, V.content, V.regDate from
			NoticeVO nvo = noticeList.get(i);
			obj.addProperty("noticeSeq", nvo.getNoticeSeq());
			obj.addProperty("subject", nvo.getSubject());
			obj.addProperty("content", nvo.getcontent());
			obj.addProperty("regDate", nvo.getRegDate());
			
			jsonArr.add(obj);
		}
		
		
		String pageBar = "<ul style='list-style: none;'>";
	    
	    int blockSize = 10;
	
	    int loop = 1; // 몇번 반복할래	    
	    // loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수(지금은 10개(== blockSize)) 10개 까지만 증가하는 용도다.
	    
		int pageNo = ((currentShowPageNO - 1)/blockSize) * blockSize + 1;

		String url = request.getContextPath() + "/ajax/noticeBoard.sd"; // url 이건데
	      
		// === [이전] 만들기 === //
	    if(pageNo != 1) { // 1이 아니라면 2번째부터 만들어라??? ㅅㅂ
	       pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchWord="+searchWord+"&currentShowPageNO="+(pageNo-1)+"'>[이전]</a></li>";
	    }
	    
	    // 페이징 만들기 
	    while (!(loop > blockSize || pageNo > totalPage )) { 
	         
	         if(pageNo == currentShowPageNO) {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px grey; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
	         }
	         else {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt;'>"
							+ "<a href='"+url+"?searchWord="+searchWord+"&currentShowPageNO="+pageNo+"'>"
							+ pageNo+"</a></li>";	         }
	         
	         loop++;
	         pageNo++;
	         
	    } 
	      
	    if( !(pageNo > totalPage) ) {
	      
	    	  pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
						+ "<a href='"+url+"?&searchWord="+searchWord+"&currentShowPageNO="+(pageNo)+"'>[다음]</a></li>";      
	      
	    }
	      
	    pageBar += "</ul>"; //페이지바를 뷰단으로 넘겨야 한다.
	      
	    JsonObject jsonObj = new JsonObject();
	    jsonObj.addProperty("pageBar", pageBar);
	    if(searchWord.trim() != "") {
	    	jsonObj.addProperty("searchWord", searchWord);	    	
	    }
	    jsonObj.addProperty("list", jsonArr.toString());
	    
		return jsonObj.toString();
	}
	
/*	@RequestMapping(value = "/healthinfo.sd", method = RequestMethod.GET)
	public ModelAndView healthinfo(ModelAndView mav) {
		
		//List<HealthInfoVO> healthinfo = service.healthinfo();
		//System.out.println("건강정보 게시글 수 " + healthinfo.size());
		
		mav.setViewName("notice/noticeList.tiles1");
		//mav.addObject("healthinfo",healthinfo);
		
		return mav;
	}*/
	
	
	
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
