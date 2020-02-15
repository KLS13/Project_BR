package com.bcgbcg.br.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcgbcg.br.command.CommentCommand;
import com.bcgbcg.br.command.CommentModifyCommand;
import com.bcgbcg.br.command.CommentViewCommand;
import com.bcgbcg.br.command.CommentWriteCommand;
import com.bcgbcg.br.command.QnaCheckUpdate;
import com.bcgbcg.br.command.QnaCommand;
import com.bcgbcg.br.command.QnaDeleteCommand;
import com.bcgbcg.br.command.QnaListCommand;
import com.bcgbcg.br.command.QnaModifyCommand;
import com.bcgbcg.br.command.QnaMyListCommand;
import com.bcgbcg.br.command.QnaViewCommand;
import com.bcgbcg.br.command.QnaWriteCommand;

@Controller
public class QnaController {

	@Autowired
	private SqlSession sqlSession; 
	private QnaCommand qnaCommand;
	private CommentCommand commentCommand;
	
	
	@RequestMapping("qnaWritePage")
	public String qnaWritePage() {
		return "qna/qnaWrite";
	}
	
	
	@RequestMapping("qnaModifyPage")
	public String qnaModifyPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		qnaCommand = new QnaViewCommand();
		qnaCommand.execute(sqlSession, model);
		return "qna/qnaModify";
	}
	
	@RequestMapping(value="qnaModify", method = RequestMethod.POST)
	public String qnaModify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		qnaCommand = new QnaModifyCommand();
		qnaCommand.execute(sqlSession, model);
		return "redirect:/qnaListPage";
	}
	
	@RequestMapping("qnaDelete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		qnaCommand = new QnaDeleteCommand();
		qnaCommand.execute(sqlSession, model);
		return "redirect:/qnaListPage";
	}
	
	@RequestMapping("qnaListPage")
	public String qnaList(HttpServletRequest request, Model model) { 
		model.addAttribute("request", request);
		qnaCommand = new QnaListCommand();
		qnaCommand.execute(sqlSession, model);
		
 		return "qna/qnaList";
	}
	
	@RequestMapping(value="qnaWrite", method = RequestMethod.POST)
	public String qnaWrite(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		qnaCommand = new QnaWriteCommand();
		qnaCommand.execute(sqlSession, model);		
		return "redirect:/qnaListPage";
	}
	
	@RequestMapping("qnaViewPage") 
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		qnaCommand = new QnaViewCommand();
		commentCommand = new CommentViewCommand();
		qnaCommand.execute(sqlSession, model);
		commentCommand.execute(sqlSession, model);
		return "qna/qnaView";
	}
	
	@RequestMapping(value="commentWrite", method = RequestMethod.POST)
	public String commentWrite(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		commentCommand = new CommentWriteCommand();
		qnaCommand = new QnaCheckUpdate();
		commentCommand.execute(sqlSession, model);
		qnaCommand.execute(sqlSession, model);
		
		return "redirect:/qnaListPage";
	}

	
	@RequestMapping("qnaMyList")
	public String QnaMyList(HttpServletRequest request, Model model) { 
		model.addAttribute("request", request);
		qnaCommand = new QnaMyListCommand();
		qnaCommand.execute(sqlSession, model);
		
 		return "qna/qnaList";
	}
	@RequestMapping("commentModifyPage")
	public String CommentModifyPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		commentCommand = new CommentViewCommand();
		commentCommand.execute(sqlSession, model);
		return "qna/qnaCommentModify";
	}
	
	@RequestMapping(value="commentModify",method = RequestMethod.POST)
	public String CommentModify(HttpServletRequest request, Model model) { 
		model.addAttribute("request", request);
		commentCommand = new CommentModifyCommand();
		commentCommand.execute(sqlSession, model);
		
		return "redirect:/qnaListPage";
	}
}