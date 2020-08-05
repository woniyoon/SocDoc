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

@Aspect
@Component 
public class HpMemAOP {

	   @Pointcut("execution(public * com.synergy..*Controller.test_*(..) )")
	   public void test() {
	   } 

	   // == Before Advice(공통관심사, 보조업무)를 구현한다.
	   @Before("test()") // (pointcut)메소드가 작동하기 전에 코딩되어지는 메소드를 수행해라
	   public void loginChk(JoinPoint joinPoint) { // 로그인 유무 검사 메소드 작성하기

	      // 첫번째 파라미터는 HttpServletRequest이므로 리턴타입이 object니 캐스팅해준다
	      HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0]; 
	      
		  System.out.println("controller의 메소드가 실행되기 전, HpMemAOP에서 정의한 메소드가 실행됩니다.");
		  System.out.println("현재 servletContext : " + request.getServletContext());

	      
	   }
}
