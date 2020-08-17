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
import com.synergy.socdoc.member.HpReviewVO;

@Component
@Controller
public class ReviewMenuController {
	
	
	@Autowired
	private InterReviewMenuService service;
	
	
	@RequestMapping(value = "/reviewMenu.sd")
	public ModelAndView searchMenu(ModelAndView mav) {

		mav.setViewName("reviewMenu/reviewMenu.tiles1");

		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/readReviewMenu.sd", produces = "text/plain;charset=UTF-8")
	public String readReviewMenu(HttpServletRequest request) {
		
		String city = request.getParameter("city");
		String dept = request.getParameter("dept");
		String currentShowPage = request.getParameter("currentShowPage");
		
		System.out.println("currentShowPage : "+currentShowPage);
		
		int sizePerPage = 6;
		int startRno = (((Integer.parseInt(currentShowPage)-1)* sizePerPage)) + 1;
		int endRno = startRno+sizePerPage-1;
		
		System.out.println("startRno : "+startRno);
		System.out.println("endRno : "+endRno);

		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("dept", dept);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));	
		
		System.out.println("city : "+city);

		
		List<HpInfoVO> hpList = service.getHpList(paraMap);
				
		System.out.println(hpList.size());
		JSONArray jsonArr = new JSONArray();

		if (hpList != null) {
			for (HpInfoVO hpVO : hpList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("hpSeq", hpVO.getHpSeq());
				jsonObj.put("hpName", hpVO.getHpName());
				jsonObj.put("mainImg", hpVO.getMainImg());
				jsonObj.put("avg", hpVO.getAvg());
				
				jsonArr.put(jsonObj);
			}
		}

		return jsonArr.toString();

	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getReviewMenuTotalPage.sd")
	public String reviewMenuPageBar(HttpServletRequest request) {

		String sizePerPage = request.getParameter("sizePerPage");
		String city = request.getParameter("city");
		String dept = request.getParameter("dept");
		
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("city", city);
		paraMap.put("dept", dept);
		
		System.out.println("city : "+city);
		System.out.println("dept : "+dept);
		
		int totalCount = service.getReviewMenuTotalPage(paraMap);
		
		// 총 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / Integer.parseInt(sizePerPage));
		
		System.out.println("totalPage : "+totalPage);
				
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalPage", totalPage);
		
		return jsonObj.toString();
		
	}
	

	@ResponseBody
	@RequestMapping(value="/readReviewDetail.sd", produces = "text/plain;charset=UTF-8")
	public String readReviewDetail(HttpServletRequest request) {
		
		String hpSeq = request.getParameter("hpSeq");
		
		System.out.println("hpseq : "+ hpSeq);

		List<HpReviewVO> reviewList = service.readReviewDetail(hpSeq);		
		
		JSONArray jsonArr = new JSONArray();
		
		System.out.println("reviewList : "+reviewList.size());

		if (reviewList.size() != 0) {
			for (HpReviewVO reviewVO : reviewList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("hpSeq", reviewVO.getHpSeq());
				jsonObj.put("content", reviewVO.getContent());
				jsonObj.put("rating", reviewVO.getRating());
				
				jsonArr.put(jsonObj);
			}
		}else {
			
		}

		return jsonArr.toString();
		
	}
	
	
	

}
