package com.synergy.socdoc.common;

import java.lang.reflect.Array;
import java.util.*;

import javax.servlet.http.*;

public class MyUtil {

	  public static String replaceParameter(String param) {
	      String result = param;
	      
	      if(param != null) {
	         result = result.replaceAll("<", "&lt;");
	         result = result.replaceAll(">", "&gt;");
//	         result = result.replaceAll("&", "&amp;");
//	         result = result.replaceAll("\"", "&quot;");
	      }

	      return result;
	   }
	  
	  
	  public static String getCurrentURL(HttpServletRequest request) {
			
		  	String currentURL = request.getRequestURL().toString();
			String queryString = request.getQueryString();
			String ctxPath = request.getContextPath();
			
			currentURL += "?" + queryString;	// http://localhost:9090/MyMVC/shop/prodView.up?pnum=1
			int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
			
			String goBackURL = currentURL.substring(beginIndex + 1); // 28번째부터 끝까지 shop/prodView.up?pnum=3

			return goBackURL;
	  }
	  
	  
	  public static String getBaseURL(HttpServletRequest request) {
		  	String currentURL = request.getRequestURL().toString();
			String ctxPath = request.getContextPath();

		  	int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
			String baseUrl = currentURL.substring(beginIndex + 1);

			
			System.out.println("MyUtil 안에 있는 baseUrl : " + baseUrl);
		  	return baseUrl;
	  }
	  
	  public static String createPageBar(int currentShowPageNo, int totalPage, String baseLink) {
		 	String pageBar = "";

			// 페이지에서 보여지는 첫번째 페이지 번호
			int pageNo = 1;
			// 블럭당 보여지는 페이지 번호의 갯수
			int blockSize = 10;
			// 1부터 증가해 1개 블럭을 이루는 페이지 번호의 갯수(10개)까지만 증가하는 용도
			int loop = 1;
					
			pageNo = ((currentShowPageNo-1)/blockSize) * blockSize + 1;
			
			if(pageNo != 1) {
			  pageBar += "&nbsp;<a href='"+baseLink+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a>&nbsp;";		  		  
			}
			
			while(!(loop > blockSize || pageNo > totalPage)) {
				  
				if(pageNo == currentShowPageNo) {
					pageBar += "&nbsp;<a class='active'>" + pageNo + "</a>&nbsp;";			  
				} else {			  
					pageBar += "&nbsp;<a href='"+baseLink+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a>&nbsp;";
				}

				pageNo++;
				loop++;
			}
			
			if(!(pageNo > totalPage)) {
			  pageBar += "&nbsp;<a href='"+baseLink+"?currentShowPageNo="+pageNo+"'>[다음]</a>&nbsp;";		  
			}		
			
		 return pageBar;
	 }
	  
	  // MyBatis에서 파라미터로 들어온 값이 비어있는지 확인
		public static Boolean empty(Object obj) {
			if (obj instanceof String) {
				return obj == null || "".equals(obj.toString().trim());
			} else if (obj instanceof List) {
				return obj == null || ((List<?>) obj).isEmpty();				
			} else if (obj instanceof Map) {
				return obj == null || ((Map<?, ?>) obj).isEmpty();				
			} else if (obj instanceof Object[]) {
				return obj == null || Array.getLength(obj) == 0;				
			} else {
				return obj == null;
			}
		}

		public static Boolean notEmpty(Object obj) {
			return !empty(obj);
		}

}
