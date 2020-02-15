package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.dao.BoardDao;

public class ReviewModifyCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		long bISBN =Long.parseLong(request.getParameter("bISBN"));
		int rIdx = Integer.parseInt(request.getParameter("rIdx"));
		String rContent = request.getParameter("rContent");
		int rGrade = Integer.parseInt(request.getParameter("rGrade"));
		
		bDao.reviewModify(rIdx, rContent, rGrade);
		RedirectAttributes rda = (RedirectAttributes)map.get("rda");
		rda.addFlashAttribute("result", bDao.reviewModify(rIdx, rContent, rGrade));	
		rda.addFlashAttribute("bISBN", bISBN);

	}

}
