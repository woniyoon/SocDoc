package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.common.MyUtil;
import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;


@Component
@Controller
public class AdminController {

	@Autowired
	private InterAdminService service;

	/* 회원관리 */ 
	@RequestMapping(value = "/adminMemberMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView adminMemberMng(HttpServletRequest request, ModelAndView mav) {
		
		List<MemberVO> membervoList = null;
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
	//	System.out.println(searchWord+"------------------");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {

			searchWord = "";
		
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.getTotalCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
	//	System.out.println(searchType+"/"+searchWord+"/"+startRno+"/"+endRno);
		
		membervoList = service.memberListSearchWithPaging(paraMap);
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "adminMemberMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("membervoList", membervoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/adminMemberMng.tiles3");
		
		return mav;
		
	}
	

	/* 병원회원관리 */	
	@RequestMapping(value = "/adminHospitalMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView adminHospitalMng(HttpServletRequest request, ModelAndView mav) {
		
		List<HpMemberVO> hospitalvoList = null;
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {

			searchWord = "";
		
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.hpMemberCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
		hospitalvoList = service.hpmemberListPaging(paraMap);
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "adminHospitalMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("hospitalvoList", hospitalvoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/adminHospitalMng.tiles3");
		
		return mav;
	}
	
	/* 병원등록 */
	@RequestMapping(value = "/hospitalInfo.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView hospitalInfo(HttpServletRequest request, ModelAndView mav) {
		
		List<HpMemberVO> hpinfovoList = null;
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {

			searchWord = "";
		
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.hpInfoCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
		hpinfovoList = service.hpInfoListPaging(paraMap);
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "hospitalInfo.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("hpinfovoList", hpinfovoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/hospitalInfo.tiles3");
		
		return mav;
	}
	

	/* 공지사항관리 */
	@RequestMapping(value = "/adminNoticeMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView adminNoticeMng(HttpServletRequest request, ModelAndView mav) {

		List<NoticeVO> noticevoList = null;
		
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.noticeTotalCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
		
		noticevoList = service.noticeListPaging(paraMap);
	
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "adminNoticeMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("noticevoList", noticevoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/adminNoticeMng.tiles3");
		
		return mav;
		
		
	}

	/* 공지사항 글보기 */
	@RequestMapping(value = "/adminNoticeView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView noticeView(HttpServletRequest request, ModelAndView mav) {
		
		String noticeSeq = request.getParameter("noticeSeq");
		
	//	System.out.println("공지사항 seq 잘오나? : " + noticeSeq);
		
		String gobackURL = request.getParameter("gobackURL");
		mav.addObject("gobackURL", gobackURL);

		NoticeVO noticevo = null;

		noticevo = service.getView(noticeSeq);
		
		mav.addObject("noticevo", noticevo);
		mav.setViewName("admin/adminNoticeView.tiles3");
		
		return mav;
		
	}
	/* 공지사항 글쓰기 */
	@RequestMapping(value = "/adminNoticeWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String noticeWrite(HttpServletRequest request) {
		
		return "admin/adminNoticeWrite.tiles3";
	}
	/* 공지사항 글쓰기 요청 */
	@RequestMapping(value = "/noticeWriteEnd.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String noticeWriteEnd(HttpServletRequest request) {
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("subject", subject);
		paraMap.put("content", content);
		
		int n = service.noticeInsert(paraMap);
		
		if(n>0) {
			return "redirect:/adminNoticeMng.sd";
		}
		else {
			return "redirect:/noticeWrite.sd";
		}
		
	}
	/* 공지사항 글삭제 */
	@RequestMapping(value="/goDel.sd" ,method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView delNotice(@RequestParam("noticeck") String[] noticeck, ModelAndView mav, HttpServletRequest request) throws Exception {
		
		String noticeJoin = request.getParameter("noticeJoin");
		
		String[] noticeArr = noticeJoin.split(",");
		
		for(int i=0; i<noticeArr.length; i++) {
			service.delNotice(noticeArr[i]);
		}
		
		
		/*
		 for (String noticeSeq : noticeck) { 
	         System.out.println("글삭제 = " + noticeSeq); 
	         int n = service.delNotice(noticeSeq); 
	      } 
	    */  
	      // 목록 페이지로 이동
	      mav.addObject("loc",request.getContextPath()+"/adminNoticeMng.sd");
	      
	      mav.setViewName("msg");
	      
	      return mav;

	 }
	
	
	/* 건강정보관리 */
	@RequestMapping(value = "/healthInfoMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView healthInfoMng(HttpServletRequest request, ModelAndView mav) {
		
		List<HealthInfoVO> healthvoList = null;
		
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.healthInfoCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
		
		healthvoList = service.healthInfoPaging(paraMap);
	
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "healthInfoMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("healthvoList", healthvoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/healthInfoMng.tiles3");
		
		return mav;
		
		
	}

	/* 건강정보 글보기 */
	@RequestMapping(value = "/healthView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthView(HttpServletRequest request) {
		
		return "admin/healthView.tiles3";
	}

	/* 건강정보 글쓰기 */
	@RequestMapping(value = "/healthWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthWrite(HttpServletRequest request) {
		
		return "admin/healthWrite.tiles3";
	}
	
	/* 후기관리 */
	@RequestMapping(value = "/reviewMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView reviewMng(HttpServletRequest request, ModelAndView mav) {
		
		List<HpReviewVO> reviewvoList = null;
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {

			searchWord = "";
		
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.reviewTotalCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
	//	System.out.println(searchType+"/"+searchWord+"/"+startRno+"/"+endRno);
		
		reviewvoList = service.reviewListPaging(paraMap);
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "adminMemberMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("reviewvoList", reviewvoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/reviewMng.tiles3");
		
		return mav;
		
	}
	
	/* 문의관리 */
	@RequestMapping(value = "/qnaMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView qnaMng(HttpServletRequest request, ModelAndView mav) {
		/*
		HashMap<String, List<QnaBoardVO>> map = service.selectQnAList();
		request.setAttribute("qnavoList", map.get("qnavoList"));
		
		return "admin/qnaMng.tiles3";
		*/
		
		List<QnaBoardVO> qnavoList = null;
		
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		
		HashMap<String, String> paraMap = new HashMap<>();
		
		
		int totalCount = 0;
		int sizePerPage = 5;
		int currentShowPageNo = 0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.qnaListCount(paraMap);
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1)*sizePerPage)+1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
 
		
		qnavoList = service.qnaListPaging(paraMap);
	
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo -1)/blockSize) * blockSize + 1;
		
		String url = "qnaMng.sd";
		
		// === [이전] 만들기 ===
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while (!(loop > blockSize || pageNo > totalPage )) {

			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size: 12pt; border: solid 1px solid; color: red; padding: 2px 4px;'>" + pageNo + "</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop ++;
			pageNo ++;
			
		} // end of while ----------------------------
		
		
		// === [다음] 만들기 ===
		if( !(pageNo > totalPage) ) {
		
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";		
		
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);

		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("qnavoList", qnavoList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("admin/qnaMng.tiles3");
		
		return mav;
		
	}

	/* 문의관리 답변쓰기 */
	@RequestMapping(value = "/qnaAnswer.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView qnaAnswer(HttpServletRequest request, ModelAndView mav) {
		
		String qnaSeq = request.getParameter("qnaSeq");
		
		String gobackURL = request.getParameter("gobackURL");
		mav.addObject("gobackURL", gobackURL);

		QnaBoardVO qnavo = null;

		qnavo = service.getQnaView(qnaSeq);
		
		mav.addObject("qnavo", qnavo);
		mav.setViewName("admin/qnaAnswer.tiles3");
		
		return mav;
	}
	
	/* FAQ관리 */
	@RequestMapping(value = "/faqMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String faqMng(HttpServletRequest request) {
		HashMap<String, List<FaqBoardVO>> map = service.selectfaqList();
		request.setAttribute("faqvoList", map.get("faqvoList"));
		
		return "admin/faqMng.tiles3";
	}
	
	/* FAQ 글쓰기 */
	@RequestMapping(value = "/faqWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String faqWrite(HttpServletRequest request) {
		
		return "admin/faqWrite.tiles3";
	}
	
	
}
