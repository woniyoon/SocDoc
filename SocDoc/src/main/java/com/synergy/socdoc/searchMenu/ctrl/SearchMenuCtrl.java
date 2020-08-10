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
public class SearchMenuCtrl {

	
	@Autowired
	private InterSearchMenuService service;
		
	
	// 병원찾기 지도
	@RequestMapping(value = "/searchHospital.sd")
	public ModelAndView searchHospital(HttpServletRequest request, ModelAndView mav) {

		mav.setViewName("searchMenu/searchHospital.tiles1");

		return mav;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/mapHospital.sd", produces="application/text;charset=utf-8")
	public String searchHospital(HttpServletRequest request) {

		List<HpInfoVO> hpMap = null;
		
		hpMap = service.searchHospitalSelect();
		
		JSONArray jsonArr = new JSONArray(); 
		
		if(hpMap.size()>0) {
			for(HpInfoVO hpMapVO : hpMap) {
				JSONObject jsonObj = new JSONObject();
							
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();

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
	
	@RequestMapping(value="/generalHospital.sd", produces="application.text;charset=utf-8")
	public String generalHospital(HttpServletRequest request, ModelAndView mav) {
		
		List<HpInfoVO> hpList = null;
		
		String searchType = request.getParameter(searchType);
		String searchWord = request.getParameter(searchWord);
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		
		if(str_currentShowPageNo==null) {
			str_currentShowPageNo="1";
		}
		
		
		HashMap<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);

		int totalCount = 0;
		int sizePerPage = 10;
		int currentShowPageNo = 0;
		int totalPage = 0;

		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.getTotalCountHp(paraMap);
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		try {
			
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
				
			}

		} catch (NumberFormatException e) {
			currentShowPageNo = 1;

		}
		
		
		startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		hpList = service.hospitalListSearchWithPaging(paraMap);
		mav.addObject("paraMap",paraMap);
		
		String pageBar = "<ul style='list-style: none;'>";	       
	    int blockSize = 10; 
	    int loop = 1;
	    
	    int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;	
	    
	    String url = "generalHospital.action";

	    
	    // [이전]
 	 	if(pageNo != 1) {
 	 		pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
 	 				+ "<a href='"+url+"?searchType="+searchType+"&searchType="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";			
 	 	}
 	    
 	    while (!(loop > blockSize || pageNo > totalPage )) {
 	         
 	         pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 	         
 	         loop ++;
 	         pageNo ++;	         
 	    }
 	    
 	    // [다음]
 	    if( !(pageNo > totalPage) ) {
 			pageBar += "<li style='display:inline-block; width:50px; font-size: 12pt;'>"
 					+ "<a href='"+url+"?searchType="+searchType+"&searchType="+searchWord+"&currentShowPageNo="+(pageNo)+"'>[다음]</a></li>";
 		}

 	      
 	    pageBar += "</ul>";
  
		
		JSONArray jsonArr = new JSONArray(); 
		
		if(hpList.size()>0) {
			for(HpInfoVO hpMapVO : hpList) {
				JSONObject jsonObj = new JSONObject();
							
				String hpName = hpMapVO.getHpName();
				String address = hpMapVO.getAddress();
				String phone = hpMapVO.getPhone();


	            jsonObj.put("hpName", hpName);
	            jsonObj.put("address", address);
	            jsonObj.put("phone", phone);
	            
	            jsonArr.put(jsonObj);				
				
			}
		}		
		
		String json = jsonArr.toString();

		return json;
		
	}
	
	
	// 약국찾기
	@RequestMapping(value = "/searchPharmacy.sd")
	public ModelAndView searchPharmacy(ModelAndView mav) {

		mav.setViewName("searchMenu/searchPharmacy.tiles1");

		return mav;
	}
	
	
	
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
	
	
	
	
	
	
	
	
	
	// 민간구급차 찾기
	@RequestMapping(value = "/searchAmbulance.sd")
	public ModelAndView searchAmbulance(ModelAndView mav) {

		mav.setViewName("searchMenu/searchAmbulance.tiles1");

		return mav;
	}
	
	
	
	
	

	
	
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

		int startRno = 0;
		int endRno = 0;
		

	//	String result= service.getAmList();
		
	//	totalCount = service.getAmList(city).length();
		String result= service.getAmList(city);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		
		try {	
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) {
				currentShowPageNo = 1;
			}

		} catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		/*paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		*/
		
		
		return result;
	}
	
	
	
	
}
