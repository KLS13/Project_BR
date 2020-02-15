package com.bcgbcg.br.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dao.QnaDao;
import com.bcgbcg.br.dto.BCDto;

public class BookChartListCommand implements BookChartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		
		BCDto bcdto = bdao.bookChartList();

		model.addAttribute("bcdto", bcdto);

	}

}
