package com.synergy.socdoc.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ApiController {
	
	@Autowired
	private InterApiService service;
	
	@ResponseBody
	@RequestMapping(value = "/api/covidStats.sd", method = RequestMethod.GET)
	public String getCovidStats(HttpServletRequest request) {
		System.out.println("---------- 호출시작! ----------");
		String result= service.getCovidStats();
		
		System.out.println("---------- 호출완료 ----------");
		
		return result;
	}
}
