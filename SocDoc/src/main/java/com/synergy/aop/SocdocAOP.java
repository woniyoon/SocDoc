package com.synergy.aop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.synergy.socdoc.common.MyUtil;
import com.synergy.socdoc.member.HpMemberVO;

@Aspect
@Component 
public class SocdocAOP {

	   @Pointcut("execution(public * com.synergy..*Controller.requiredLogin_*(..) )")
	   public void requiredLogin() {
	   } 

	   // == Before Advice(공통관심사, 보조업무)를 구현한다.
	   @Before("requiredLogin()") // (pointcut)메소드가 작동하기 전에 코딩되어지는 메소드를 수행해라
	   public void loginChk(JoinPoint joinPoint) { // 로그인 유무 검사 메소드 작성하기

	      // 첫번째 파라미터는 HttpServletRequest이므로 리턴타입이 object니 캐스팅해준다
	      HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0]; 
	      HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
	      
		  System.out.println("controller의 메소드가 실행되기 전, HpMemAOP에서 정의한 메소드가 실행됩니다.");
		  System.out.println("현재 servletContext : " + request.getServletContext());

		  HttpSession session = request.getSession();
		  HpMemberVO hpMember = (HpMemberVO) session.getAttribute("loginuser");
		  
		  String msg = "로그인이 필요한 페이지입니다!";
		  String loc = "";
		  
		  if (hpMember == null) {

			  loc = request.getContextPath() + "/login.sd";
			  request.setAttribute("msg", msg);
			  request.setAttribute("loc", loc);

			  // === 현재 페이지의 주소(URL)알아오기 ===
			  String url = MyUtil.getCurrentURL(request);
			
			
			  if (url.endsWith("?null")) {
				  url = url.substring(0, url.indexOf("?")); // 처음부터 ?앞까지
			  }

			  System.out.println(url);
			  session.setAttribute("gobackURL", url); // 세션에 url정보를 저장시켜 둔다.
			
			  RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			
			  try {
				  dispatcher.forward(request, response);
			  } catch (ServletException | IOException e) {
				  e.printStackTrace();
			  }

		  }
	      
	   }
	   
	   
	   @Pointcut("execution(public * com.synergy..*Controller.requiredLoginHp_*(..) )")
	   public void requiredLoginHp() {
	   } 
	   
	   @Before("requiredLoginHp()")
	   public void loginChkHp(JoinPoint joinPoint) {
		   
		   HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0]; 
		   HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		   
		   System.out.println("controller의 메소드가 실행되기 전, HpMemAOP에서 정의한 메소드가 실행됩니다.");
		   System.out.println("현재 servletContext : " + request.getServletContext());
		   
		   HttpSession session = request.getSession();
		   HpMemberVO hpMember = (HpMemberVO) session.getAttribute("loginuser");
		   
		   String msg = "로그인이 필요한 페이지입니다!";
		   String loc = "";
		   
		   if (hpMember == null) {
			   
			   loc = request.getContextPath() + "/login.sd";
			   request.setAttribute("msg", msg);
			   request.setAttribute("loc", loc);
			   
			   String url = MyUtil.getCurrentURL(request);
			   
			   if (url.endsWith("?null")) {
				   url = url.substring(0, url.indexOf("?"));
			   }
			   
			   System.out.println(url);
			   session.setAttribute("gobackURL", url);
			   
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			   
			   try {
				   dispatcher.forward(request, response);
			   } catch (ServletException | IOException e) {
				   e.printStackTrace();
			   }
			   
		   }
	   }
	   
}
