package com.synergy.socdoc;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.service.InterService;

/**
 * Handles requests for the application home page.
 */
@Component
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private InterService service;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String home(HttpServletRequest request) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		String content = service.getContent();
		System.out.println(content);
		
		request.setAttribute("content", content);
		
		return "home";
	}
	
	
	// === 마이페이지 메인 페이지 요청 === // 
	@RequestMapping(value="/mypage")
	public String mypage() {
	
		return "myPage/main.tiles2";
	}
	
	// === 회원정보 수정 페이지 === // 
	@RequestMapping(value="/infoEdit")
	public String infoEdit() {
	
		return "myPage/infoEdit.tiles2";
	}
	
	// === 회원정보 수정 페이지2 - 기본정보변경 & 비밀번호 변경 페이지 === // 
	@RequestMapping(value="/infoEdit2")
	public String infoEdit2() {
	
		return "myPage/infoEdit2.tiles2";
	}
	
}
