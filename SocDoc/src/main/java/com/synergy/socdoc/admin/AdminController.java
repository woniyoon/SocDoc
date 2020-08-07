package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;


@Component
@Controller
public class AdminController {

	@Autowired
	private InterAdminService service;

	/* 회원관리 */ 
	@RequestMapping(value = "/adminMemberMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminMemberMng(HttpServletRequest request) {
		
		HashMap<String, List<MemberVO>> map = service.selectMemberList();
		request.setAttribute("membervoList", map.get("membervoList"));
		
		return "admin/adminMemberMng.tiles3";
		
	}
	

	/* 병원회원관리 */	
	@RequestMapping(value = "/adminHospitalMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminHospitalMng(HttpServletRequest request) {
		
		return "admin/adminHospitalMng.tiles3";
	}
	
	/* 병원등록 */
	@RequestMapping(value = "/hospitalInfo.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String hospitalInfo(HttpServletRequest request) {
		
		return "admin/hospitalInfo.tiles3";
	}
	
	/* 공지사항관리 */
	@RequestMapping(value = "/adminNoticeMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String adminNoticeMng(HttpServletRequest request) {
		
		HashMap<String, List<NoticeVO>> map = service.selectNoticeList();
		request.setAttribute("noticevoList", map.get("noticevoList"));
		
		return "admin/adminNoticeMng.tiles3";
	}
	
	/* 공지사항 글보기 */
	@RequestMapping(value = "/noticeView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView noticeView(HttpServletRequest request, ModelAndView mav) {
		
		String noticeSeq = request.getParameter("noticeSeq");
		
		System.out.println("공지사항 seq 잘오나? : " + noticeSeq);
		
		String gobackURL = request.getParameter("gobackURL");
		mav.addObject("gobackURL", gobackURL);

		NoticeVO noticevo = null;

		noticevo = service.getView(noticeSeq);
		
		mav.addObject("noticevo", noticevo);
		mav.setViewName("admin/noticeView.tiles3");
		
		return mav;
	}
	
	/* 공지사항 글쓰기 */
	@RequestMapping(value = "/noticeWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String noticeWrite(HttpServletRequest request) {
		
		return "admin/noticeWrite.tiles3";
	}
	
	/* 건강정보관리 */
	@RequestMapping(value = "/healthInfoMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthInfoMng(HttpServletRequest request) {
		
		HashMap<String, List<HealthInfoVO>> map = service.selectHealthInfoList();
		request.setAttribute("healthvoList", map.get("healthvoList"));
		
		return "admin/healthInfoMng.tiles3";
	}

	/* 건강정보 글보기 */
	@RequestMapping(value = "/healthView.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthView(HttpServletRequest request) {
		
		return "admin/healthView.tiles3";
	}

	/* 건강정보 글쓰기 */
	@RequestMapping(value = "/healthWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String healthWrite(HttpServletRequest request) {
		
		return "admin/healthWrite.tiles3";
	}
	
	/* 후기관리 */
	@RequestMapping(value = "/reviewMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String reviewMng(HttpServletRequest request) {
		
		return "admin/reviewMng.tiles3";
	}
	
	/* 문의관리 */
	@RequestMapping(value = "/qnaMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String qnaMng(HttpServletRequest request) {
		HashMap<String, List<QnaBoardVO>> map = service.selectQnAList();
		request.setAttribute("qnavoList", map.get("qnavoList"));
		
		return "admin/qnaMng.tiles3";
	}
	
	/* 문의관리 답변쓰기 */
	@RequestMapping(value = "/qnaAnswer.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String qnaAnswer(HttpServletRequest request) {
		
		return "admin/qnaAnswer.tiles3";
	}
	
	/* FAQ관리 */
	@RequestMapping(value = "/faqMng.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String faqMng(HttpServletRequest request) {
		
		return "admin/faqMng.tiles3";
	}
	
	/* FAQ 글쓰기 */
	@RequestMapping(value = "/faqWrite.sd", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String faqWrite(HttpServletRequest request) {
		
		return "admin/faqWrite.tiles3";
	}
	
	
}
