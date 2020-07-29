package com.socdoc.common;

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
			
			currentURL += "?" + queryString;	//http://localhost:9090/MyMVC/shop/prodView.up?pnum=1
			int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
			
			String goBackURL = currentURL.substring(beginIndex + 1); //28번째부터 끝까지 shop/prodView.up?pnum=3

			return goBackURL;
	  }
}
