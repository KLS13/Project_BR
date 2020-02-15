package com.bcgbcg.br.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.util.Paging;

public class ReviewAllListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String currentPage = request.getParameter("currentPage");
		
		int nowPage = 1;
		
		if(currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		
		model.addAttribute("currentPage", nowPage);
		
		int recordPerPage = 10;
		int begin = (nowPage -1 ) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
	    ArrayList<ReviewDto> list = bDao.getAllReviewList(begin, end);
	    int result = bDao.getNumberOfReview().size();
		model.addAttribute("list", list);
		model.addAttribute("result", result);
		
		int totalRecord = bDao.getTotalReview();
		String pagingView = Paging.getPaging("reviewPage", nowPage, recordPerPage, totalRecord);
		model.addAttribute("pagingView", pagingView);

	}

}
