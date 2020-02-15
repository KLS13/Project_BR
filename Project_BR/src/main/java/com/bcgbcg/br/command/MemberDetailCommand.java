package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.UserDto;

public class MemberDetailCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String uId_ = request.getParameter("uId_");
		String currentPage = request.getParameter("currentPage");
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		UserDto uDto = dao.selectView(uId_);
		int numOfReview = dao.selectReview_tByuId(uId_);
		
		model.addAttribute("uDto", uDto);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("numOfReview", numOfReview);
	}

}
