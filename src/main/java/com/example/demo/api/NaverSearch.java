package com.example.demo.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component("NaverSearch")
public class NaverSearch {
	
	// 스포츠 관련 기사 
	public Map<String,Object> sportsSearch(String sports) {
			
			String text = null; 
			try { 
				text = URLEncoder.encode(sports, "UTF-8"); 
			} catch (UnsupportedEncodingException e) { 
				throw new RuntimeException("검색어 인코딩 실패",e); 
			}

			String APIURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=1";
			
			// 요청시 헤더안에 들어갈 값들 
			Map<String,String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", "Buba7Va8EIK5l9t5iVy4"); 
			requestHeaders.put("X-Naver-Client-Secret", "AF0T5EMn71");
			
			// 스포츠 관련 기사 요청 
			Map<String,Object> sportList = new HashMap<String,Object>();
			String responseBody = get(APIURL,requestHeaders);
	
			JSONObject jsonObj = new JSONObject(responseBody);
			
			JSONArray Array = (JSONArray) jsonObj.get("items");
			
			for(int i=0;i<Array.length();i++) {
				JSONObject item = (JSONObject)Array.get(i);
				sportList.put("link", (String) item.get("originallink"));
				sportList.put("title", (String) item.get("title"));
				sportList.put("pubDate", (String) item.get("pubDate"));
				sportList.put("description", (String) item.get("description"));			
			}					
			
			return sportList;
	 }
	
	// 개발(IT)관련 기사 
	public Map<String,Object> itSearch(String IT) {
		
		String text = null; 
		try { 
			text = URLEncoder.encode(IT, "UTF-8"); 
		} catch (UnsupportedEncodingException e) { 
			throw new RuntimeException("검색어 인코딩 실패",e); 
		}
		
		String APIURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=1";				
		
		// 요청시 헤더안에 들어갈 값들 
		Map<String,String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", "Buba7Va8EIK5l9t5iVy4"); 
		requestHeaders.put("X-Naver-Client-Secret", "AF0T5EMn71");
		
		// 스포츠 관련 기사 요청 
		Map<String,Object> itList = new HashMap<String,Object>();
		String responseBody = get(APIURL,requestHeaders);

		JSONObject jsonObj = new JSONObject(responseBody);
		
		JSONArray Array = (JSONArray) jsonObj.get("items");
		
		for(int i=0;i<Array.length();i++) {
			JSONObject item = (JSONObject)Array.get(i);
			itList.put("link", (String) item.get("originallink"));
			itList.put("title", (String) item.get("title"));
			itList.put("pubDate", (String) item.get("pubDate"));
			itList.put("description", (String) item.get("description"));			
		}					
		
		return itList;
	}

		// 경제 관련 기사 
		public Map<String,Object> economySearch(String economy) {
			
			String text = null; 
			try { 
				text = URLEncoder.encode(economy, "UTF-8"); 
			} catch (UnsupportedEncodingException e) { 
				throw new RuntimeException("검색어 인코딩 실패",e); 
			}
			
			String APIURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&display=1";				
			
			// 요청시 헤더안에 들어갈 값들 
			Map<String,String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", "Buba7Va8EIK5l9t5iVy4"); 
			requestHeaders.put("X-Naver-Client-Secret", "AF0T5EMn71");
			
			// 경제 관련 기사 요청 
			Map<String,Object> economyList = new HashMap<String,Object>();
			String responseBody = get(APIURL,requestHeaders);

			JSONObject jsonObj = new JSONObject(responseBody);
			
			JSONArray Array = (JSONArray) jsonObj.get("items");
			
			for(int i=0;i<Array.length();i++) {
				JSONObject item = (JSONObject)Array.get(i);
				economyList.put("link", (String) item.get("originallink"));
				economyList.put("title", (String) item.get("title"));
				economyList.put("pubDate", (String) item.get("pubDate"));
				economyList.put("description", (String) item.get("description"));			
			}					
			
			return economyList;
		}
	
    // 외국 관련 기사
	public Map<String,Object> foreignSearch(String foreign) {
		
		String APIURL = "https://openapi.naver.com/v1/search/news.json?query=" + foreign + "&display=1";			
		
		// 요청시 헤더안에 들어갈 값들 
		Map<String,String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", "Buba7Va8EIK5l9t5iVy4"); 
		requestHeaders.put("X-Naver-Client-Secret", "AF0T5EMn71");
		
		// 외국 관련 기사 요청 
		Map<String,Object> foreignList = new HashMap<String,Object>();
		String responseBody = get(APIURL,requestHeaders);

		JSONObject jsonObj = new JSONObject(responseBody);
		
		JSONArray Array = (JSONArray) jsonObj.get("items");
		
		for(int i=0;i<Array.length();i++) {
			JSONObject item = (JSONObject)Array.get(i);
			foreignList.put("link", (String) item.get("originallink"));
			foreignList.put("title", (String) item.get("title"));
			foreignList.put("pubDate", (String) item.get("pubDate"));
			foreignList.put("description", (String) item.get("description"));			
		}					
		
		return foreignList;
	}
	
	private String get(String APIURL,Map<String,String> requestHeaders) {
		HttpURLConnection con = connect(APIURL);
		try { 
			con.setRequestMethod("GET"); 
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue()); 
			} 			
			int responseCode = con.getResponseCode(); 
			
			// 1.정상 호출 
			if (responseCode == HttpURLConnection.HTTP_OK) { 
				return readBody(con.getInputStream());	
			}else{ // 2.에러 발생
				return readBody(con.getErrorStream()); 
			} 			
		}catch(IOException e){ 
			throw new RuntimeException("API 요청과 응답 실패", e); 
		} 
		finally { 
			// 연결 해제후 자원 반납 
			con.disconnect(); 
		}
			
	}
	
	private HttpURLConnection connect(String APIURL) {
		try {
			URL url = new URL(APIURL);
			return (HttpURLConnection)url.openConnection();
		}catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다! : " + APIURL , e);
		}catch (IOException e) {
			throw new RuntimeException("연결 중 실패...: " + APIURL , e);
		}
	}
	
	private static String readBody(InputStream body){ 
		InputStreamReader streamReader = new InputStreamReader(body); 
		try (BufferedReader lineReader = new BufferedReader(streamReader)) { 
			StringBuilder responseBody = new StringBuilder(); 
			String line; 
			while ((line = lineReader.readLine()) != null) { 
				responseBody.append(line); 
			} 
			return responseBody.toString(); 
		}catch (IOException e){ 
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e); 
		}
	}


}





































