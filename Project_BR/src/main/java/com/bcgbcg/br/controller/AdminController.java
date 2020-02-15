package com.bcgbcg.br.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.command.AdminCommand;
import com.bcgbcg.br.command.AdminReviewListCommand;
import com.bcgbcg.br.command.HomeReviewRecordChartCommand;
import com.bcgbcg.br.command.MemberDetailCommand;
import com.bcgbcg.br.command.MemberListCommand;
import com.bcgbcg.br.command.MemberModifyByAdminCommand;
import com.bcgbcg.br.command.MemberModifyStateCommand;
import com.bcgbcg.br.command.ModifyInvoiceNoCommand;
import com.bcgbcg.br.command.PurchaseDetailCommand;
import com.bcgbcg.br.command.PurchaseListCommand;
import com.bcgbcg.br.command.ReviewDetailCommand;
import com.bcgbcg.br.command.ReviewRemoveCommand;
import com.bcgbcg.br.command.SearchMemberCommand;
import com.bcgbcg.br.command.SearchPurchaseCommand;
import com.bcgbcg.br.command.SearchReviewCommand;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	private AdminCommand command;
	
	@RequestMapping("adminHome")
	public String goAdminHome(Model model) {
		command = new HomeReviewRecordChartCommand();
		command.execute(sqlSession, model);
		return "admin/adminHome";
	}
	
	@RequestMapping("memberList")
	public String viewMemberList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new MemberListCommand();
		command.execute(sqlSession, model);
		return "admin/memberList";
	}
	
	@RequestMapping("memberDetail")
	public String viewMemberDetamil(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new MemberDetailCommand();
		command.execute(sqlSession, model);
		return "admin/memberDetail";
	}
	@RequestMapping(value="modifyMemberByAdmin", method = RequestMethod.POST)
	public String MemberModifyByAdmin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new MemberModifyByAdminCommand();
		command.execute(sqlSession, model);
		return "redirect:/memberList";
	}
	@RequestMapping(value="modifyMemberState")
	public String modifyMemberToStop(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		command = new MemberModifyStateCommand();
		command.execute(sqlSession, model);
		return "redirect:/memberStateResult";
	}
	@RequestMapping("memberStateResult")
	public String memberStateResult() {
		return "admin/memberStateResult";
	}
	@RequestMapping(value="searchMember")
	public String searchMember(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SearchMemberCommand();
		command.execute(sqlSession, model);
		return "admin/memberList";
	}
	
	@RequestMapping("reviewList")
	public String viewReviewList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new AdminReviewListCommand();
		command.execute(sqlSession, model);
		return "admin/reviewList";
	}
	
	@RequestMapping("reviewDetail")
	public String viewReviewDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new ReviewDetailCommand();
		command.execute(sqlSession, model);
		return "admin/reviewDetail";
	}
	
	@RequestMapping("removeReview")
	public String removeReview(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		command = new ReviewRemoveCommand();
		command.execute(sqlSession, model);
		return "redirect:/reviewList";
	}
	
	@RequestMapping("purchaseList")
	public String viewPurchaseList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new PurchaseListCommand();
		command.execute(sqlSession, model);
		return "admin/purchaseList";
	}
	@RequestMapping("purchaseDetail")
	public String viewPurchaseDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new PurchaseDetailCommand();
		command.execute(sqlSession, model);
		return "admin/purchaseDetail";
	}
	@RequestMapping("setInvoiceNo")
	public String modifyInvoiceNo(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new ModifyInvoiceNoCommand();
		command.execute(sqlSession, model);
		return "redirect:/purchaseDetail";
	}
	
	@RequestMapping("searchReview")
	public String searchReviewList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SearchReviewCommand();
		command.execute(sqlSession, model);
		return "admin/reviewList";
	}
	
	@RequestMapping("searchPurchase")
	public String searchPurchaseList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SearchPurchaseCommand();
		command.execute(sqlSession, model);
		return "admin/purchaseList";
	}
}
