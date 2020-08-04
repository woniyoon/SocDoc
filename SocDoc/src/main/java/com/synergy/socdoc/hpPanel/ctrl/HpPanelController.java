package com.synergy.socdoc.hpPanel.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.synergy.service.InterService;

@Component
@Controller
public class HpPanelController {
	
	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {

		return "hpPanel/main.tiles4";
	}

	@RequestMapping(value = "/hpPanel/hpInfo.sd", method = RequestMethod.GET)
	public String hpInfo(HttpServletRequest request) {
		
		return "hpPanel/hpInfo.tiles4";
	}

	@RequestMapping(value = "/hpPanel/reservationInfo.sd", method = RequestMethod.GET)
	public String reservationInfo(HttpServletRequest request) {
		
		return "hpPanel/reservationInfo.tiles4";
	}

	@RequestMapping(value = "/hpPanel/visitorsMng.sd", method = RequestMethod.GET)
	public String visitorsMng(HttpServletRequest request) {
		
		return "hpPanel/visitorsMng.tiles4";
	}

}
