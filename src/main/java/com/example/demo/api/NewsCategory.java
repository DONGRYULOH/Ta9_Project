package com.example.demo.api;

import java.util.ArrayList;
import java.util.List;

public class NewsCategory {

	// 뉴스 기사가 들어갈 리스트 
	private List<String> newsList;
	
	// NewsCategory 객체가 생성될때 뉴스기사 키워드를 넣어줌 
	public NewsCategory(){
		newsList = new ArrayList<String>();
		newsList.add("오늘날씨");
		newsList.add("비트코인");
		newsList.add("코로나 바이러스 19");
		newsList.add("ESG");
		newsList.add("미국");
	}
	
	public List<String> getNewsList() {
		return newsList;
	}

}
