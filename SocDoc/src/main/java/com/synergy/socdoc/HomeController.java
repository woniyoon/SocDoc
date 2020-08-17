package com.synergy.socdoc;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
import com.synergy.socdoc.member.MemberVO;
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

		return mav;
	}
	

}
