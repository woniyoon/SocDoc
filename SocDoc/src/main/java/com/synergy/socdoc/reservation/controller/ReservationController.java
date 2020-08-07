package com.synergy.socdoc.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.reservation.service.InterReserveService;

@Component
@Controller
public class ReservationController {

	
	 @Autowired
	   private InterReserveService service;
	 
	 
	   // === 병원목록 보여주기 요청페이지 === // 
	   @RequestMapping(value="/reserve.sd")
	   public ModelAndView reserve(HttpServletRequest request,ModelAndView mav) {
	    
		   List<HpInfoVO> hpinfovoList = service.hospital_select();
		   
		   /*HpInfoVO hpinfovo = null;
		   
		   hpinfovo = */
		   
		   mav.addObject("hpinfovoList", hpinfovoList);
		   mav.setViewName("Reservation/reservation.tiles1");
		   
		   
		   return mav;
	   }
	  
	   
	   
	   
	   
	   // === 예약완료 페이지 요청 === // 
	   @RequestMapping(value="/reserve_result.sd")
	   public String reserve_result() {
	      return "Reservation/reservation_result.tiles1";
	   }
}
