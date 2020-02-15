package com.bcgbcg.br.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.util.Paging;

public class AdminReviewListCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int nowPage = 1;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		model.addAttribute("currentPage", nowPage);
		
		int recordPerPage = 10;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		ArrayList<ReviewDto> list = dao.selectReviewList(begin, end);
		model.addAttribute("list", list);
		int totalRecord = dao.selectReviewListCount();
		
		String pagingView = Paging.getPaging("reviewList", nowPage, recordPerPage, totalRecord);
		HttpSession session = request.getSession();
		session.removeAttribute("search");
		model.addAttribute("pagingView", pagingView);
	}

}
