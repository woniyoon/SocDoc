package com.synergy.socdoc.searchMenu.ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
		
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String district = request.getParameter("district");
		String dept = request.getParameter("dept");
		String searchWord = request.getParameter("searchWord");
		
		if(city==null) {
			city="";
		}
		if(county==null) {
			county="";
		}
		if(district==null) {
			district="";
		}
		if(dept==null) {
			dept="";
		}
		if(searchWord==null) {
			searchWord="";
		}
		
		System.out.println("dlkfjadfkj : "+city);
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("county", county);
		paraMap.put("district", district);
		paraMap.put("dept", dept);
		paraMap.put("searchWord", searchWord);
		
		
		hpMap = service.searchHospitalSelect(paraMap);
		
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
 	 		pageBarM += "<a class='arrow pprev' onclick='goSearch(1,"+latitudeHere+","+longitudeHere+")'></a>";
 	 		pageBarM += "<a class='arrow prev' onclick='goSearch("+(pageNo-1)+","+latitudeHere+","+longitudeHere+")'></a>";
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
 	    	pageBarM += "<a class='arrow next' href='javascript:goSearch("+(pageNo)+","+latitudeHere+","+longitudeHere+")'></a>";  
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
		public ModelAndView searchPharmacy(ModelAndView mav) {

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
								
					int pharmSeq = phMapVO.getPharmSeq();
					String name = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
		            double latitude = phMapVO.getLatitude();
		            double longitude = phMapVO.getLongitude();
		            String img = phMapVO.getMainImg();

		            jsonObj.put("pharmSeq", pharmSeq);
		            jsonObj.put("name", name);
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
				
					String pharmSeq = String.valueOf(phMapVO.getPharmSeq());
					String name = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
					String latitude = String.valueOf(phMapVO.getLatitude());
					String longitude = String.valueOf(phMapVO.getLongitude());
					String distance = phMapVO.getDistance();
					
		            jsonObj.put("pharmSeq", pharmSeq);
		            jsonObj.put("name", name);
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
				
					String pharmSeq = String.valueOf(phMapVO.getPharmSeq());
					String name = phMapVO.getName();
					String address = phMapVO.getAddress();
					String phone = phMapVO.getPhone();
					
		            jsonObj.put("pharmSeq", pharmSeq);
		            jsonObj.put("name", name);
		            jsonObj.put("address", address);
		            jsonObj.put("phone", phone);
		            jsonObj.put("pageBar", pageBar);
		            
		            jsonArr.put(jsonObj);	            
					
				}
			}		
			
			String json = jsonArr.toString();

			return json;
			
		}
		
	
		
		
		
		
//------------------------------------------------------------------------------------
		
		
		// 민간구급차 찾기
		@RequestMapping(value = "/searchAmbulance.sd")
		public ModelAndView searchAmbulance(HttpServletRequest request, ModelAndView mav) {
			
			mav.setViewName("searchMenu/searchAmbulance.tiles1");		
			return mav;	
			
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/api/amList.sd", produces="application/text;charset=utf-8")
		public String getAmList(HttpServletRequest request) {
			
			String city = request.getParameter("city");
			
			if(city==null) {
				city="";
			}
			
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			
			if(currentShowPageNo==null) {
				currentShowPageNo="1";
			}
			
			int currentShowPageNoInt = Integer.parseInt(currentShowPageNo);
			
			int sizePerPage = 10;
			int totalPage = 0;
			
			HashMap<String, String> paraMap = new HashMap<>();
			paraMap.put("city", city);
			paraMap.put("currentShowPageNo", currentShowPageNo);
			paraMap.put("sizePerPage", String.valueOf(sizePerPage));
	
			HashMap<String,String> amList = service.getAmList(paraMap);
	
			
			totalPage = (int) Math.ceil((double) Integer.parseInt(amList.get("totalCount")) / sizePerPage);
			
			
			String pageBar = "";	       
		    int blockSize = 10; 
		    int loop = 1;
		    
		    int pageNo = ((currentShowPageNoInt - 1)/blockSize) * blockSize + 1;	//1~10 
		    
		    // [이전]
	 	 	if(pageNo != 1) {
	 	 		pageBar += "<a class='arrow pprev' onclick='showAmList(1)'></a>"; 
	 	 		pageBar += "<a class='arrow prev' onclick='showAmList("+(pageNo-1)+")'></a>";  	 		 	 		
	 	 	}
	 	    
	 	    while (!(loop > blockSize || pageNo > totalPage )) {
	 	         if(pageNo==currentShowPageNoInt){
	 	        	pageBar += "<a class='active'>"+pageNo+"</a>";
	 	    	 }else {
	 	    		pageBar += "<a onclick='showAmList("+pageNo+")'>"+pageNo+"</a>"; 
	 	    	 }
	 	    	
	 	 		 loop ++;
	 	         pageNo ++;	         
	 	    }
	 	    
	 	    // [다음]
	 	    if( !(pageNo > totalPage) ) {
	 	    	pageBar += "<a class='arrow next' onclick='showAmList("+(pageNo)+")'></a>"; 
		 		pageBar += "<a class='arrow nnext' onclick='showAmList("+totalPage+")'></a>"; 
	 		}
			
	 	    JsonObject json = new JsonObject();
	
	 	    json.addProperty("strResult", amList.get("strResult"));
	 	    json.addProperty("pageBar", pageBar);
	 	    
			return json.toString();
			
		}
		
		
		
		// Excel 파일 다운
		@RequestMapping(value="/api/downloadExcelAmbulance.sd", method={RequestMethod.POST})
		public String downloadExcelFile(HttpServletRequest request, Model model) {
			
			String city = request.getParameter("city");
			
			// 부서를 선택한 경우
			if(city!=null && "".equals(city)) {
				city="";
			}
			
			HashMap<String, String> paraMap = new HashMap<>();
			paraMap.put("city", city);
			
			List<HashMap<String,String>> amList = service.getAmListExcel(city);
			
			
			SXSSFWorkbook workbook = new SXSSFWorkbook();
	        
	        SXSSFSheet sheet = workbook.createSheet("민간구급차 다운로드");
	        
	        sheet.setColumnWidth(0, 400);
	        sheet.setColumnWidth(1, 12000);
	        sheet.setColumnWidth(2, 10000);
	        
	        // 행의 위치를 나타내는 변수
	        int rowLocation = 0;
	       
	        CellStyle mergeRowStyle = workbook.createCellStyle();
	        mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
	        mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	        
	        CellStyle headerStyle = workbook.createCellStyle();
	        headerStyle.setAlignment(HorizontalAlignment.CENTER);
	        headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);

	        
	        mergeRowStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); 
	        mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	        
	        
	        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());  
	        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	      
	        Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
	        mergeRowFont.setFontName("나눔고딕");
	        mergeRowFont.setFontHeight((short)500);
	        mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
	        mergeRowFont.setBold(true);
	                
	        mergeRowStyle.setFont(mergeRowFont); 
	        
	        headerStyle.setBorderTop(BorderStyle.THICK);
	        headerStyle.setBorderBottom(BorderStyle.THICK);
	        headerStyle.setBorderLeft(BorderStyle.THIN);
	        headerStyle.setBorderRight(BorderStyle.THIN);
	        
	        
	        Row mergeRow = sheet.createRow(rowLocation);  // 엑셀에서 행의 시작은 0 부터 시작한다.
	                
	        for(int i=0; i<2; i++) {
	            Cell cell = mergeRow.createCell(i);
	            cell.setCellStyle(mergeRowStyle);
	            cell.setCellValue("민간구급차 엑셀 다운로드");
	        }
	        
	        sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 3)); // 시작 행, 끝 행, 시작 열, 끝 열 
	        
	        CellStyle moneyStyle = workbook.createCellStyle();
	        moneyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	        
	        // 헤더 행 생성
	        Row headerRow = sheet.createRow(++rowLocation);  
	        
	        // 해당 행의 첫번째 열 셀 생성
	        Cell headerCell = headerRow.createCell(0); 
	        headerCell.setCellValue("주소");
	        headerCell.setCellStyle(headerStyle);
	        
	        // 해당 행의 두번째 열 셀 생성
	        headerCell = headerRow.createCell(1);
	        headerCell.setCellValue("기관명");
	        headerCell.setCellStyle(headerStyle);
	        
	        // 해당 행의 세번째 열 셀 생성
	        headerCell = headerRow.createCell(2);
	        headerCell.setCellValue("차량번호");
	        headerCell.setCellStyle(headerStyle);
	        
	        
	      
	        // HR사원정보 내용에 해당하는 행 및 셀 생성하기 
	        Row bodyRow = null;
	        Cell bodyCell = null;
	        
	        for(int i=0; i<amList.size(); i++) {
	        	HashMap<String,String> amMap = amList.get(i);
	            
	            // 행 생성
	            bodyRow = sheet.createRow(i + (rowLocation+1) );
	            
	            bodyCell = bodyRow.createCell(0);
	            bodyCell.setCellValue(amMap.get("carSeq"));
	                        
	            bodyCell = bodyRow.createCell(1);
	            bodyCell.setCellValue(amMap.get("dutyAddr"));
	            
	            bodyCell = bodyRow.createCell(2);
	            bodyCell.setCellValue(amMap.get("dutyName"));
	            
	       
	        }
	        
	        model.addAttribute("locale", Locale.KOREA);
	        model.addAttribute("workbook", workbook);
	        model.addAttribute("workbookName", "민간구급차 엑셀 다운로드");
			
			return "excelDownloadView";
			
		}
		
	
	
	
}
