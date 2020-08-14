package com.synergy.socdoc.hpMem;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;

import com.synergy.socdoc.common.*;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;

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
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("loginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
		// 병원 영업시간 가져오기
		List<HashMap<String, String>> openingHours = service.getOpeningHours(hpSeq);

		// 병원 후기 가져오기
		List<HashMap<String, String>> reviewList = service.getRecentReviews(hpSeq);
				
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
		int blockSize = 10;
		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));

		
		// 정보 업데이트 목록 가져오기
		List<HpInfoVO> infoUpdateList = service.getInfoUpdateList(paraMap);
		
		String baseUrl = MyUtil.getBaseURL(request);
		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, blockSize, baseUrl);

		
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
		
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";
		return "hpMem/reservationInfo.tiles4";
	}

	
	@ResponseBody
	@RequestMapping(value = "/ajax/reservationList.sd", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String getReservationList(HttpServletRequest request) {
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";
		
		// 방문예정자 리스트 뽑아오기
		String visitDate = request.getParameter("visitDate");

		// 방문일자가 없으면 오늘로 설정
		if(visitDate == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        
	        visitDate = sdf.format(calendar.getTime());
		}
		
		System.out.println(visitDate);
		HashMap<String, String> paraMap = new HashMap<>();

		paraMap.put("hpSeq", hpSeq);
		paraMap.put("visitDate", visitDate);
		
		List<HashMap<String, String>> visitorsList = service.getVisitorsList(paraMap);
		
		JsonArray jsonArr = new JsonArray();
	
		for(int i=0; i<visitorsList.size(); i++) {
			JsonObject object = new JsonObject();
			HashMap<String, String> map = visitorsList.get(i);
			
			System.out.println(map.get("name"));

			object.addProperty("name", map.get("name"));
			object.addProperty("phone", map.get("phone"));
			object.addProperty("reservSeq", map.get("reservSeq"));
			object.addProperty("userid", map.get("userid"));
			object.addProperty("visitDate", map.get("visitDate"));
			object.addProperty("status", map.get("status"));
			object.addProperty("day", map.get("day"));
			object.addProperty("hour", map.get("hour"));
			
			boolean hasVisited = "1".equals(map.get("status")) ? true : false;
			object.addProperty("hasVisited", hasVisited);
			
			jsonArr.add(object);
		}
		
		return jsonArr.toString();
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/ajax/updateVisitStatus.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String updatevisitStatus(HttpServletRequest request) {
	
		String reservSeqStr = request.getParameter("reservSeq");
		String statusStr = request.getParameter("status");
		
		
		int status = "true".equalsIgnoreCase(statusStr) ? 1 : 0;
		int reservSeq = Integer.parseInt(reservSeqStr);
		
		HashMap<String, Integer> paraMap = new HashMap<>();
		
		System.out.println(reservSeq);
		System.out.println(status);
		
		paraMap.put("reservSeq", reservSeq);
		paraMap.put("status", status);
		
		int result = service.updateVisitStatus(paraMap);
		
		JsonObject obj = new JsonObject();
		if(result == 1) {
			obj.addProperty("isDone", true);
		} else {
			obj.addProperty("isDone", false);
		}
		
		return obj.toString();
	}
	
	// 모달에 띄울 방문자 상세 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/ajax/getVisitorDetail.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String getVisitorDetail(HttpServletRequest request) {
		
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String hpSeq = "2";
		String userid = request.getParameter("userid");
		String currentShowPageNoStr = request.getParameter("currentShowPageNoStr");
		int sizePerPage = 3;
		
		int currentShowPageNo = 0;
		
		// 현재 페이지 번호 설정
		if(currentShowPageNoStr == null) {
			currentShowPageNo = 1;
		}

		int startRNO = ((currentShowPageNo - 1) * sizePerPage) + 1;
		int endRNO = startRNO + sizePerPage - 1;

		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("userid", userid);
		
		
		// 방문이력 총 개수
		int numOfRecords = service.getNumOfRecords(paraMap);
		
		int totalPage = (int) Math.ceil((double) numOfRecords / sizePerPage);
		
		
		// 현재페이지 문자열을 숫자파싱
		try {
			currentShowPageNo = Integer.parseInt(currentShowPageNoStr);
			if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
				currentShowPageNo = 1;
			}
		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		
		// 방문자 개인정보 가져오기
		MemberVO member = service.getVisitorDetail(userid);
		
		// 방문이력 가져오기
		List<String> visitRecord = service.getVisitRecord(paraMap);
		

		int blockSize = 5;
		int pageNo = 1;
		int loop = 1;
					
		String pageBar = "";
		
		pageNo = ((currentShowPageNo-1)/blockSize) * blockSize + 1;
					
		if(pageNo != 1) {
			pageBar += "&nbsp;<a onclick='callRecord("+userid+","+(pageNo-1)+");'>[이전]</a>&nbsp;";		  		  
		}
					
					while(!(loop > blockSize || pageNo > totalPage)) {
						  
						if(pageNo == currentShowPageNo) {
							pageBar += "&nbsp;<a class='active'>" + pageNo + "</a>&nbsp;";			  
						} else {			  
							pageBar += "&nbsp;<a onclick='callRecord("+userid+","+pageNo+");'>"+pageNo+"</a>&nbsp;";
						}

						pageNo++;
						loop++;
					}
					
					if(!(pageNo > totalPage)) {
					  pageBar += "&nbsp;<a onclick='callRecord("+userid+","+pageNo+");'>[다음]</a>&nbsp;";		  
					}
		
		
		
		JsonArray jsonArr = new JsonArray();
		
		for(int i=0; i<visitRecord.size(); i++) {
			JsonObject json = new JsonObject();
			json.addProperty("visitDate", visitRecord.get(i));
			jsonArr.add(json);
		}
		
		JsonObject obj = new JsonObject();
		
		obj.addProperty("name", member.getName());
		obj.addProperty("birthDate", member.getBirthDate());
		obj.addProperty("age", member.getAge());
		obj.addProperty("gender", member.getGender());
		obj.addProperty("phone", member.getPhone());
		obj.addProperty("record", jsonArr.toString());
		obj.addProperty("pageBar", pageBar);
		
		return obj.toString();
	}
	
	// 날짜별 방문자 수 구하기
	@ResponseBody
	@RequestMapping(value = "/ajax/getNumPerHour.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String getNumPerHour(HttpServletRequest request) {
		
		// TODO: 나중에는 이 부분을 이용해서 병원정보 가져오기
//		String hpSeq = request.getSession().getAttribute("hpSeq");
		String visitDate = request.getParameter("visitDate");
		String hpSeq = "2";
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("visitDate", visitDate);
		paraMap.put("hpSeq", hpSeq);
		
		JsonArray jsonArr = new JsonArray();
		
		List<HashMap<String, String>> list = service.getNumPerHour(paraMap);
		
		for(int i=0; i<list.size(); i++) {
			JsonObject object = new JsonObject();
			HashMap<String, String> map = list.get(i);
			
			object.addProperty("hour", map.get("hour"));
			object.addProperty("cnt", map.get("cnt"));
			
			jsonArr.add(object);
		}
		
		return jsonArr.toString();
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
		int blockSize = 10;

		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));

		// 방문자 목록 가져오기
		List<HashMap<String, String>> visitorsList = service.getVisitors(paraMap);
		
		String baseUrl = MyUtil.getBaseURL(request);
		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, blockSize, baseUrl);
		
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
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		// 검색 범주를 userid로 세팅
		if(searchType == null) {
			searchType = "userid";
		}

		HashMap<String, String> paraMap = new HashMap<>();

		
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("table", table);
		paraMap.put("searchType", searchType);

		// 총 개수 알아오기 (검색 X)
		paraMap.put("searchWord", "");
		int totalNum = service.getNumOfItems(paraMap);
		
		paraMap.put("searchWord", searchWord);
		
		// 후기 리스트 총 개수 가져오기 (검색)
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
		int blockSize = 10;
		
		paraMap.put("startRNO", String.valueOf(startRNO));
		paraMap.put("endRNO", String.valueOf(endRNO));

		List<HpReviewVO> reviewList = service.getHpReviews(paraMap);
		
		int avgRating = 0;
		
//		// 리뷰가 있다면 평점만 따로 추출
		if(reviewList.size() > 0) {
			avgRating = reviewList.get(0).getAvgRating();
		}

		
		// 페이지바 생성
		String baseLink = MyUtil.getBaseURL(request);
		String pageBar = MyUtil.createPageBar(currentShowPageNo, totalPage, blockSize, baseLink);

		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numOfReviews", numOfReviews);
		request.setAttribute("totalNum", totalNum);
		request.setAttribute("avgRating", avgRating);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchWord", searchWord);
		
		
		return "hpMem/hpReviews.tiles4";
	}

	// 통계관리
	@RequestMapping(value = "/hpPanel/hpStats.sd", method = RequestMethod.GET)
	public String getHpStats(HttpServletRequest request) {
		
		return "hpMem/hpStats.tiles4";
	}

}
