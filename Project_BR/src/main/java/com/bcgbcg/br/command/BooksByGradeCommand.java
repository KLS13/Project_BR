package com.bcgbcg.br.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;


public class BooksByGradeCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		ArrayList<Long> list = bDao.getBooksByGrade();
		model.addAttribute("list", list);

	}

}
