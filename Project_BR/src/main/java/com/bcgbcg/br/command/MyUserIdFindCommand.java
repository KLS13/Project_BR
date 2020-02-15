package com.bcgbcg.br.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


import com.bcgbcg.br.dao.MyPageDao;

public class MyUserIdFindCommand implements MyUserCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		
		
	}

}
