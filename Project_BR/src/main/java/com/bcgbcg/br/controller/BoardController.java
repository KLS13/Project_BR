package com.bcgbcg.br.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.bcgbcg.br.command.BoardCommand;
import com.bcgbcg.br.command.BoardQueryCommand;
import com.bcgbcg.br.command.BookChartCommand;
import com.bcgbcg.br.command.BookChartListCommand;
import com.bcgbcg.br.command.BooksByGradeCommand;
import com.bcgbcg.br.command.BooksByNumOfReviewCommand;
import com.bcgbcg.br.command.ReviewAllListCommand;
import com.bcgbcg.br.command.ReviewDeleteCommand;
import com.bcgbcg.br.command.ReviewListCommand;
import com.bcgbcg.br.command.ReviewModifyCommand;
import com.bcgbcg.br.command.ReviewWriteCommand;
import com.bcgbcg.br.command.SearchViewBookCommand;




@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	private BookChartCommand bookChartCommand;


	@RequestMapping("home")
	public String home(Model model) {
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
	
		boardCommand = new BooksByNumOfReviewCommand();
		boardCommand.execute(sqlSession, model);
		
		bookChartCommand = new BookChartListCommand();
		bookChartCommand.execute(sqlSession, model);
		
		return "home";
	}
    @RequestMapping("searchPage")
	public String searchPage() {
	    return "book/searchPage";
	}
	@RequestMapping("viewBook")
	public String viewBook(HttpServletRequest request, Model model){
		    model.addAttribute("request", request);
		    boardCommand = new ReviewListCommand();
		    boardCommand.execute(sqlSession, model);
	        return "book/viewBook";
	  }
	@RequestMapping("searchViewBook")
	public String searchViewBook(HttpServletRequest request, Model model){
		    model.addAttribute("request", request);
		    boardCommand = new SearchViewBookCommand();
		    boardCommand.execute(sqlSession, model);
		    boardCommand = new ReviewListCommand();
		    boardCommand.execute(sqlSession, model);
	        return "book/viewBook";
	  }
	@RequestMapping("writeReviewPage")
	public String reviewWritePage() { 
		return "book/writeReviewPage";
	}
	
	@RequestMapping("reviewModifyPage")
	public String reviewModifyPage() { 
		return "book/reviewModifyPage";
	}

	@RequestMapping("reviewWrite")
	public String reviewWrite(RedirectAttributes rda, HttpServletRequest request, Model model){
		    model.addAttribute("request", request);
		    model.addAttribute("rda", rda);
		    boardCommand = new ReviewWriteCommand();
		    boardCommand.execute(sqlSession, model);
		    boardCommand = new ReviewListCommand();
		    boardCommand.execute(sqlSession, model);
		    return "book/viewBook";
	  }	
	
	@RequestMapping("reviewModify")
	public String reviewModify(RedirectAttributes rda, HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 model.addAttribute("rda", rda);
		 boardCommand = new ReviewModifyCommand();
		 boardCommand.execute(sqlSession, model);
		 boardCommand = new ReviewListCommand();
		 boardCommand.execute(sqlSession, model);
		 return "book/viewBook";
	}
	@RequestMapping("reviewDelete")
	public String reviewDelete(RedirectAttributes rda, HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rda",rda);
		boardCommand = new ReviewDeleteCommand();
		boardCommand.execute(sqlSession, model);
		boardCommand = new ReviewListCommand();
	    boardCommand.execute(sqlSession, model);
		return "book/viewBook";
	}
	@RequestMapping("reviewPage")
	public String reviewPage(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		boardCommand = new ReviewAllListCommand();
		boardCommand.execute(sqlSession, model);
		return "book/reviewPage";
	}
	@RequestMapping("recommPage")
	public String recommPage(Model model) {
		boardCommand = new BooksByGradeCommand();
		boardCommand.execute(sqlSession, model);
		return "book/recommPage";
	}
	@RequestMapping("dynamicQuery")
	public String dynamicQuery(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		boardCommand = new BoardQueryCommand();
		boardCommand.execute(sqlSession, model);
		return "book/dynamicReviewPage";
	}

	@RequestMapping("bookChart")
	public String BookChart(Model model) {
		bookChartCommand = new BookChartListCommand();
		bookChartCommand.execute(sqlSession, model);
		
		return "home";
	}

	
	
}
