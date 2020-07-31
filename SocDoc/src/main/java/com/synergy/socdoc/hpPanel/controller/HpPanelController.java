package com.synergy.socdoc.hpPanel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Component
@Controller
public class HpPanelController {

	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String main(HttpServletRequest request) {
		
		request.setAttribute("content", "Controller에서 넘어온 문구입니다.");
		
		return "hpPanel/main.tiles1";
	}

//	@RequestMapping(value = "/hpPanel.action", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//	public String test(HttpServletRequest request) {
//		
//		request.setAttribute("content", "Controller에서 넘어온 문구입니다.");
//		System.out.println("ㅠㅠ이건 되려나");
//		return "home";
//	}
	
}
