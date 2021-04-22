package com.example.demo.category.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.category.service.CategoryService;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/categoryList",method=RequestMethod.GET)
	public String categoryList(@RequestParam("cateCode") String cateCode,Model model,HttpSession session) {
		
		System.out.println("카테고리 코드 번호 : " + cateCode);
		List<CvideoJoinVideoFileDto> categoryList = categoryService.getCategoryList(cateCode);
		
		for(int i=0;i<categoryList.size();i++) {
			System.out.println("제목 : " + categoryList.get(i).getVideo_title());
		}//clear 
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryListSize", categoryList.size());
		model.addAttribute("cateCode", cateCode);
		
		UserDto user = (UserDto)session.getAttribute("User");
		model.addAttribute("UserSession",user);
		
		return "Category/categoryList";
	}
	
	// 동영상 게시물 상세 페이지 이동
	@RequestMapping(value = "/categoryDetail",method = RequestMethod.GET)
	public String categoryDetail(@RequestParam("n") int video_number,@RequestParam(value = "blameRe",defaultValue = "no") String blameRe,@RequestParam(value = "result",defaultValue = "-1") int result,Model model,HttpSession session) {
		
		System.out.println(blameRe);
		System.out.println(result);
		// 동영상 게시물 번호에 해당하는 정보 가져오기 
		VideoJoinVideoFileDto videoDetail = mypageService.getVideoDetail(video_number);
		model.addAttribute("videoDetail",videoDetail);
		
		UserDto user = (UserDto)session.getAttribute("User");
		model.addAttribute("UserSession",user);
		model.addAttribute("blameRe",blameRe);
		model.addAttribute("result",result);
		
		return "Category/categoryDetail";
	}
	
	// 동영상 게시물 신고 처리 
	@RequestMapping(value = "/report",method = RequestMethod.POST)
	public String categoryReport(BlameDto blameDto,HttpSession session,Model model,RedirectAttributes redirectAttributes) {
		
		String blameRe = "신고제출에 실패하였습니다.. 다시 신고해주세요!";
		UserDto user = (UserDto)session.getAttribute("User");
		blameDto.setUser_id(user.getUser_id());
		
		int result = categoryService.reportInsert(blameDto);
		if(result == 1) {
			categoryService.videoReportUpdate(blameDto.getVideo_number()); // 신고수 1 증가 
			blameRe = "신고내용이 정상적으로 접수되었습니다!";
		}
		
		redirectAttributes.addAttribute("n",blameDto.getVideo_number());
		redirectAttributes.addAttribute("blameRe",blameRe);
		redirectAttributes.addAttribute("result",result);
		
		return "redirect:/categoryDetail";
	}
	
	
}























