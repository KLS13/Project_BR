package com.bcgbcg.br.command;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dto.BookDto;

public class SearchViewBookCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
        Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest)map.get("request");
	    Long bISBN = Long.parseLong(request.getParameter("bISBN"));
		BookDto bDto = bDao.searchViewBook(bISBN);
		String bTitle = bDto.getbTitle();
		String bWriter = bDto.getbWriter();
		String bPublisher = bDto.getbPublisher();
		Date bPubdate = bDto.getbPubdate();
		String bImage = bDto.getbImage();
		System.out.println(bPubdate);
		model.addAttribute("bTitle",bTitle);
		model.addAttribute("bISBN",bISBN);
		model.addAttribute("bWriter",bWriter);
		model.addAttribute("bPublisher",bPublisher);
		model.addAttribute("bPubdate",bPubdate);
		model.addAttribute("bImage",bImage);

	}

}
