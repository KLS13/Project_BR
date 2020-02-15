package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;

public class UserJoincommand implements UserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		UserDao uDao = sqlSession.getMapper(UserDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 이름
		String uName = request.getParameter("uName");
		
		// 아이디와 비밀번호
		String uId_ = request.getParameter("uId_");
		String uPassword = request.getParameter("uPassword");
		
		// 생년월일
		String year = request.getParameter("uBirthYear");
		String month = request.getParameter("uBirthMonth");
		String date = request.getParameter("uBirthDate");
		String uBirthday = year + "-" + month + "-" + date;
		
		// 연락처
		String uPhone = request.getParameter("uPhone_first_number") + "-" + request.getParameter("uPhone_middle_number") + "-" + request.getParameter("uPhone_last_number");
		
		// 이메일
		String uEmail = request.getParameter("uEmail");
		
		// 주소
		String uAddress_zoneCode = request.getParameter("uAddress_zoneCode");
		String uAddress_addr = request.getParameter("uAddress_addr");
		String uAddress_detail = request.getParameter("uAddress_detail");
		String uAddress = uAddress_addr + uAddress_detail;
		
		// 선호하는 장르 
		String uGenre = request.getParameter("uGenre");
		
		uDao.create(uName, uId_, uPassword, uPhone, uBirthday , uEmail, uAddress, uGenre);

	}
}
