package com.example.demo.category.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.category.dto.VideoReplyDto;
import com.example.demo.category.service.CategoryService;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;
import com.example.demo.utils.PageMaker;
import com.example.demo.utils.Pagination;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/categoryList",method=RequestMethod.GET)
	public String categoryList(@RequestParam("cateCode") String cateCode,@RequestParam(value = "sort",defaultValue = "no") String sort,Model model,Pagination page,HttpSession session) {
				
		UserDto user = (UserDto)session.getAttribute("User");	
		
		// 페이지를 만들기 위한 PageMaker 객체 생성 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(page);
		pageMaker.setTotalCount(categoryService.totalCount(cateCode)); // 해당 카테고리의 총 동영상 게시글 수
		
		List<CvideoJoinVideoFileDto> categoryList = categoryService.getCategoryList(cateCode,page,sort);
					
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryListSize", categoryList.size());
		model.addAttribute("cateCode", cateCode);
		model.addAttribute("pageMaker", pageMaker);		
		model.addAttribute("UserSession",user);
		model.addAttribute("Sort",sort);
		
		return "Category/categoryList";
	}
	
	// 동영상 게시물 상세 페이지 이동
	@RequestMapping(value = "/categoryDetail",method = RequestMethod.GET)
	public String categoryDetail(@RequestParam("n") int video_number,@RequestParam(value = "blameRe",defaultValue = "no") String blameRe,@RequestParam(value = "result",defaultValue = "-1") int result,Model model,HttpSession session) {

		// 동영상 게시물 번호에 해당하는 정보 가져오기 
		VideoJoinVideoFileDto videoDetail = mypageService.getVideoDetail(video_number);
					
		UserDto user = (UserDto)session.getAttribute("User");
		
		model.addAttribute("videoDetail",videoDetail);	
		model.addAttribute("UserSession",user);
		model.addAttribute("blameRe",blameRe);
		model.addAttribute("result",result);							
		
		return  "Category/categoryDetail";
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
	
	
	// *********************************** <댓글 AJAX> START ***********************************************
	
	// 댓글 작성  AJAX
	@ResponseBody
	@RequestMapping(value="replyInsert", method=RequestMethod.POST)
	public void replyInsert(VideoReplyDto videoReplyDto,HttpSession session){
		
		//현재세션에 저장되어있는 유저닉네임 가져오기 
		UserDto user = (UserDto)session.getAttribute("User");		
		videoReplyDto.setReply_register(user.getUser_nickname());
		int result = categoryService.replyInsert(videoReplyDto);
		System.out.println("댓글 작성 결과값:" + result);
		
	}
	
	// 댓글 리스트  AJAX
	@ResponseBody
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public List<VideoReplyDto> replyList(@RequestParam("n") int video_number){
		
		return categoryService.getReplyList(video_number);
							
	}
	
	// 댓글 수정  AJAX
	@ResponseBody
	@RequestMapping(value="replyUpdate", method=RequestMethod.POST)
	public int replyUpdate(VideoReplyDto videoReplyDto){
		
		return categoryService.replyUpdate(videoReplyDto);
		
	}
	
	// 댓글 수정  AJAX
	@ResponseBody
	@RequestMapping(value="replyDelete", method=RequestMethod.POST)
	public int replyDelete(VideoReplyDto videoReplyDto){
		
		return categoryService.replyDelete(videoReplyDto);
		
	}
	
	
}























