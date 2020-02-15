package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;

public class UserChangePwCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		HttpSession session = request.getSession();
		
		String uId_ = request.getParameter("uId_");
		String uPassword = request.getParameter("uPassword");
		
		System.out.println(uId_);
		System.out.println(uPassword);
		
		session.invalidate();
		
		int result = uDao.changePw(uPassword, uId_);
		request.setAttribute("result", result);

	}

}
