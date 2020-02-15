package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.UserDto;

public class MyUserLoginCommand implements MyUserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		
		Map<String, Object> map = model.asMap();
		
		// 파라미터 저장
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String uId_ = request.getParameter("uId_");
		String uPassword = request.getParameter("uPw");
		
		
		// Dao 호출
		UserDto uDto = mDao.login(uId_, uPassword);
		
		if (uDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", uDto); // model는 1회성이라서  session 설정 후 세션으로 올려준다.
		}
		
	}
	
}
