package com.synergy.socdoc.center.ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.center.service.InterCenterService;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.QnaBoardVO;

@Component
@Controller
public class CenterController {
	
	
	@Autowired
	private InterCenterService service;
	

	
	@RequestMapping(value = "/faq.sd")
	public ModelAndView faq(ModelAndView mav) {
		
		List<HashMap<String,String>> faqList = null;
		
		faqList = service.faqSelect();
		
		mav.addObject("faqList",faqList);
		mav.setViewName("center/faq.tiles5");

		return mav;
	}
	
	
	@RequestMapping(value = "/inquiry.sd")
	public ModelAndView requiredLogin_inquiry(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		mav.setViewName("center/inquiry.tiles5");

		return mav;
	}
	
	@RequestMapping(value="/inquiryAdd.sd")
	public ModelAndView inquiryAdd(HashMap<String, String> paraMap,  QnaBoardVO qvo, HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		qvo.setUserid(userid);
		
		
		System.out.println("userid : "+userid);
		System.out.println(qvo.getUserid());
		System.out.println(qvo.getSubject());
		System.out.println(qvo.getContent());
		
		int n = service.inquiryAdd(qvo);
		
		if (n == 1) {
			mav.addObject("msg", "문의가 등록되었습니다.");
		} else {
			mav.addObject("msg", "문의 등록에 실패하였습니다.");
		}

		mav.addObject("loc", request.getContextPath() + "/askList.sd");
		mav.setViewName("msg");

		return mav;
	}
	
	
}
