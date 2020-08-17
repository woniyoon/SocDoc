package com.synergy.socdoc.api;

import java.text.SimpleDateFormat;
import java.util.Calendar;

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

	@ResponseBody
	@RequestMapping(value = "/api/corona.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String getCoronaStats(HttpServletRequest request) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar today = Calendar.getInstance();
        today.add(Calendar.DATE, -1); // 7일(일주일)을 뺀다
        String endCreateDt = sdf.format(today.getTime());

        today.add(Calendar.DATE, -7); // 7일(일주일)을 뺀다
        String startCreateDt = sdf.format(today.getTime());
		
		
		System.out.println("********* 호출시작! *********");
		String result= service.getCoronaStats(startCreateDt, endCreateDt);
		
		System.out.println("********* 호출완료 ! *********");
		
		return result;
	}
}
