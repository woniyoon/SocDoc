package com.synergy.socdoc.api;

import java.util.HashMap;

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
	@RequestMapping(value = "/api/amList.sd", produces="application/text;charset=utf-8")
	public String getAmList(HttpServletRequest request) {
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		
		if(str_currentShowPageNo==null) {
			str_currentShowPageNo="1";
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;
		int sizePerPage = 10;
		int currentShowPageNo = 0;
		int totalPage = 0;

		int startRno = 0;
		int endRno = 0;
		
		
		totalCount = service.getTotalCount(paraMap);
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		
		try {	
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
			}

		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		
		
		String result= service.getAmList();
				
		return result;
	}
}
