package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.QnaDao;

public class QnaViewCommand implements QnaCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		model.addAttribute("qDto", qdao.qnaView(Integer.parseInt(request.getParameter("qIdx"))));
		// 리다이렉트일 경우 addAttribute 해도  리다이렉트 할때 사라짐.
	}

}