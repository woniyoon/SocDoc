package com.synergy.socdoc.hpPanel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Component
@Controller
public class HpPanelController {

	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		
		request.setAttribute("content", "Controller에서 넘어온 문구입니다.");
		
		return "hpPanel/main.tiles4";
	}

	@RequestMapping(value = "/hpPanel/hpInfo.sd", method = RequestMethod.GET)
	public String hpInfo(HttpServletRequest request) {
		
		return "hpPanel/hpInfo.tiles4";
	}

}
