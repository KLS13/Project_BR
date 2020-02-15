package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.Paging;

public class MyPurchaseListCommand implements MyPurchaseCommand {
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		UserDto loginDto = (UserDto) session.getAttribute("loginDto");

		int nowPage = 1;
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		int recordPerPage = 10;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		String uId_ = loginDto.getuId_();

		model.addAttribute("currentPage", nowPage);

		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		List<PurchaseDto> list = mDao.mySelectPurchaseList(uId_, begin, end);

		model.addAttribute("list", list);

		int totalRecord = mDao.mySelectPurchaseListCount();

		String pagingView = Paging.getPaging("myPurchaseList", nowPage, recordPerPage, totalRecord);

		model.addAttribute("pagingView", pagingView);
	}

}
