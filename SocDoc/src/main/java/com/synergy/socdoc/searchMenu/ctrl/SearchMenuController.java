package com.synergy.socdoc.searchMenu.ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.PharmacyVO;
import com.synergy.socdoc.searchMenu.service.InterSearchMenuService;


@Component
@Controller
public class SearchMenuController {

	
	@Autowired
	private InterSearchMenuService service;
		
	
	// 병원찾기 지도
	@RequestMapping(value = "/searchHospital.sd")
	public ModelAndView searchHospital(HttpServletRequest request, ModelAndView mav) {

		mav.setViewName("searchMenu/searchHospital.tiles1");

		return mav;
	}
	
	
	// 지도 병원
	@ResponseBody
	@RequestMapping(value = "/mapHospital.sd", produces="application/text;charset=utf-8")
	public String mapHospital(HttpServletRequest request) {

		List<HpInfoVO> hpMap = null;
		
		hpMap = service.searchHospitalSelect();
		
		JSONArray jsonArr = new JSONArray(); 
		
		if(hpMap.size()>0) {
			for(HpInfoVO hpMapVO : hpMap) {
				JSONObject jsonObj = new JSONObject();
							
				String hpSeq = hpMapVO.getHpSeq();
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();

	            double latitude = hpMapVO.getLatitude();
	            double longitude = hpMapVO.getLongitude();

	            jsonObj.put("hpSeq", hpSeq);
	            jsonObj.put("hpName", hpName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            jsonObj.put("latitude", latitude);
	            jsonObj.put("longitude", longitude);
	            
	            jsonArr.put(jsonObj);				
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
	}
	

	
	// 지도 병원 리스트
	@ResponseBody
	@RequestMapping(value="/mapHospitalList.sd", produces="text/plain;charset=UTF-8")
	public String mapHospitalList(HttpServletRequest request, ModelAndView mav) {
		
		List<HpInfoVO> mapHpList = null;
		
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String district = request.getParameter("district");
		String dept = request.getParameter("dept");
		String searchWord = request.getParameter("searchWord");
		String currentPage = request.getParameter("currentPage");
		String latitudeHere = request.getParameter("latitudeHere");
		String longitudeHere = request.getParameter("longitudeHere");

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		if(latitudeHere==null) {
			latitudeHere = "37.56602747782394";
		}
		if(longitudeHere==null) {
			longitudeHere= "126.98265938959321";					
		}
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("county", county);
		paraMap.put("district", district);
		paraMap.put("dept", dept);
		paraMap.put("searchWord", searchWord);
		paraMap.put("latitudeHere", latitudeHere);
		paraMap.put("longitudeHere", longitudeHere);

		int totalCount = 0;
		int sizePerPage = 10;
		int currentShowPageNo = Integer.parseInt(currentPage);
		int totalPage = 0;

		int startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
	
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		totalCount = service.getTotalCountMapHp(paraMap);
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		
		try {
			
			currentShowPageNo = Integer.parseInt(currentPage);			
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
			}
			
		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		
		mapHpList = service.mapHospitalListSearchWithPaging(paraMap);
		
		String pageBarM = "";	       
	    int blockSize = 5; 
	    int loop = 1;
	    
	    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
	    
	    // [이전]
 	 	if(pageNo != 1) {
/* 	 		pageBarM += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+(pageNo-sizePerPage)+","+latitudeHere+","+longitudeHere+")'>이전</span> &nbsp"; 
*/ 	 		pageBarM += "<a class='arrow pprev' onclick='goSearch(1,"+latitudeHere+","+longitudeHere+")'></a>";
 	 		pageBarM += "<a class='arrow prev' onclick='goSearch("+(pageNo-sizePerPage)+","+latitudeHere+","+longitudeHere+")'></a>";
 	 	}
 	    
 	    while (!(loop > blockSize || pageNo > totalPage )) {
 	        /* if(pageNo==currentShowPageNo){
 	        	pageBarM += " &nbsp; <span style='color:#0080ff; padding:2px 4px;'>"+pageNo+"</span> &nbsp";
 	    	 }else {
 	    		pageBarM += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+pageNo+","+latitudeHere+","+longitudeHere+")'>"+pageNo+"</span> &nbsp"; 
 	    	 }
 	         */
 	        if(pageNo == currentShowPageNo) {
 	        	pageBarM += "<a class='active'>" + pageNo + "</a>";
             }
             else {
            	 pageBarM += "<a href='javascript:goSearch("+pageNo+","+latitudeHere+","+longitudeHere+")'>"+pageNo+"</a>";
             }      
 	        
 	 		 loop ++;
 	         pageNo ++;	         
 	    }
 	    
 	    // [다음]
 	    if( !(pageNo > totalPage) ) {
/* 	    	pageBarM += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+(pageNo+sizePerPage)+","+latitudeHere+","+longitudeHere+")'>다음</span> &nbsp"; 
*/ 	    	pageBarM += "<a class='arrow next' href='javascript:goSearch("+(pageNo+sizePerPage)+","+latitudeHere+","+longitudeHere+")'></a>";  
 	    	pageBarM += "<a class='arrow nnext' href='javascript:goSearch("+totalPage+","+latitudeHere+","+longitudeHere+")></a>";  

 		}

		
		JSONArray jsonArr = new JSONArray(); 		
		
		if(mapHpList.size()>0) {
			for(HpInfoVO hpMapVO : mapHpList) {
				
				JSONObject jsonObj = new JSONObject();
			
				String hpSeq = hpMapVO.getHpSeq();
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();
				String hpDept = hpMapVO.getDept();
				String latitude = String.valueOf(hpMapVO.getLatitude());
				String longitude = String.valueOf(hpMapVO.getLongitude());
				String distance = hpMapVO.getDistance();
				
				System.out.println(distance);
				
	            jsonObj.put("hpSeq", hpSeq);
	            jsonObj.put("hpName", hpName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            jsonObj.put("hpDept", hpDept);
	            jsonObj.put("latitude", latitude);
	            jsonObj.put("longitude", longitude);
	            jsonObj.put("distance", distance);
	            jsonObj.put("pageBarM", pageBarM);
	            	            
	            jsonArr.put(jsonObj);	            
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
		
	}
	
	
	//일반 리스트
	@ResponseBody
	@RequestMapping(value="/generalHospital.sd", produces="text/plain;charset=UTF-8")
	public String generalHospital(HttpServletRequest request, ModelAndView mav) {
		
		List<HpInfoVO> hpList = null;
		
		
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String district = request.getParameter("district");
		String dept = request.getParameter("dept");
		String searchWord = request.getParameter("searchWord");
		String currentPage = request.getParameter("currentPage");

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}		
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("county", county);
		paraMap.put("district", district);
		paraMap.put("dept", dept);
		paraMap.put("searchWord", searchWord);

		int totalCount = 0;
		int sizePerPage = 10;
		int currentShowPageNo = Integer.parseInt(currentPage);
		int totalPage = 0;

		int startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
	
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		totalCount = service.getTotalCountHp(paraMap);
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		
		try {
			
			currentShowPageNo = Integer.parseInt(currentPage);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
				
			}

		} catch (NumberFormatException e) {
			currentShowPageNo = 1;

		}
		
		
		hpList = service.hospitalListSearchWithPaging(paraMap);
		
		String pageBar = "";	       
	    int blockSize = 10; 
	    int loop = 1;
	    
	    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
	    
	    // [이전]
 	 	if(pageNo != 1) {
 	 	
/* 	 		pageBar += " &nbsp; <span style='cursor:pointer;' onclick='printGeneral("+(pageNo-sizePerPage)+")'>이전</span> &nbsp"; 
*/ 	 		pageBar += "<a class='arrow pprev' href='javascript:printGeneral(1)'></a>";
 	 		pageBar += "<a class='arrow prev' href='javascript:printGeneral(\""+(pageNo-1)+"\")'></a>";
 	 	}
 	    
 	    while (!(loop > blockSize || pageNo > totalPage )) {
 	         
 	    	 /*if(pageNo==currentShowPageNo){
 	    		 pageBar += " &nbsp; <span style='color:#0080ff; padding:2px 4px;'>"+pageNo+"</span> &nbsp";
 	    	 }else {
 	 	 		 pageBar += " &nbsp; <span style='cursor:pointer;' onclick='printGeneral("+pageNo+")'>"+pageNo+"</span> &nbsp"; 
 	    	 }*/
 	    	 
 	    	 if(pageNo == currentShowPageNo) {
 	    		pageBar += "<a class='active'>" + pageNo + "</a>";
             }
             else {
            	 pageBar += "<a href='javascript:printGeneral(\""+pageNo+"\")'>"+pageNo+"</a>";
             }           
 	    	
 	 		 loop ++;
 	         pageNo ++;	         
 	    }
 	    
 	    // [다음]
 	    if( !(pageNo > totalPage) ) {
 		
/*	 		 pageBar += " &nbsp; <span style='cursor:pointer;' onclick='printGeneral("+(pageNo+sizePerPage)+")'>다음</span> &nbsp"; 
*/	 		 pageBar += "<a class='arrow next' href='javascript:printGeneral(\""+pageNo+"\")'></a>";  
	 		 pageBar += "<a class='arrow nnext' href='javascript:printGeneral(\""+totalPage+"\")'></a>";  

 		}

		
		JSONArray jsonArr = new JSONArray(); 		
		
		if(hpList.size()>0) {
			for(HpInfoVO hpMapVO : hpList) {
				
				JSONObject jsonObj = new JSONObject();
			
				String hpSeq = hpMapVO.getHpSeq();
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();
				String hpdept = hpMapVO.getDept();
				
	            jsonObj.put("hpSeq", hpSeq);
	            jsonObj.put("hpName", hpName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            jsonObj.put("hpdept", hpdept);
	            jsonObj.put("pageBar", pageBar);
	            
	            jsonArr.put(jsonObj);	            
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
		
	}
	
	
	
	
		
		
//---------------------------------------------------------------------------------------------		
		
		// 약국찾기메뉴
		@RequestMapping(value = "/searchPharmacy.sd")
		public ModelAndView searchPharmacy(HttpServletRequest request, ModelAndView mav) {

			mav.setViewName("searchMenu/searchPharmacy.tiles1");

			return mav;
		}
		
		
		
		// 지도 약국
		@ResponseBody
		@RequestMapping(value = "/mapPharmacy.sd", produces="application/text;charset=utf-8")
		public String mapPharmacy(HttpServletRequest request) {

			List<PharmacyVO> phMap = null;
			
			phMap = service.searchPharmacySelect();
			
			JSONArray jsonArr = new JSONArray(); 
			
			
			if(phMap.size()>0) {
				for(PharmacyVO phMapVO : phMap) {
					JSONObject jsonObj = new JSONObject();
								
					int phSeq = phMapVO.getPharmSeq();
					String phName = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
		            double latitude = phMapVO.getLatitude();
		            double longitude = phMapVO.getLongitude();
		            String img = phMapVO.getMainImg();

		            jsonObj.put("phSeq", phSeq);
		            jsonObj.put("phName", phName);
		            jsonObj.put("address", address);
		            jsonObj.put("phone", phone);
		            jsonObj.put("latitude", latitude);
		            jsonObj.put("longitude", longitude);
		            jsonObj.put("img", img);
		            
		            jsonArr.put(jsonObj);				
					
				}
			}		
			
			String json = jsonArr.toString();

			return json;
		}
		

		
		// 지도 약국 리스트
		@ResponseBody
		@RequestMapping(value="/mapPharmacyList.sd", produces="text/plain;charset=UTF-8")
		public String mapPharmacyList(HttpServletRequest request, ModelAndView mav) {
			
			List<PharmacyVO> mapPhList = null;
			
			
			String city = request.getParameter("city");
			String county = request.getParameter("county");
			String district = request.getParameter("district");
			String searchWord = request.getParameter("searchWord");
			String currentPage = request.getParameter("currentPage");
			String latitudeHere = request.getParameter("latitudeHere");
			String longitudeHere = request.getParameter("longitudeHere");

			
			if (searchWord == null || searchWord.trim().isEmpty()) {
				searchWord = "";
			}
			if(latitudeHere==null) {
				latitudeHere = "37.56602747782394";
			}
			if(longitudeHere==null) {
				longitudeHere= "126.98265938959321";					
			}		
			
			
			HashMap<String, String> paraMap = new HashMap<>();
			paraMap.put("city", city);
			paraMap.put("county", county);
			paraMap.put("district", district);
			paraMap.put("searchWord", searchWord);
			paraMap.put("latitudeHere", latitudeHere);
			paraMap.put("longitudeHere", longitudeHere);

			int totalCount = 0;
			int sizePerPage = 10;
			int currentShowPageNo = Integer.parseInt(currentPage);
			int totalPage = 0;

			int startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
			int endRno = startRno + sizePerPage - 1;
		
			paraMap.put("startRno", String.valueOf(startRno));
			paraMap.put("endRno", String.valueOf(endRno));
			
			totalCount = service.getTotalCountMapPh(paraMap);
			totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
			
			
			try {
				
				currentShowPageNo = Integer.parseInt(currentPage);
				if(currentShowPageNo<1||currentShowPageNo>totalPage) {
					currentShowPageNo = 1;
					
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;

			}
			
			
			mapPhList = service.mapPharmacyListSearchWithPaging(paraMap);
			
			String pageBarM = "";	       
		    int blockSize = 5; 
		    int loop = 1;
		    
		    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
		    
		    
		    // [이전]
	 	 	if(pageNo != 1) {
	 	 		pageBarM += "<a class='arrow pprev' onclick='goSearch(1,"+latitudeHere+","+longitudeHere+")'></a>";
	 	 		pageBarM += "<a class='arrow prev' onclick='goSearch("+(pageNo-sizePerPage)+","+latitudeHere+","+longitudeHere+")'></a>";
	 	 	}
	 	    
	 	    while (!(loop > blockSize || pageNo > totalPage )) {
	 	        
	 	        if(pageNo == currentShowPageNo) {
	 	        	pageBarM += "<a class='active'>" + pageNo + "</a>";
	             }
	             else {
	            	 pageBarM += "<a href='javascript:goSearch("+pageNo+","+latitudeHere+","+longitudeHere+")'>"+pageNo+"</a>";
	             }      
	 	        
	 	 		 loop ++;
	 	         pageNo ++;	         
	 	    }
	 	    
	 	    // [다음]
	 	    if( !(pageNo > totalPage) ) {
	 	    	pageBarM += "<a class='arrow next' href='javascript:goSearch("+(pageNo+sizePerPage)+","+latitudeHere+","+longitudeHere+")'></a>";  
	 	    	pageBarM += "<a class='arrow nnext' href='javascript:goSearch("+totalPage+","+latitudeHere+","+longitudeHere+")></a>";  
	
	 		}

		
			JSONArray jsonArr = new JSONArray(); 		
			
			if(mapPhList.size()>0) {
				for(PharmacyVO phMapVO : mapPhList) {
					
					JSONObject jsonObj = new JSONObject();
				
					String phName = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
					String latitude = String.valueOf(phMapVO.getLatitude());
					String longitude = String.valueOf(phMapVO.getLongitude());
					String distance = phMapVO.getDistance();
					
		            jsonObj.put("phName", phName);
		            jsonObj.put("address", address);
		            jsonObj.put("phone", phone);
		            jsonObj.put("latitude", latitude);
		            jsonObj.put("longitude", longitude);
		            jsonObj.put("distance", distance);
		            jsonObj.put("pageBarM", pageBarM);
		            
		            jsonArr.put(jsonObj);	            
					
				}
			}		
			
			String json = jsonArr.toString();

			return json;
			
		}
	
		
		
		//약국 일반 리스트
		@ResponseBody
		@RequestMapping(value="/generalPharmacy.sd", produces="text/plain;charset=UTF-8")
		public String generalPharmacy(HttpServletRequest request, ModelAndView mav) {
			
			List<PharmacyVO> phList = null;
			
			String city = request.getParameter("city");
			String county = request.getParameter("county");
			String district = request.getParameter("district");
			String searchWord = request.getParameter("searchWord");
			String currentPage = request.getParameter("currentPage");

			if (searchWord == null || searchWord.trim().isEmpty()) {
				searchWord = "";
			}		
			
			HashMap<String, String> paraMap = new HashMap<>();
			paraMap.put("city", city);
			paraMap.put("county", county);
			paraMap.put("district", district);
			paraMap.put("searchWord", searchWord);

			int totalCount = 0;
			int sizePerPage = 10;
			int currentShowPageNo = Integer.parseInt(currentPage);
			int totalPage = 0;

			int startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
			int endRno = startRno + sizePerPage - 1;
		
			paraMap.put("startRno", String.valueOf(startRno));
			paraMap.put("endRno", String.valueOf(endRno));
			
			totalCount = service.getTotalCountPh(paraMap);
			totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
			
			
			try {
				
				currentShowPageNo = Integer.parseInt(currentPage);
				if(currentShowPageNo<1||currentShowPageNo>totalPage) {
					currentShowPageNo = 1;
					
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;

			}
			
			
			phList = service.pharmacyListSearchWithPaging(paraMap);
			
			String pageBar = "";	       
		    int blockSize = 10; 
		    int loop = 1;
		    
		    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
		    
		    // [이전]
	 	 	if(pageNo != 1) {
	 	 		pageBar += "<a class='arrow pprev' href='javascript:printGeneral(1)'></a>";
	 	 		pageBar += "<a class='arrow prev' href='javascript:printGeneral(\""+(pageNo-1)+"\")'></a>";
	 	 	}
	 	    
	 	    while (!(loop > blockSize || pageNo > totalPage )) {
	 	        
	 	    	 if(pageNo == currentShowPageNo) {
	 	    		pageBar += "<a class='active'>" + pageNo + "</a>";
	             }
	             else {
	            	 pageBar += "<a href='javascript:printGeneral(\""+pageNo+"\")'>"+pageNo+"</a>";
	             }           
	 	    	
	 	 		 loop ++;
	 	         pageNo ++;	         
	 	    }
	 	    
	 	    // [다음]
	 	    if( !(pageNo > totalPage) ) {	 		
		 		 pageBar += "<a class='arrow next' href='javascript:printGeneral(\""+pageNo+"\")'></a>";  
		 		 pageBar += "<a class='arrow nnext' href='javascript:printGeneral(\""+totalPage+"\")'></a>"; 
	 		}

			
			JSONArray jsonArr = new JSONArray(); 		
			
			if(phList.size()>0) {
				for(PharmacyVO phMapVO : phList) {
					
					JSONObject jsonObj = new JSONObject();
				
					String phSeq = String.valueOf(phMapVO.getPharmSeq());
					String phName = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
					
		            jsonObj.put("phSeq", phSeq);
		            jsonObj.put("phName", phName);
		            jsonObj.put("address", address);
		            jsonObj.put("phone", phone);
		            jsonObj.put("pageBar", pageBar);
		            
		            jsonArr.put(jsonObj);	            
					
				}
			}		
			
			String json = jsonArr.toString();

			return json;
			
		}
		
		
		

		
		
		
		
	
		
	/* >????
	
	@ResponseBody
	@RequestMapping(value = "/map.sd", produces="application/text;charset=utf-8")
	public String searchPharmacy(HttpServletRequest request) {

		List<HpInfoVO> hpMap = null;
		
		hpMap = service.searchHospitalSelect();
		
		JSONArray jsonArr = new JSONArray(); 
		
		if(hpMap.size()>0) {
			for(HpInfoVO hpMapVO : hpMap) {
				JSONObject jsonObj = new JSONObject();
							
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();
				
				System.out.println(hpName);
				System.out.println(address);

	            double latitude = hpMapVO.getLatitude();
	            double longitude = hpMapVO.getLongitude();

	            jsonObj.put("hpName", hpName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            jsonObj.put("latitude", latitude);
	            jsonObj.put("longitude", longitude);
	            
	            jsonArr.put(jsonObj);				
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
	}
	
	 * 
	 * 
	 * 
	 * */
	
	
	
	
	
	
	// 민간구급차 찾기
	@RequestMapping(value = "/searchAmbulance.sd")
	public ModelAndView searchAmbulance(ModelAndView mav) {

		mav.setViewName("searchMenu/searchAmbulance.tiles1");

		return mav;
	}
	
	
	/*
	@ResponseBody
	@RequestMapping(value = "/api/amList.sd", produces="application/text;charset=utf-8")
	public String getAmList(HttpServletRequest request) {
		
		String city = request.getParameter("city");
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		
		if(str_currentShowPageNo==null) {
			str_currentShowPageNo="1";
		}
				
		int totalCount = 0;
		int sizePerPage = 10;
		int currentShowPageNo = 0;
		int totalPage = 0;

				
		HashMap<String,String> result= service.getAmList(city);
		
		totalCount = Integer.parseInt(result.get("strTotalCount"));
		System.out.println("totalCount : "+totalCount);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		
		try {	
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
			}

		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
				
		String pageBar = "";	       
	    int blockSize = 10; 
	    int loop = 1;
	    
	    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
	    
	    // [이전]
 	 	if(pageNo != 1) {
 	 		pageBar += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+(pageNo-sizePerPage)+")'>이전</span> &nbsp"; 
 	 	}
 	    
 	    while (!(loop > blockSize || pageNo > totalPage )) {
 	         if(pageNo==currentShowPageNo){
 	        	pageBar += " &nbsp; <span style='color:#0080ff; padding:2px 4px;'>"+pageNo+"</span> &nbsp";
 	    	 }else {
 	    		pageBar += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+pageNo+")'>"+pageNo+"</span> &nbsp"; 
 	    	 }
 	    	
 	 		 loop ++;
 	         pageNo ++;	         
 	    }
 	    
 	    // [다음]
 	    if( !(pageNo > totalPage) ) {
 	    	pageBar += " &nbsp; <span style='cursor:pointer;' onclick='goSearch("+(pageNo+sizePerPage)+")'>다음</span> &nbsp"; 

 		}

	
		JSONArray jsonArr = new JSONArray(); 		
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("pageBar", totalCount);
		if(result.size()>0) {
			for(PharmacyVO phMapVO : result) {
				
				JSONObject jsonObj = new JSONObject();
			
				String phName = phMapVO.getName();
				String address = phMapVO.getAddress();
				String phone = phMapVO.getPhone();
				String latitude = String.valueOf(phMapVO.getLatitude());
				String longitude = String.valueOf(phMapVO.getLongitude());

				
	            jsonObj.put("phName", phName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            jsonObj.put("pageBar", pageBar);
	            
	            jsonArr.put(jsonObj);	            
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
	}
	
	*/
	
	
}
