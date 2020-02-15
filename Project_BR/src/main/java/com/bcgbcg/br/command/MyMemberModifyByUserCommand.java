package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;

public class MyMemberModifyByUserCommand implements MyReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String uId_ = request.getParameter("uId_");
		int uPoint = Integer.parseInt(request.getParameter("uPoint"));
		int uTotalPoint = Integer.parseInt(request.getParameter("uTotalPoint"));
		String uMemberShip = request.getParameter("uMemberShip");
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		
		int result = mDao.myModifyMemberByUser(uId_, uPoint, uTotalPoint, uMemberShip);
		System.out.println(result);
		model.addAttribute("result", result);
	}

}
