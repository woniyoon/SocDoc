package com.synergy.socdoc.searchMenu.ctrl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Component
@Controller
public class searchController {

	/*
	@Autowired
	private InterSearchMenuService service;*/
		
	
	// 첫페이지
	@RequestMapping(value = "/searchMenu.sd")
	public ModelAndView searchMenu(ModelAndView mav) {

		mav.setViewName("searchMenu/searchMenu.tiles1");

		return mav;
	}
	
	
	// 병원 상세 페이지
	@RequestMapping(value = "/hospitalDetail.sd")
	public ModelAndView hospitalDetail(ModelAndView mav) {

		mav.setViewName("hospital/hospitalDetail.tiles1");

		return mav;
	}

	
}
