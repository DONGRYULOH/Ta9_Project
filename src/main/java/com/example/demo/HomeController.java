package com.example.demo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.api.NaverSearch;
import com.example.demo.api.NewsCategory;

@Controller
public class HomeController {
	
	@Resource(name="NaverSearch")
	private NaverSearch naverSearch;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		NewsCategory newsCategory = new NewsCategory();
		List<Map<String,Object>> newsList = new ArrayList<Map<String,Object>>();
		
		for(int i=0;i<newsCategory.getNewsList().size();i++) {
			newsList.add(naverSearch.Search(newsCategory.getNewsList().get(i)));
		}
			
		model.addAttribute("allList",newsList);
		model.addAttribute("allListSize",newsList.size());
		
		return "index";
	}
}
