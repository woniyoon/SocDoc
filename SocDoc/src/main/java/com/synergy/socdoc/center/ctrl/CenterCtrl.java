package com.synergy.socdoc.center.ctrl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class CenterCtrl {

	
	@RequestMapping(value = "/faq.sd")
	public ModelAndView faq(ModelAndView mav) {

		mav.setViewName("center/faq.tiles5");

		return mav;
	}
	
	
	@RequestMapping(value = "/inquiry.sd")
	public ModelAndView inquiry(ModelAndView mav) {

		mav.setViewName("center/inquiry.tiles5");

		return mav;
	}
}
