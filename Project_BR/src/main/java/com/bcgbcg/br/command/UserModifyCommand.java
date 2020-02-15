package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;

public class UserModifyCommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		UserDao	uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		
		// 회원 수정 할 목록
		// 비밀번호
		String uPassword = request.getParameter("uPassword");
		// 연락처
		String uPhone = request.getParameter("uPhone_first_number") + "-" + request.getParameter("uPhone_middle_number") + "-" + request.getParameter("uPhone_last_number");
		// 이메일
		String uEmail = request.getParameter("uEmail");
		
		// 주소
		@SuppressWarnings("unused")
		String uAddress_zoneCode = request.getParameter("uAddress_zoneCode");
		String uAddress_addr = request.getParameter("uAddress_addr");
		String uAddress_detail = request.getParameter("uAddress_detail");
		String uAddress = uAddress_addr + uAddress_detail;
		
		// 장르
		String uGenre = request.getParameter("uGenre");
		// 아이디
		String uId_ = request.getParameter("uId_");

		
		session.invalidate();
		
		int result = uDao.modify(uPassword, uPhone, uEmail, uAddress, uGenre, uId_);
		request.setAttribute("result", result);
		
	}

}
