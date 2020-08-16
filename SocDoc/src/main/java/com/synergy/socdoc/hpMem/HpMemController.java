package com.synergy.socdoc.hpMem;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.*;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.*;

import com.synergy.socdoc.common.*;
import com.synergy.socdoc.login.InterLoginService;
import com.synergy.socdoc.mail.GoogleMail;
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
	private InterLoginService loginService;
	
	@Autowired
	private FileManager fileManager;
	
	// 병원회원 페이지 
	// 홈
	@RequestMapping(value = "/hpPanel/main.sd", method = RequestMethod.GET)
	public String requiredLoginHp_main(HttpServletRequest request, HttpServletResponse response) {

		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
		// 병원 영업시간 가져오기
		List<HashMap<String, String>> openingHours = service.getOpeningHours(hpSeq);

		boolean isExisting = true;
		
		// 영업시간이 비어있으면 미등록 상태임을 전달
		if(openingHours.get(0) == null) {
			isExisting = false;
		}
		
		
		// 병원 후기 가져오기
		List<HashMap<String, String>> reviewList = service.getRecentReviews(hpSeq);
				
		request.setAttribute("openingHours", openingHours);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("isExisting", isExisting);
		
		return "hpMem/main.tiles4";
	}

	// 병원정보관리
	@RequestMapping(value = "/hpPanel/hpInfo.sd", method = RequestMethod.GET)
	public String requiredLoginHp_hpInfo(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
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
	public String requiredLoginHp_updateHpInfo(HttpServletRequest request, HttpServletResponse response) {
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
	public String requiredLoginHp_submitInfo(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mrequest, HpInfoVO hpInfoVO) {
		// HpInfoVO에 포함 안 되는 스케줄만 따로 받아옴
		String schedule = mrequest.getParameter("schedule");
		
		HpMemberVO hpMember = (HpMemberVO) mrequest.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		hpInfoVO.setHpSeq(hpSeq);
			
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
	public String requiredLoginHp_reservationInfo(HttpServletRequest request, HttpServletResponse response) {
		
		return "hpMem/reservationInfo.tiles4";
	}

	
	@ResponseBody
	@RequestMapping(value = "/ajax/reservationList.sd", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String requiredLoginHp_getReservationList(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
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
	public String requiredLoginHp_updatevisitStatus(HttpServletRequest request, HttpServletResponse response) {
	
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
	public String requiredLoginHp_getVisitorDetail(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
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
		
		
		System.out.println(member.getAllergy());
		System.out.println(member.getHeight());
		
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
		obj.addProperty("height", member.getHeight());
		obj.addProperty("weight", member.getWeight());
		obj.addProperty("bloodType", member.getBloodType());
		obj.addProperty("history", member.getHistory());
		obj.addProperty("medicine", member.getMedicine());
		obj.addProperty("allergy", member.getAllergy());
		obj.addProperty("record", jsonArr.toString());
		obj.addProperty("pageBar", pageBar);
		
		return obj.toString();
	}
	
	// 날짜별 방문자 수 구하기
	@ResponseBody
	@RequestMapping(value = "/ajax/getNumPerHour.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String requiredLoginHp_getNumPerHour(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		String visitDate = request.getParameter("visitDate");
		
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
	public String requiredLoginHp_visitorsMng(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		String currentShowPageNoStr = request.getParameter("currentShowPageNoStr");
		String searchWord = request.getParameter("searchWord");
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
	public String requiredLoginHp_hpReviews(HttpServletRequest request, HttpServletResponse response) {
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());

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
	public String requiredLoginHp_hpStats(HttpServletRequest request, HttpServletResponse response) {
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
		return "hpMem/hpStats.tiles4";
	}

	// 계정관리 가기 전
	@RequestMapping(value = "/hpPanel/verifyPwd.sd", method = RequestMethod.GET)
	public String requiredLoginHp_verifyPwd(HttpServletRequest request, HttpServletResponse response) {
		
		return "hpMem/verifyPwd.tiles4";
	}

//	// 계정관리 가기 전
//	@RequestMapping(value = "/hpPanel/verifyPwdEnd.sd", method = RequestMethod.POST)
//	public String verifyPwd(HttpServletRequest request, HttpServletResponse response) {
//		
//		return "hpMem/verifyPwd.tiles4";
//	}

	// 계정관리
	@RequestMapping(value = "/hpPanel/accountSetting.sd", method = RequestMethod.POST)
	public ModelAndView requiredLoginHp_accountSetting(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
		String pwd = request.getParameter("pwd");
		System.out.println(pwd + "   ");
		String encryptedPwd = Sha256.encrypt(pwd);
		System.out.println(encryptedPwd + "   ");
		System.out.println(hpSeq + "   ");

		
		HashMap<String, String> paraMap = new HashMap<>();
		
		paraMap.put("pwd", encryptedPwd);
		paraMap.put("hpSeq", hpSeq);
		
		int n = service.verifyPwd(paraMap);
		
		if(n == 0) {
			System.out.println("틀림~~");
			System.out.println("틀림~~" + n);
			
			String msg = "비밀번호가 유효하지 않습니다! 다시 시도해주세요!";
			String loc = request.getContextPath()+"/hpPanel/verifyPwd.sd";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
		} else {
			System.out.println("?!?!!?");
			mav.addObject("hpMember", hpMember);
			mav.setViewName("hpMem/accountSetting.tiles4");
		}
		
		return mav;
	}

	
	// 이메일 유효한지 확인
	@ResponseBody
	@RequestMapping(value = "/ajax/isEmailValid.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String requiredLoginHp_isEmailValid(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String memEmail = hpMember.getEmail();
		boolean isExisting = loginService.hpEmailChk(email);	// 이메일과 동일한 값을 가진 행이 1개
		String msg = "";
		boolean isSent = false;
		
		JSONObject json = new JSONObject();
		
		
		
		if(isExisting && !email.equals(memEmail)) {
		
			msg = "이미 존재하는 이메일입니다!";
			isSent = false;
			
		} else {
			// 자기 자신의 이메일이거나, 새로 변경하는 경우
			
			Random rnd = new Random();	// 인증키를 랜덤하게 생성하도록 한다.
			String verificationCode = "";
			
			int randnum = 0;
			for(int i=0; i<7; i++) {
				randnum = rnd.nextInt(9 - 0 + 1) + 0;
				verificationCode += randnum;
			}
			
			// 랜덤하게 생성한 인증코드(certificationCode)를 비밀번호 찾기를 하고자 하는 사용자의 email로 전송시킨다.
			GoogleMail mail = new GoogleMail();
			HttpSession session = request.getSession();
			
			
			try {
				System.out.println("~~~~~~~~~~~~~~~~ 메일전송  시작 ~~~~~~~~~~~~~~~~");
				mail.sendmail(email, verificationCode);
				session.setAttribute("verificationCode", verificationCode);
				
				msg = "인증코드가 전송됐습니다!";
				isSent = true;
			} catch (Exception e) {
				e.printStackTrace();
				msg = "다시 한 번 시도해주세요!";
				isSent= false;
			}
			
		}
		
		
		json.put("isSent", isSent);
		json.put("msg", msg);
		
		return json.toString();
		
	}

	
	// 이메일 유효한지 확인
	@ResponseBody
	@RequestMapping(value = "/ajax/updateAccountInfo.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String requiredLoginHp_updateAccountInfo(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String verificationCode = request.getParameter("verificationCode");
		
		String sentVerificationCode = (String) request.getSession().getAttribute("verificationCode");
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
	
		System.out.println("hpUserCertificationCode 인증 코드 : "+verificationCode);
		System.out.println("hpCertificationCode 인증 코드 : "+sentVerificationCode);
		
		String msg = "";
		
		if( sentVerificationCode.equals(verificationCode) ) {
			System.out.println("인증코드 맞음");
			
			HashMap<String, String> paraMap = new HashMap<>();
			
			paraMap.put("hpSeq", hpSeq);
			paraMap.put("name", name);
			paraMap.put("email", email);

			int n = service.updateAccountInfo(paraMap);
			
			if(n==1) {
				hpMember.setEmail(email);
				hpMember.setName(name);
				
				msg = "성공적으로 변경됐습니다!";
			} else {
				msg = "다시 시도해주세요!";
			}
		} else {
			System.out.println("인증코드 안 맞음");
			msg = "인증코드가 틀렸습니다!";			
		}
			
		
		JSONObject json = new JSONObject();
		json.put("msg", msg);
        
		return json.toString();
	}

	
	// 비밀번호 업데이트
	@ResponseBody
	@RequestMapping(value = "/ajax/updateHpPwd.sd", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String requiredLoginHp_updateHpPwd(HttpServletRequest request, HttpServletResponse response) {
		
		String oldPwd = Sha256.encrypt(request.getParameter("oldPwd"));
		String newPwd = Sha256.encrypt(request.getParameter("newPwd"));
		
		HpMemberVO hpMember = (HpMemberVO) request.getSession().getAttribute("hpLoginuser");
		String hpSeq = String.valueOf(hpMember.getHpSeq());
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("pwd", oldPwd);
		paraMap.put("newPwd", newPwd);
		paraMap.put("hpSeq", hpSeq);
		
		System.out.println(newPwd);
		
		String msg = "";
		boolean needsRefresh = false;
		
		int n = service.verifyPwd(paraMap);
			
		if(n == 0) {
			msg = "비밀번호가 틀렸습니다!";
			
		} else {
			int result = service.updateHpPwd(paraMap);
		
			if(result == 1) {
				msg = "비밀번호가 변경됐습니다!";
				needsRefresh = true;
			} else {
				msg = "다시 시도해주세요!";
			}
			
		}
		
		JSONObject json = new JSONObject();
		json.put("msg", msg);
		json.put("needsRefresh", needsRefresh);
		
		return json.toString();
	}
	
	
}
