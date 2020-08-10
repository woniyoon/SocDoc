package com.synergy.socdoc.searchMenu.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.json.XML;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.synergy.socdoc.member.HpInfoVO;

@Repository
public class SearchMenuDAO implements InterSearchMenuDAO {

	@Autowired	
	private SqlSessionTemplate sqlsession;
		
	@Override
	public List<HpInfoVO> searchHospitalSelect() {
		List<HpInfoVO> hpMap = sqlsession.selectList("searchMenu.hpMapSelect");
		return hpMap;
	}
		
	
	private String apiKey = "s9xg9Bp9ErcnSizOyrS0DSPvXB%2B1rKUHXQLztWL6s3RshEh5dVwOutBsMoRcIUcTjHXGPFB%2F%2B2%2FoU1rkIYi8gA%3D%3D";

	
	//민간 구급차 API
	@Override
	public String getAmList(String city) {
		String amList = "";
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/AmblInfoInqireService/getAmblListInfoInqire"); /* URL */

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + apiKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
	//		urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));  //검색할 주소 범위의 시작 
			
			if(!"".equals(city)) {
				urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));
			}
			
			URL url = new URL(urlBuilder.toString());
			
			System.out.println("URL : " + url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");

			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			rd.close();
			conn.disconnect();
			System.out.println("result in DAO class : "+sb.toString());
			amList = sb.toString();
			
			
			JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());	
			System.out.println("xmlJSONObj : " + xmlJSONObj);
			amList = xmlJSONObj.toString();
			System.out.println("xmlJSONObjString : " + amList);
			 
			JsonParser parser = new JsonParser();
			JsonElement el= parser.parse(amList);
			JsonObject body = el.getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body");
			JsonArray result = body.getAsJsonObject("items").getAsJsonArray("item");
			
			return result.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = sqlsession.selectList("searchMenu.hospitalListSearchWithPaging",paraMap);
		return hpList;
	}


	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("searchMenu.getTotalCount",paraMap);
		return totalCount;
	}

}
