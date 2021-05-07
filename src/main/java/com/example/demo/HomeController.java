package com.example.demo;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.api.NaverSearch;

@Controller
public class HomeController {
	
	@Resource(name="NaverSearch")
	private NaverSearch naverSearch;
	
	@RequestMapping("/")
	public String home(Model model) {
		Map<String,Object> sportsList = naverSearch.sportsSearch("축구");
		Map<String,Object> it = naverSearch.itSearch("IT");
		Map<String,Object> economyList = naverSearch.economySearch("경제");
		Map<String,Object> foreignList = naverSearch.foreignSearch("foreign");
		
		model.addAttribute("sportsList",sportsList);
		model.addAttribute("it",it);
		model.addAttribute("economyList",economyList);
		model.addAttribute("foreignList",foreignList);
		
		return "index";
	}
}
