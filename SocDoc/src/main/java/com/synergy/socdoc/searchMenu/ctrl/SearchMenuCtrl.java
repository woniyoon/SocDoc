package com.synergy.socdoc.searchMenu.ctrl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Component
@Controller
public class SearchMenuCtrl {

	/*
	@Autowired
	private InterSearchMenuService service;*/
		
	
	// 병원찾기
	@RequestMapping(value = "/searchHospital.sd")
	public ModelAndView searchHospital(ModelAndView mav) {

		mav.setViewName("searchMenu/searchHospital.tiles1");

		return mav;
	}
	
	
	// 약국찾기
	@RequestMapping(value = "/searchPharmacy.sd")
	public ModelAndView searchPharmacy(ModelAndView mav) {

		mav.setViewName("searchMenu/searchPharmacy.tiles1");

		return mav;
	}
	
	
	// 민간구급차
	@RequestMapping(value = "/searchAmbulance.sd")
	public ModelAndView searchAmbulance(ModelAndView mav) {

		mav.setViewName("searchMenu/searchAmbulance.tiles1");

		return mav;
	}
	
	
}
