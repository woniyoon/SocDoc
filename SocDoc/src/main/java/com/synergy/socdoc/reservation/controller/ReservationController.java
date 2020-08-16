package com.synergy.socdoc.reservation.controller;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.reservation.service.InterReserveService;

@Component
@Controller
public class ReservationController {

   
    @Autowired
      private InterReserveService service;
    
    
      // === 병원 List 보여주기 요청페이지 === // 
      @RequestMapping(value="/reserve.sd")
      public ModelAndView hpinfovoList(HttpServletRequest request,ModelAndView mav) {
       
      // 병원 진료과목 가져오기
            List<String> deptIdList = service.deptIdList();
            
            String sDeptIdes = request.getParameter("sDeptIdes");
            // sDeptIdes ==> "-9999,50,110"
            // sDeptIdes ==> ""
            // sDeptIdes ==> "30,80,90,110"
            
            
            HashMap<String, Object> paraMap = new HashMap<>();
            
            if(sDeptIdes !=null && !"".equals(sDeptIdes)) {
               String[] deptIdArr = sDeptIdes.split(",");
               paraMap.put("deptIdArr", deptIdArr);
               
               mav.addObject("sDeptIdes", sDeptIdes);
               // 뷰단에서 검색 버튼 클릭시 체크되어진 값을 유지시키기 위한 것이다.
               
            }
            
            HttpSession session = request.getSession();
               
               
               MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
                  if(loginuser != null) {
                  String userid = loginuser.getUserid();
               
                  mav.addObject("userid",userid);
                  MemberVO membervo = service.viewMyinfo(userid);
                  mav.addObject("membervo", membervo);
                  }
                  

            
            // employees 테이블에서 조건에 만족하는 사원들을 가져오기
             List<HashMap<String,String>> hpinfovoList  = service.hpinfovoList(paraMap);
            
            mav.addObject("deptIdList", deptIdList);
            mav.addObject("hpinfovoList", hpinfovoList);
            mav.setViewName("Reservation/reservation.tiles1");
            
            return mav;
         }
        

     
      
      // === 예약자명 정보 보여주기 요청페이지 === // 
      
      
      
      
      // === 예약완료 페이지 요청 === // 
      @RequestMapping(value="/reserve_result.sd")
      public String reserve_result() {
         return "Reservation/reservation_result.tiles1";
      }
}