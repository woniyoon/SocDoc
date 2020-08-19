package com.synergy.socdoc;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.service.InterService;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Component
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private InterService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView home(HttpServletRequest request, ModelAndView mav) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		String content = service.getContent();
		System.out.println("DB에서 가져온 이메일 주소 : " + content);
		
//		request.setAttribute("content", content);
		
		
//		MemberVO loginuser = (MemberVO) request.getSession().getAttribute("loginuser");
		
		HashMap<String, List<NoticeVO>> map = service.selectNoticeList();
		request.setAttribute("noticevoList", map.get("noticevoList"));
		
		List<HpReviewVO> hpRankList = service.getRankList(); // 병원 평점순위 별 리스트 보여주기
		request.setAttribute("hpRankList", hpRankList);
		
		mav.addObject("hpRankList", hpRankList);
		mav.setViewName("main/home.tiles1");
		
		/*
		// 병원검색
		List<HpInfoVO> mapHpList = null;
		
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String district = request.getParameter("district");
		String dept = request.getParameter("dept");
		String searchWord = request.getParameter("searchWord");
		String currentPage = request.getParameter("currentPage");
		String latitudeHere = request.getParameter("latitudeHere");
		String longitudeHere = request.getParameter("longitudeHere");

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		if(latitudeHere==null) {
			latitudeHere = "37.56602747782394";
		}
		if(longitudeHere==null) {
			longitudeHere= "126.98265938959321";					
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("county", county);
		paraMap.put("district", district);
		paraMap.put("dept", dept);
		paraMap.put("searchWord", searchWord);
		paraMap.put("latitudeHere", latitudeHere);
		paraMap.put("longitudeHere", longitudeHere);
		*/
		
		return mav;
	
	}

	
}
