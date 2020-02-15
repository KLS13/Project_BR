package com.bcgbcg.br.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dto.BookDto;

public class BooksByNumOfReviewCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BookDto> bookList = bDao.getBooksByNumOfReview();
        model.addAttribute("bookList", bookList);
	


	}

}
