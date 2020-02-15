package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;
import com.bcgbcg.br.dto.UserDto;

public class UserDeleteCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		
		HttpSession session = request.getSession();
		UserDto uDto = (UserDto)session.getAttribute("loginDto");
		
		String uId_ = uDto.getuId_();
		String uPassword = uDto.getuPassword();
		
		session.invalidate();
		
		int result = uDao.delete(uId_, uPassword);
		
		request.setAttribute("result", result);
		
	}

}
