package com.synergy.socdoc.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.synergy.service.InterService;

@Controller
public class AdminController {

	@Autowired
	private InterService service;
	
	@RequestMapping(value = "/adminMemberList.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminMemberList(HttpServletRequest request) {
		
		return "admin/adminMemberList.tiles3";
	}

		
	@RequestMapping(value = "/adminHospitalList.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminHospitalList(HttpServletRequest request) {
		
		return "admin/adminHospitalList.tiles3";
	}
	
	@RequestMapping(value = "/hospitalInfo.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String hospitalInfo(HttpServletRequest request) {
		
		return "admin/hospitalInfo.tiles3";
	}
	
	@RequestMapping(value = "/adminNotice.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminNotice(HttpServletRequest request) {
		
		return "admin/adminNotice.tiles3";
	}
	
	@RequestMapping(value = "/noticeView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String noticeView(HttpServletRequest request) {
		
		return "admin/noticeView.tiles3";
	}
	
	@RequestMapping(value = "/noticeWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String noticeWrite(HttpServletRequest request) {
		
		return "admin/noticeWrite.tiles3";
	}
	
	@RequestMapping(value = "/healthInfo.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthInfo(HttpServletRequest request) {
		
		return "admin/healthInfo.tiles3";
	}

	@RequestMapping(value = "/healthView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthView(HttpServletRequest request) {
		
		return "admin/healthView.tiles3";
	}

	@RequestMapping(value = "/healthWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthWrite(HttpServletRequest request) {
		
		return "admin/healthWrite.tiles3";
	}
	
	@RequestMapping(value = "/reviewMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String reviewMng(HttpServletRequest request) {
		
		return "admin/reviewMng.tiles3";
	}
	
	@RequestMapping(value = "/qnaMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String qnaMng(HttpServletRequest request) {
		
		return "admin/qnaMng.tiles3";
	}
	
	
}
