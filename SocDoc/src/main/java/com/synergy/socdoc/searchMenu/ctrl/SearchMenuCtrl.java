package com.synergy.socdoc.searchMenu.ctrl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.searchMenu.service.InterSearchMenuService;


@Component
@Controller
public class SearchMenuCtrl {

	
	@Autowired
	private InterSearchMenuService service;
		
	
	// 병원찾기
	@RequestMapping(value = "/searchHospital.sd")
	public ModelAndView searchHospital(HttpServletRequest request, ModelAndView mav) {

		mav.setViewName("searchMenu/searchHospital.tiles1");

		return mav;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/map.sd", produces="application/text;charset=utf-8")
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
	
	
	// 약국찾기
	@RequestMapping(value = "/searchPharmacy.sd")
	public ModelAndView searchPharmacy(ModelAndView mav) {

		mav.setViewName("searchMenu/searchPharmacy.tiles1");

		return mav;
	}
	
	
	// 민간구급차
	@RequestMapping(value = "/searchAmbulance.sd")
	public ModelAndView searchAmbulance(ModelAndView mav) {

		mav.setViewName("searchMenu/searchAmbulance.tiles1");

		return mav;
	}
	
	
}
