package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

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

@Component
@Controller
public class ReviewMenuCtrl {
	
	
	@Autowired
	private InterReviewMenuService service;
	
	
	@RequestMapping(value = "/reviewMenu.sd")
	public ModelAndView searchMenu(ModelAndView mav) {

		mav.setViewName("reviewMenu/reviewMenu.tiles1");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/readReview.sd", produces = "text/plain;charset=UTF-8")
	public String readReview(HttpServletRequest request) {
		
		String city = request.getParameter("city");
		String dept = request.getParameter("dept");

		String currentShowPageNo = request.getParameter("currentShowPageNo");
		int sizePerPage = 6;
		int startRno = (((Integer.parseInt(currentShowPageNo)-1)* sizePerPage)) + 1;
		int endRno = startRno+sizePerPage-1;
		
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("dept", dept);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));	
		
		List<HpInfoVO> hpList = service.getHpList(paraMap);
		
		JSONArray jsonArr = new JSONArray();

		if (hpList != null) {
			for (HpInfoVO hpVO : hpList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("hpSeq", hpVO.getHpSeq());
				jsonObj.put("hpName", hpVO.getHpName());
				jsonObj.put("mainImg", hpVO.getMainImg());
				
				jsonArr.put(jsonObj);
			}
		}

		return jsonArr.toString();

	}

}
