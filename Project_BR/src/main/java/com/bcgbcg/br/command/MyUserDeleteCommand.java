package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.UserDto;

public class MyUserDeleteCommand implements MyUserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		
		HttpSession session = request.getSession();
		UserDto uDto = (UserDto)session.getAttribute("loginDto");
		
		int uState = uDto.getuState();
		int uIdx = uDto.getuIdx();
		
		session.invalidate();
		
		int result = mDao.myDelete(uState, uIdx);
		
		request.setAttribute("result", result);
		
	}

}
