package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;
import com.bcgbcg.br.dto.UserDto;

public class UserFindIdCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
				
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String uName = request.getParameter("uName");
		String uEMail = request.getParameter("uEmail");
		
		UserDto uDto = uDao.find(uName, uEMail);
		
		request.setAttribute("loginDto", uDto);
	}

}
