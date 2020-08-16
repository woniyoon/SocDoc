package com.synergy.socdoc.detail.ctrl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.detail.service.InterDetailService;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;

@Component
@Controller
public class DetailCtrl {
	
	
	@Autowired
	private InterDetailService service;
	
	
	// 병원 상세 페이지
	@RequestMapping(value = "/hospitalDetail.sd")
	public ModelAndView hospitalDetail(HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String hpSeq = request.getParameter("hpSeq");

		String userid = "";
		boolean isBookmark = false;

		if (loginuser != null) {
			//북마크 유무
			userid = loginuser.getUserid();
			/*String isSelect = service.isBookmark();
			if(isSelect!=null) {
				isBookmark=true;
			}*/
		}		
		
		//잠시만
		if(hpSeq == null) {
			hpSeq="2";
		}
		
		
		HpInfoVO hpDetail = service.hospitalDetail(hpSeq);
		String hospitalRating = service.hospitalRating(hpSeq);
		
		mav.addObject("hospitalRating",hospitalRating);
		mav.addObject("hpDetail",hpDetail);
		mav.setViewName("detail/hospitalDetail.tiles1");

		return mav;
	}
	
	
	// 리뷰 내거 읽기
	@ResponseBody
	@RequestMapping(value="/getHpReviewMe.sd", produces = "text/plain;charset=UTF-8")
	public String getHpReviewMe(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String hpSeq = request.getParameter("hpSeq");

		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("loginuserId", loginuser.getUserid());	
		
		HpReviewVO reviewMe = service.getHpReviewMe(paraMap);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("userid",reviewMe.getUserid());
		jsonObj.put("content",reviewMe.getContent());
		jsonObj.put("regDate",reviewMe.getRegDate());
		jsonObj.put("reviewRating",reviewMe.getRating());

		String jsonStr = jsonObj.toString();

		return jsonStr;
	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getHpReview.sd", produces = "text/plain;charset=UTF-8")
	public String getHpReview(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String hpSeq = request.getParameter("hpSeq");
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		
		if(currentShowPageNo==null) {
			currentShowPageNo = "1";			
		}
		
		int sizePerPage = 5;
		int startRno = (((Integer.parseInt(currentShowPageNo)-1)* sizePerPage)) + 1;
		int endRno = startRno+sizePerPage-1;

		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("hpSeq", hpSeq);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));		
		if(loginuser!=null) {
			paraMap.put("loginuserId", loginuser.getUserid());
		}
		
		List<HpReviewVO> reviewList = service.getHpReview(paraMap);

		JSONArray jsonArr = new JSONArray();

		if (reviewList != null) {
			for (HpReviewVO hpRVO : reviewList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("hpSeq", hpRVO.getHpSeq());
				jsonObj.put("userid", hpRVO.getUserid());
				jsonObj.put("content", hpRVO.getContent());
				jsonObj.put("regDate", hpRVO.getRegDate());
				jsonObj.put("reviewRating", hpRVO.getRating());
				
				jsonArr.put(jsonObj);
			}
		}

		return jsonArr.toString();
	}
	
	
	// 리뷰 페이지바
	@ResponseBody
	@RequestMapping(value="/getReviewTotalPage.sd")
	public String reviewPageBar(HttpServletRequest request) {
		String hpSeq = request.getParameter("hpSeq");
		String sizePerPage = request.getParameter("sizePerPage");
		
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("hpSeq", hpSeq);
		
		int totalCount = service.getReivewTotalCount(paraMap);
		
		// 총 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / Integer.parseInt(sizePerPage));
				
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalPage", totalPage);
		
		return jsonObj.toString();
		
	}
		
		
		
	
	
	

	
	// 약국 상세 페이지
	@RequestMapping(value = "/pharmacyDetail.sd")
	public ModelAndView pharmacyDetail(ModelAndView mav) {

		mav.setViewName("detail/pharmacyDetail.tiles1");

		return mav;
	}

}
