package com.synergy.socdoc.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synergy.service.InterService;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.reservation.service.InterReserveService;

@Component
@Controller
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	 @Autowired
	   private InterReserveService service;
	 
	 
	   // === 예약하기 페이지 요청 === // 
	   @RequestMapping(value="/reserve.sd")
	   public String reserve(HttpServletRequest request) {
	     
		   List<HpInfoVO> hpinfovoList = service.hospital_list();
		   
		   request.setAttribute("hpinfovoList", hpinfovoList);
		   
		   return "Reservation/reservation.tiles1";
	   }
	   
	   // === 예약완료 페이지 요청 === // 
	   @RequestMapping(value="/reserve_result.sd")
	   public String reserve_result() {
	      return "Reservation/reservation_result.tiles1";
	   }
}
