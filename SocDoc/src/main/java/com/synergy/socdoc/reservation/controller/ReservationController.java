package com.synergy.socdoc.reservation.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.reservation.service.InterReserveService;

@Component
@Controller
public class ReservationController {

	
	 @Autowired
	   private InterReserveService service;
	 
	 
	   // === 병원 List 보여주기 요청페이지 === // 
	   @RequestMapping(value="/reserve.sd")
	   public ModelAndView reserve(HttpServletRequest request,ModelAndView mav) {
	    
		   List<HpInfoVO> hpinfovoList = service.hospital_select();

		   HttpSession session = request.getSession();
		      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		      
		      
		      if(loginuser != null) {
		      String userid = loginuser.getUserid();
		   
		      mav.addObject("userid",userid);
		      MemberVO membervo = service.viewMyinfo(userid);
		      mav.addObject("membervo", membervo);
		      }
		   mav.addObject("hpinfovoList", hpinfovoList);
		   mav.setViewName("Reservation/reservation.tiles1");
		   
		   
		   return mav;
	   }
	  
	   
	   // === 예약자명 정보 보여주기 요청페이지 === // 
	   
	   
	   
	   
	   // === 예약완료 페이지 요청 === // 
	   @RequestMapping(value="/reserve_result.sd")
	   public String reserve_result() {
	      return "Reservation/reservation_result.tiles1";
	   }
}
