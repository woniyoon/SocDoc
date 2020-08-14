package com.synergy.socdoc.detail.ctrl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.detail.service.InterDetailService;
import com.synergy.socdoc.member.HpInfoVO;
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
			hpSeq="6";
		}
		
		
		HpInfoVO hpDetail = service.hospitalDetail(hpSeq);
		
		System.out.println(hpDetail.getHpName());
		System.out.println(hpDetail.getMainImg());
		
		mav.addObject("hpDetail",hpDetail);
		mav.setViewName("detail/hospitalDetail.tiles1");

		return mav;
	}

	
	// 약국 상세 페이지
	@RequestMapping(value = "/pharmacyDetail.sd")
	public ModelAndView pharmacyDetail(ModelAndView mav) {

		mav.setViewName("detail/pharmacyDetail.tiles1");

		return mav;
	}

}
