package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;

public class MemberModifyByAdminCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String uId_ = request.getParameter("uId_");
		int uPoint = Integer.parseInt(request.getParameter("uPoint"));
		int uTotalPoint = Integer.parseInt(request.getParameter("uTotalPoint"));
		String uMemberShip = request.getParameter("uMemberShip");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		int result = dao.modifyMemberByAdmin(uId_, uPoint, uTotalPoint, uMemberShip);
		model.addAttribute("result", result);
	}

}
