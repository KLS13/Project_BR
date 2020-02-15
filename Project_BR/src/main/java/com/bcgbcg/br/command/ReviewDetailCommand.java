package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.BookDto;
import com.bcgbcg.br.dto.ReviewDto;

public class ReviewDetailCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int rIdx = Integer.parseInt(request.getParameter("rIdx"));
		String currentPage = request.getParameter("currentPage");
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		ReviewDto rDto = dao.selectReviewDetailInReview_t(rIdx);
		BookDto bDto = dao.selectReviewDetailInBook_t(rDto.getbISBN());
		
		model.addAttribute("rDto", rDto);
		model.addAttribute("bDto", bDto);
		model.addAttribute("currentPage", currentPage);
	}

}
