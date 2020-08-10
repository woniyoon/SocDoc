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
import com.synergy.socdoc.common.MyUtil;
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

		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";
		
		// 병원 영업시간 가져오기
		List<HashMap<String, String>> openingHours = service.getOpeningHours(hpSeq);

		// 병원 후기 가져오기
		List<HashMap<String, String>> reviewList = service.getRecentReviews(hpSeq);
		
		System.out.println(openingHours.get(0).get("close"));
		
		request.setAttribute("openingHours", openingHours);
		request.setAttribute("reviewList", reviewList);
		
		return "hpMem/main.tiles4";
	}

	// 병원정보관리
	@RequestMapping(value = "/hpPanel/hpInfo.sd", method = RequestMethod.GET)
	public String test_hpInfo(HttpServletRequest request) {
		
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "100";
//		
//		HpInfoVO hpInfo = service.getHpInfo(hpSeq);
		
		List<HpInfoVO> infoUpdateList = service.getInfoUpdateList(hpSeq);
		
		request.setAttribute("infoUpdateList", infoUpdateList);
		return "hpMem/hpInfo.tiles4";
	}
	
	// 병원 정보 관리에서 각 신청 정보를 확인
	@RequestMapping(value = "/hpPanel/updateHpInfo.sd", method = RequestMethod.GET)
	public String test_updateHpInfo(HttpServletRequest request) {
		String submitId = request.getParameter("submitId");
		
		if(submitId != null) {
			// 병원 상세 정보 가져오기
			HpInfoVO hpInfoDetail = service.getHpInfoDetail(submitId);
			
			System.out.println(submitId);
			
			// 시간테이블 들고 오기
			List<HashMap<String, String>> scheduleTbl = service.getScheduleTbl(submitId);
			
			request.setAttribute("hpInfo", hpInfoDetail);
			request.setAttribute("scheduleTbl", scheduleTbl);
		}
		
		return "hpMem/updateHpInfo.tiles4";
	}
	
	// 새 병원상세정보 업데이트
	@RequestMapping(value = "/hpPanel/submitInfo.sd", method = RequestMethod.POST)
	public String submitInfo(HttpServletRequest request) {
		String schedule = request.getParameter("schedule");
		String name = request.getParameter("name");
		String mainImg = request.getParameter("mainImg");
		String address = request.getParameter("address");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String phone = request.getParameter("phone");
		String dept = request.getParameter("dept");
		String info = request.getParameter("info");
		System.out.println(schedule);
		System.out.println(name);
		System.out.println(latitude);
		System.out.println(longitude);
		System.out.println(address);
		System.out.println(info);
		System.out.println("?????");
		
		return "msg";
	}
	
	

	// 예약관리
	@RequestMapping(value = "/hpPanel/reservationInfo.sd", method = RequestMethod.GET)
	public String reservationInfo(HttpServletRequest request) {
		
		return "hpMem/reservationInfo.tiles4";
	}

	// 방문고객관리 w. 페이징
	@RequestMapping(value = "/hpPanel/visitorsMng.sd", method = RequestMethod.GET)
	public String visitorsMng(HttpServletRequest request) {
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String currentShowPageNoStr = request.getParameter("currentShowPageNoStr");
		String hpSeq = "2";
		int sizePerPage = 10;
		HashMap<String, String> paraMap = new HashMap<>();

		
		// 총 방문자 수 가져오기 
		int numOfVisitors = service.getNumOfVisitors(hpSeq);
		
		int totalPage = (int) Math.ceil((double) numOfVisitors / sizePerPage);
		int currentShowPageNo = 0;
		
		// 현재 페이지 번호 설정
		if(currentShowPageNoStr == null) {
			currentShowPageNo = 1;
		}
		
		try {
			currentShowPageNo = Integer.parseInt(currentShowPageNoStr);
			if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
				currentShowPageNo = 1;
			}
		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		int startRNO = ((currentShowPageNo - 1) * sizePerPage) + 1;
		int endRNO = startRNO + sizePerPage - 1;
		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));
		paraMap.put("hpSeq", hpSeq);

		// 방문자 목록 가져오기
		List<HashMap<String, String>> visitorsList = service.getVisitors(paraMap);
		
		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage);
		
		request.setAttribute("numOfVisitors", numOfVisitors);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("visitorsList", visitorsList);
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
