package com.synergy.socdoc.hpMem;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.synergy.service.InterService;
import com.synergy.socdoc.member.HpInfoVO;

@Component
@Controller
public class HpMemController {
	
	@Autowired
	private InterHpMemService service;
	
	// 병원회원 페이지 
	// 홈
	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {

		
		return "hpMem/main.tiles4";
	}

	// 병원정보관리
	@RequestMapping(value = "/hpPanel/hpInfo.sd", method = RequestMethod.GET)
	public String test_hpInfo(HttpServletRequest request) {
		
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";
//		
//		HpInfoVO hpInfo = service.getHpInfo(hpSeq);
		
		List<HpInfoVO> infoUpdateList = service.getInfoUpdateList(hpSeq);
		
		System.out.println(infoUpdateList.get(0).getSubmitId());
		
		request.setAttribute("infoUpdateList", infoUpdateList);
		return "hpMem/hpInfo.tiles4";
	}
	
	// 병원 정보 관리에서 각 신청 정보를 확인
	@RequestMapping(value = "/hpPanel/updateHpInfo.sd", method = RequestMethod.GET)
	public String test_updateHpInfo(HttpServletRequest request) {
		String submitId = request.getParameter("submitId");
		
		// 병원 상세 정보 가져오기
		HpInfoVO hpInfoDetail = service.getHpInfoDetail(submitId);
		
		System.out.println(submitId);
		
		// 시간테이블 들고 오기
		List<HashMap<String, String>> scheduleTbl = service.getScheduleTbl(submitId);
		
		
		request.setAttribute("hpInfo", hpInfoDetail);
		request.setAttribute("scheduleTbl", scheduleTbl);
		
		return "hpMem/updateHpInfo.tiles4";
	}

	// 예약관리
	@RequestMapping(value = "/hpPanel/reservationInfo.sd", method = RequestMethod.GET)
	public String reservationInfo(HttpServletRequest request) {
		
		return "hpMem/reservationInfo.tiles4";
	}

	// 방문고객관리
	@RequestMapping(value = "/hpPanel/visitorsMng.sd", method = RequestMethod.GET)
	public String visitorsMng(HttpServletRequest request) {
		
		return "hpMem/visitorsMng.tiles4";
	}
	
	// 후기보기
	@RequestMapping(value = "/hpPanel/hpReviews.sd", method = RequestMethod.GET)
	public String hpReviews(HttpServletRequest request) {
		
		return "hpMem/hpReviews.tiles4";
	}

	// 통계관리
	@RequestMapping(value = "/hpPanel/hpStats.sd", method = RequestMethod.GET)
	public String getHpStats(HttpServletRequest request) {
		
		return "hpMem/hpStats.tiles4";
	}

}
