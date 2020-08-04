package com.synergy.socdoc.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/login.sd")
	public String login(HttpServletRequest request) {
		String ctxPath = request.getContextPath();
		System.out.println(ctxPath+"/login.sd로 접속하셨습니다.");
		return "login/login.tiles1";
	}
}
