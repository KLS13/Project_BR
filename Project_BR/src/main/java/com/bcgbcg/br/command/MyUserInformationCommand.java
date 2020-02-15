package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.UserDto;

public class MyUserInformationCommand implements MyUserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MyPageDao uDao = sqlSession.getMapper(MyPageDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		 UserDto loginDto = (UserDto) session.getAttribute("loginDto");
		 String uId_ = loginDto.getuId_();
		 
		model.addAttribute("uDto",uDao.myInformation(uId_));

	}

}
