package com.bcgbcg.br.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcgbcg.br.command.MyPurchaseCommand;
import com.bcgbcg.br.command.MyPurchaseDetailCommand;
import com.bcgbcg.br.command.MyPurchaseListCommand;
import com.bcgbcg.br.command.MyReviewCommand;
import com.bcgbcg.br.command.MyReviewDetailCommand;
import com.bcgbcg.br.command.MyReviewListCommand;
import com.bcgbcg.br.command.MyReviewRemoveCommand;
import com.bcgbcg.br.command.MyUserCommand;
import com.bcgbcg.br.command.MyUserDeleteCommand;
import com.bcgbcg.br.command.MyUserInformationCommand;
import com.bcgbcg.br.command.MyUserModifyCommand;
import com.bcgbcg.br.command.SearchMyPurchaseCommand;
import com.bcgbcg.br.command.SearchMyReviewCommand;


@Controller
public class MyPageController {

	// field
	@Autowired
	private SqlSession sqlSession;
	private MyUserCommand userCommand;
	private MyReviewCommand reviewCommand;
	private MyPurchaseCommand purchaseCommand;

	
	// Method
	

	
	
	
		
		// 단순 이동
		@RequestMapping("myCheckPw")
		public String checkPw() {
			return "my/checkPwPage";
		}
		
		@RequestMapping("myModifyPage")
		public String goModify() {
			return "my/myModifyPage";
		}
		
		 
		// 마이페이지 
		@RequestMapping("myPage")
		public String MyPage() {
			return "my/MyPage";
		}
		// 회원탈퇴 확인
		@RequestMapping("myAgree")
		public String Agree() {
			return "my/MyAgree";
		}
		// 내 정보
		@RequestMapping("myInformation")
		public String view(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			userCommand = new MyUserInformationCommand();
			userCommand.execute(sqlSession, model);
			return "my/MyInformation";
		}
		
		// 회원 수정
		@RequestMapping("myModify")
		public String modify(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			userCommand = new MyUserModifyCommand();
			userCommand.execute(sqlSession, model);
			return "redirect:/home";
		}
		
		// 리뷰전체
		@RequestMapping("myReviewList")
		public String viewReviewList(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			reviewCommand = new MyReviewListCommand();
			reviewCommand.execute(sqlSession, model);
			return "my/MyReviewList";
		}
		// 리뷰 상세
		@RequestMapping("myReviewDetail")
		public String viewReviewDetail(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			reviewCommand = new MyReviewDetailCommand();
			reviewCommand.execute(sqlSession, model);
			return "my/MyReviewDetail";
		}
		// 리뷰 삭제
		@RequestMapping("myRemoveReview")
		public String removeReview(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			reviewCommand = new MyReviewRemoveCommand();
			reviewCommand.execute(sqlSession, model);
			return "redirect:/MyReviewList";
		}
		// 리뷰 검색
		@RequestMapping("mySearchReview")
		public String searchReviewList(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			reviewCommand = new SearchMyReviewCommand();
			reviewCommand.execute(sqlSession, model);
			return "my/MyReviewSearchList";
		}
		
		// 교환물품
		@RequestMapping("myPurchaseList")
		public String purchasList(HttpServletRequest request , Model model) {
			model.addAttribute("request",request);
			purchaseCommand = new MyPurchaseListCommand();
			purchaseCommand.execute(sqlSession, model);
			return "my/MyPurchaseList";
	}		
		// 교환물품 상세보기
		@RequestMapping("myPurchaseDetail")
		public String purchasDetail(HttpServletRequest request , Model model) {
			model.addAttribute("request",request);
			purchaseCommand = new MyPurchaseDetailCommand();
			purchaseCommand.execute(sqlSession, model);
			return "my/MyPurchaseDetail";
		}
		// 검색
		@RequestMapping("mySearchPurchase")
		public String searchPurchaseList(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			purchaseCommand = new SearchMyPurchaseCommand();
			purchaseCommand.execute(sqlSession, model);
			return "my/MyPurchaseSearchList";
		}
		
		// 회원 탈퇴
		@RequestMapping("myDelete")
		public String delete(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			userCommand = new MyUserDeleteCommand();
			userCommand.execute(sqlSession, model);
			return "home";
		}
	}
