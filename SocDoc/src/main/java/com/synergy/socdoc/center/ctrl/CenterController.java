package com.synergy.socdoc.center.ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.center.service.InterCenterService;

@Component
@Controller
public class CenterController {
	
	
	@Autowired
	private InterCenterService service;
	

	
	@RequestMapping(value = "/faq.sd")
	public ModelAndView faq(ModelAndView mav) {
		
		List<HashMap<String,String>> faqList = null;
		
		faqList = service.faqSelect();
		
		mav.addObject("faqList",faqList);
		mav.setViewName("center/faq.tiles5");

		return mav;
	}
	
	
	@RequestMapping(value = "/inquiry.sd")
	public ModelAndView requiredLogin_inquiry(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		mav.setViewName("center/inquiry.tiles5");

		return mav;
	}
}
