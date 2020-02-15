package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.Paging2;

public class SearchMyReviewCommand implements MyReviewCommand {

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
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");
		
		String uId_ = loginDto.getuId_();
		
		if(key.isEmpty() && value.isEmpty()) {
			key = (String) session.getAttribute("key");
			value = (String) session.getAttribute("value");
		}
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		int totalRecord = 0;
		if(key.equals("RDATE")) {
			List<ReviewDto> list = mDao.mySearchReviewByDate(value,uId_, begin, end);
			totalRecord = mDao.mySearchReviewByDateCount(value,uId_);
			model.addAttribute("list", list);
			
		} else {
			List<ReviewDto> list = mDao.mySearchReviewByKey(key, value,uId_, begin, end);
			totalRecord = mDao.mySearchReviewByKeyCount(key, value,uId_);
			model.addAttribute("list", list);
		}
		session.setAttribute("key", key);
		session.setAttribute("value", value);
		String pagingView = Paging2.getPaging("searchReview?key=" + key + "&value=" + value, nowPage, recordPerPage, totalRecord);
		model.addAttribute("pagingView", pagingView);
	}

}
