package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.util.Paging2;

public class SearchReviewCommand implements AdminCommand {

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
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		HttpSession session = request.getSession();
		if(key.isEmpty() && value.isEmpty()) {
			key = (String) session.getAttribute("key");
			value = (String) session.getAttribute("value");
		}
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int totalRecord = 0;
		if(key.equals("RDATE")) {
			List<ReviewDto> list = dao.searchReviewByDate(value, begin, end);
			totalRecord = dao.searchReviewByDateCount(value);
			model.addAttribute("list", list);
		}else {
			List<ReviewDto> list = dao.searchReviewByKey(key, value, begin, end);
			totalRecord = dao.searchReviewByKeyCount(key, value);
			model.addAttribute("list", list);
		}
		session.setAttribute("key", key);
		session.setAttribute("value", value);
		session.setAttribute("search", "YES");
		String pagingView = Paging2.getPaging("searchReview?key=" + key + "&value=" + value, nowPage, recordPerPage, totalRecord);
		model.addAttribute("pagingView", pagingView);
	}

}
