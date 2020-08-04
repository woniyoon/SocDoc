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

	@RequestMapping(value = "/adminNotice.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminNotice(HttpServletRequest request) {
		
		return "admin/adminNotice.tiles3";
	}
	
		
}
