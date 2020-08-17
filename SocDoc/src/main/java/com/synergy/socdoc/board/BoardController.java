package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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
	@RequestMapping(value = "/noticeList.sd", method = RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mav) {
		
		//List<NoticeVO> noticeList = service.noticeList();
		//System.out.println("공지사항 게시글 수 " + noticeList.size());
		JSONObject json = new JSONObject();
		
		mav.setViewName("notice/noticeList.tiles1");
		//mav.addObject("noticeList",noticeList);
		
		return mav;
	}
	// === 게시판 list_공지사항 === //
	@ResponseBody
	@RequestMapping(value = "/ajax/noticeBoard.sd", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String noticeBrdList(HttpServletRequest request) {
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		String searchWord = request.getParameter("searchWord");
		String currentShowPageNoStr = request.getParameter("currentShowPageNo");
		
		if(searchWord == null) {
			searchWord = "";
		}

		System.out.println("searchWord : "+searchWord);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 10; // 한페이지당 보여줄 게시물 건수
		int currentShowPageNO = 0;// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로  설정함.
		int totalPage = 0;// 총페이지 수(웹브라우저상에 보여줄 총 페이지 개수, 페이지바)
		
		totalCount = service.getTotalNoticeList(paraMap);   // 이 파라맵이 해쉬맵이다
		
		System.out.println("totalCount : "+totalCount);

		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		
		System.out.println("totalPage : "+totalPage);

		
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
	      
		// === [이전] 만들기 === //
	    if(pageNo != 1) { // 1이 아니라면 2번째부터 만들어라??? ㅅㅂ
	       pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='javascript:getNoticeBoard("+(pageNo-1)+","+searchWord+")'>[이전]</a></li>";
	    }
	    
	    // 페이징 만들기 
	    while (!(loop > blockSize || pageNo > totalPage )) { 
	         
	         if(pageNo == currentShowPageNO) {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px grey; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
	         }
	         else {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt;'>"
							+ "<a href='javascript:getNoticeBoard("+pageNo+","+searchWord+")'>"
							+ pageNo+"</a></li>";	         }
	         
	         loop++;
	         pageNo++;
	         
	    } 
	      
	    if( !(pageNo > totalPage) ) {
	      
	    	  pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
						+ "<a href='javascript:getNoticeBoard("+pageNo+","+searchWord+")'>[다음]</a></li>";      
	      
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
	
	
	
	
	// === 게시판 list_건강정보 === //
	@ResponseBody
	@RequestMapping(value = "/ajax/infoBoard.sd", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String infoBrdList(HttpServletRequest request) {
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		String searchWord = request.getParameter("searchWord");
		String currentShowPageNoStr = request.getParameter("currentShowPageNo");
		
		if(searchWord == null) {
			searchWord = "";
		}

		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 6; // 한페이지당 보여줄 게시물 건수
		int currentShowPageNO = 0;// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로  설정함.
		int totalPage = 0;// 총페이지 수(웹브라우저상에 보여줄 총 페이지 개수, 페이지바)
		
		totalCount = service.getTotalInfoList(paraMap);   // 이 파라맵이 해쉬맵이다
		System.out.println("총 게시글 건수"+totalCount);
		
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		
		if(currentShowPageNoStr == null) { // 게시판에 보여지는 초기화면이 비어있다면
			currentShowPageNO = 1;
		} else {
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
		
		List<HealthInfoVO> infoBoard = service.infoList(paraMap);

		JsonArray jsonArr = new JsonArray();
		
		for(int i=0; i<infoBoard.size(); i++) {
			JsonObject obj = new JsonObject();
//	 		select V.rno, V.noticeSeq, V.subject, V.content, V.regDate from
			HealthInfoVO hvo = infoBoard.get(i);
			obj.addProperty("infoSeq", hvo.getInfoSeq());
			obj.addProperty("subject", hvo.getSubject());
			obj.addProperty("content", hvo.getContent());
			obj.addProperty("imgName", hvo.getImgName());
			obj.addProperty("regDate", hvo.getRegDate());
			jsonArr.add(obj);
		}
		
		
		
		//////
		String pageBar = "<ul style='list-style: none;'>";
	    
	    int blockSize = 6;
	    int loop = 1; // 몇번 반복할래	    
	    // loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수(지금은 10개(== blockSize)) 10개 까지만 증가하는 용도다.
	    
		int pageNo = ((currentShowPageNO - 1)/blockSize) * blockSize + 1;
/*	      
		// === [이전] 만들기 === //
	    if(pageNo != 1) { // 1이 아니라면 2번째부터 만들어라??? ㅅㅂ
	       pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='javascript:getHealthInfoBoard("+(pageNo-1)+","+searchWord+")'>[이전]</a></li>";
	    }
*/	    
	    // 페이징 만들기 
	    while (!(loop > blockSize || pageNo > totalPage )) { 
	         
	         if(pageNo == currentShowPageNO) {
	        	pageBar += "<li style='display:inline-block; width:100px; font-size: 12pt; border: solid 1px grey; color: red; padding: 2px 4px;'>"
	        			+ "<a href='javascript:getHealthInfoBoard("+pageNo+","+searchWord+")'>"
	        			+ "더보기</a></li>";
	         }
	        /* else {
	        	pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt;'>"
							+ "<a href='javascript:getHealthInfoBoard("+pageNo+","+searchWord+")'>"
							+ pageNo+"</a></li>";	         
	        	}*/
	         
	         loop++;
	         pageNo++;
	         
	    } 
	      
/*	    if( !(pageNo > totalPage) ) {
	      
	    	  pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
						+ "<a href='javascript:getHealthInfoBoard("+pageNo+","+searchWord+")'>[다음]</a></li>";      
	      
	    }*/
	      
	    pageBar += "</ul>"; //페이지바를 뷰단으로 넘겨야 한다.		
		//////
	    
	    
	    
	    
	    JsonObject jsonObj = new JsonObject();
	    jsonObj.addProperty("pageBar", pageBar);
	    if(searchWord.trim() != "") {
	    	jsonObj.addProperty("searchWord", searchWord);	    	
	    }
	    jsonObj.addProperty("list", jsonArr.toString());
	    
		return jsonObj.toString();
	}
	
	
	// 공지사항 글보기  //
	@RequestMapping(value = "/noticeView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView noticeView(HttpServletRequest request, ModelAndView mav) {
		
		String noticeSeq = request.getParameter("noticeSeq");
		String gobackURL = request.getParameter("gobackURL");
		
		mav.addObject("gobackURL", gobackURL);

		NoticeVO noticevo = null;

		noticevo = service.getView(noticeSeq);
		
		mav.addObject("noticevo", noticevo);
		mav.setViewName("notice/noticeView.tiles1");
		
		return mav;
	}
	@RequestMapping(value = "/infoView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView infoView(HttpServletRequest request, ModelAndView mav) {
		
		String infoSeq = request.getParameter("infoSeq");
		String gobackURL = request.getParameter("gobackURL");
		
		mav.addObject("gobackURL", gobackURL);

		HealthInfoVO healthinfovo = null;

		healthinfovo = service.getInfoView(infoSeq);
		
		mav.addObject("infovo", healthinfovo);
		mav.setViewName("notice/infoView.tiles1");
		
		return mav;
	}
	
	// 더보기
	@ResponseBody
	@RequestMapping(value = "/photo.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String photo(HttpServletRequest request) {
		
		String infoSeq = request.getParameter("infoSeq");
		//String gobackURL = request.getParameter("gobackURL");
		String start = request.getParameter("start");
		String len = request.getParameter("len");
		
		HashMap<String,String> paraMap = new HashMap<>();
		
		String end = String.valueOf(Integer.parseInt(start) + Integer.parseInt(len) - 1); // 숫자계산을 위해 Integer로 바꾸어서 계산 후 String 타입 안에 넣어주기.
		
		paraMap.put("startRno",start); // startRno가 1이라면 db에서 endRno(끝번호) 8까지 와야 한다.
		paraMap.put("endRno",end);
		System.out.println("startRNO : " + start);
		System.out.println("endRNO : " + end);
		List<HealthInfoVO> productList = service.selectByInfo(paraMap);
		
		JSONArray jsonArr = new JSONArray(); // []
		if(productList.size()>0) {
			for(HealthInfoVO pvo : productList) {
				JSONObject jsobj = new JSONObject();
				jsobj.put("infoSeq", pvo.getInfoSeq());
				jsobj.put("img", pvo.getImg());
				jsobj.put("imgName", pvo.getImgName());
				jsobj.put("subject", pvo.getSubject());
				jsobj.put("content", pvo.getContent());

				jsonArr.put(jsobj);
			}
		}
		
		String json = jsonArr.toString();
		/*request.setAttribute("json", json);
		
		mav.addObject("gobackURL", gobackURL);*/
		
		List<HealthInfoVO> healthinfovo = null;
		
		healthinfovo = service.selectByInfo(paraMap);
		
		/*mav.addObject("infovo", healthinfovo);
		mav.setViewName("notice/noticeList.tiles1");*/
		
		return json;		
	}
	

		
}
