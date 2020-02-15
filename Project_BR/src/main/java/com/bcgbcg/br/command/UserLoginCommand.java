package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.dao.UserDao;
import com.bcgbcg.br.dto.UserDto;

public class UserLoginCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
		
		// 파라미터 저장
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String uId_ = request.getParameter("uId_");
		String uPassword = request.getParameter("uPw");
		
		// Dao 호출
		UserDto uDto = uDao.login(uId_, uPassword);
		int loginResult = uDao.loginCount(uId_, uPassword);
		RedirectAttributes rda = (RedirectAttributes)map.get("rda");
		rda.addFlashAttribute("loginResult",loginResult);
		
		if (uDto != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", uDto); // model는 1회성이라서  session 설정 후 세션으로 올려준다.
		}
		
		
		
	}
	
}
