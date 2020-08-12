package com.synergy.socdoc.hpMem;

import java.io.File;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;

import com.synergy.socdoc.common.*;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

@Component
@Controller
public class HpMemController {
	
	@Autowired
	private InterHpMemService service;
	
	@Autowired
	private FileManager fileManager;
	
	// 병원회원 페이지 
	// 홈
	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {

		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = (String) request.getSession().getAttribute("hpSeq");
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
//		String hpSeq = (String) request.getSession().getAttribute("hpSeq");
//		HpInfoVO hpInfo = service.getHpInfo(hpSeq);
		String hpSeq = "17";
		
		String table = "hpApplication";
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("table", table);
		
		// 업데이트 리스트 총 개수 가져오기
		int numOfUpdates = service.getNumOfItems(paraMap);

		

		String currentShowPageNoStr = request.getParameter("currentShowPageNoStr");
		int sizePerPage = 5;
		int totalPage = (int) Math.ceil((double) numOfUpdates / sizePerPage);
		int currentShowPageNo = 0;
		
		// 현재 페이지 번호 설정
		if(currentShowPageNoStr == null) {
			currentShowPageNo = 1;
		}
		
		// 문자열로 된 페이지 넘버 숫자 파싱
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

		
		// 정보 업데이트 목록 가져오기
		List<HpInfoVO> infoUpdateList = service.getInfoUpdateList(paraMap);
		
		String baseUrl = MyUtil.getBaseURL(request);

		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, baseUrl);

		
		request.setAttribute("infoUpdateList", infoUpdateList);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numOfUpdates", numOfUpdates);
		
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
	public String submitInfo(HpInfoVO hpInfoVO, MultipartHttpServletRequest mrequest) {
		// HpInfoVO에 포함 안 되는 스케줄만 따로 받아옴
		String schedule = mrequest.getParameter("schedule");
		
		// TODO: 나중에는 hpSeq는 session에서 읽어옴
		hpInfoVO.setHpSeq("17");
			
		// 새로 신청하는 경우에만(status == 1) 파일 업로드
		if(hpInfoVO.getStatus() == 1) {
			for(int i=0; i< hpInfoVO.getAttachMain().length; i++) {
				MultipartFile attach = hpInfoVO.getAttachMain()[i];
				
				System.out.println(attach.getName());
				System.out.println(attach.getContentType());
				System.out.println("!!!!!!!!");
				
			
				if(!attach.isEmpty()) {
					System.out.println("파일첨부 돼있음");
					System.out.println(attach.getName());
					
					// WAS의 webapp의 절대경로를 알아와야한다.
					HttpSession session = mrequest.getSession();
					String root = session.getServletContext().getRealPath("/");
				
					String path = root + "resources" + File.separator + "files";
					
					// path = 첨부파일 저장될 WAS의 폴더
		
					System.out.println(" path   :   " + path);
					
					// 2. 파일첨부를 위한변수의 설정 및 값을 초기화한 후 파일 올리기
					String newFileName = "";
					
					byte[] bytes = null;
					
					try {
						bytes = attach.getBytes();
						// getBytes() 메소드는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다. 
			            // 예를 들어, 첨부한 파일이 "강아지.png" 이라면
			            // 이파일을 WAS(톰캣) 디스크에 저장시키기 위해 byte[] 타입으로 변경해서 올린다.
						
						newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
						// 파일 올리기
						// attach.getOriginalFileName()은 첨부한 파일의 파일명(예)강아지.png)
						System.out.println("확인용 newFileName : " + newFileName);
						
						// 순서에 따라 메인이미지/서브이미지 확인
						switch (i) {
						case 0:
							hpInfoVO.setMainImg(newFileName);
							hpInfoVO.setOrgMainImg(attach.getOriginalFilename());
							break;
						case 1:
							hpInfoVO.setSubImg1(newFileName);
							hpInfoVO.setOrgSubImg1(attach.getOriginalFilename());
							break;
						case 2:
							hpInfoVO.setSubImg2(newFileName);
							hpInfoVO.setOrgSubImg2(attach.getOriginalFilename());
							break;
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
			}
		} 

		
		JsonParser parser = new JsonParser();
		JsonArray jsonArray = (JsonArray) parser.parse(schedule);
		
		List<HashMap<String, String>> scheduleList = new ArrayList<>();
		
		// JSON 배열 문자열을 객체로 변환 & HashMap에 저장
		for(int i=0; i<jsonArray.size(); i++) {
			HashMap<String, String> paraMap = new HashMap<>();
			JsonObject object = (JsonObject) jsonArray.get(i);
			
			String day = String.valueOf(i+1);
			JsonObject oHours = object.getAsJsonObject(day);
			
			String open = oHours.get("open").getAsString();
			String close = oHours.get("close").getAsString();
			
			paraMap.put("day", day);
			paraMap.put("open", open);
			paraMap.put("close", close);
			paraMap.put("hpSeq", hpInfoVO.getHpSeq());
			paraMap.put("submitId", hpInfoVO.getSubmitId());
			
			scheduleList.add(paraMap);
		}
		
		// service 통해서 업데이트
		int result = 0;
	
		// 신청테이블에 업데이트
		result += service.submitInfo(hpInfoVO);
	
		// 스케줄신청 테이블에 업데이트 
		result += service.submitSchedule(scheduleList);
		
		System.out.println(hpInfoVO.getAttachMain().getClass());
		String msg ="신청 완료됐습니다!";
		String loc = mrequest.getContextPath() + "/hpPanel/hpInfo.sd";
		
		System.out.println("result : " + result);
		
		if(result != 7) {
			 msg = "서버 측 에러로 요청이 실패됐습니다.\n다시 한 번 시도해주세요.";
			 loc = "history.back()";
		}
		
		mrequest.setAttribute("msg", msg);
		mrequest.setAttribute("loc", loc);
		
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
		String searchWord = request.getParameter("searchWord");
		String hpSeq = "2";
		int sizePerPage = 10;
		HashMap<String, String> paraMap = new HashMap<>();

		// 검색어가 없을 때 공백으로 초기화
		if(searchWord == null) {
			searchWord = "";
		}
		
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("searchWord", searchWord);
		
		// 총 방문자 수 가져오기 
		int numOfVisitors = service.getNumOfVisitors(paraMap);
		
		int totalPage = (int) Math.ceil((double) numOfVisitors / sizePerPage);
		int currentShowPageNo = 0;
		
		// 현재 페이지 번호 설정
		if(currentShowPageNoStr == null) {
			currentShowPageNo = 1;
		}
		
		// 현재페이지 문자열을 숫자파싱
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

		// 방문자 목록 가져오기
		List<HashMap<String, String>> visitorsList = service.getVisitors(paraMap);
		
		String baseUrl = MyUtil.getBaseURL(request);
		
		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, baseUrl);
		
		request.setAttribute("numOfVisitors", numOfVisitors);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("visitorsList", visitorsList);
		request.setAttribute("searchWord", searchWord);
		
		return "hpMem/visitorsMng.tiles4";
	}
	
	// 후기보기
	@RequestMapping(value = "/hpPanel/hpReviews.sd", method = RequestMethod.GET)
	public String hpReviews(HttpServletRequest request) {
		
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";

		String table = "hospitalReview";
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null) {
			searchWord = "";
		}

		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("table", table);
		paraMap.put("searchWord", searchWord);
		
		// 후기 리스트 총 개수 가져오기
		int numOfReviews = service.getNumOfItems(paraMap);

		String currentShowPageNoStr = request.getParameter("currentShowPageNoStr");
		int currentShowPageNo = 0;
		int sizePerPage = 10;
		int totalPage = (int) Math.ceil((double) numOfReviews / sizePerPage);
		
		System.out.println("numOfReviews  : " + numOfReviews);
		
		if(currentShowPageNoStr == null) {
			currentShowPageNo = 1;
		} else {

			// 문자열로 된 페이지 넘버 숫자 파싱
			try {
				currentShowPageNo = Integer.parseInt(currentShowPageNoStr);
				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
			
		}
		
		int startRNO = ((currentShowPageNo - 1) * sizePerPage) + 1;
		int endRNO = startRNO + sizePerPage - 1;
		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));

		List<HpReviewVO> reviewList = service.getHpReviews(paraMap);
		
		String baseUrl = MyUtil.getBaseURL(request);

		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, baseUrl);

		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numOfReviews", numOfReviews);
		
		
		return "hpMem/hpReviews.tiles4";
	}

	// 통계관리
	@RequestMapping(value = "/hpPanel/hpStats.sd", method = RequestMethod.GET)
	public String getHpStats(HttpServletRequest request) {
		
		return "hpMem/hpStats.tiles4";
	}

}
