package com.synergy.socdoc.detail.ctrl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class DetailCtrl {
	
	/*
	@Autowired
	private InterSearchMenuService service;*/
	
	
	
	// 병원 상세 페이지
	@RequestMapping(value = "/hospitalDetail.sd")
	public ModelAndView hospitalDetail(ModelAndView mav) {

		mav.setViewName("detail/hospitalDetail.tiles1");

		return mav;
	}

	
	// 약국 상세 페이지
	@RequestMapping(value = "/pharmacyDetail.sd")
	public ModelAndView pharmacyDetail(ModelAndView mav) {

		mav.setViewName("detail/pharmacyDetail.tiles1");

		return mav;
	}

}
