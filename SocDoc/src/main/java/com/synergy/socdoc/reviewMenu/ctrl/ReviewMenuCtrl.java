package com.synergy.socdoc.reviewMenu.ctrl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class ReviewMenuCtrl {
	
	/*
	@Autowired
	private InterSearchMenuService service;*/
	
	
	@RequestMapping(value = "/reviewMenu.sd")
	public ModelAndView searchMenu(ModelAndView mav) {

		mav.setViewName("reviewMenu/reviewMenu.tiles1");

		return mav;
	}
		

}
