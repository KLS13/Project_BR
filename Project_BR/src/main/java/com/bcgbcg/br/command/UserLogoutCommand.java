package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class UserLogoutCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		// 파라미터 저장
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		request.getSession().removeAttribute("loginDto");
		request.getSession().removeAttribute("wasLogin");
	}
}
