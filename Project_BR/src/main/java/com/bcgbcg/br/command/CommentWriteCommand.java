package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.CommentDao;

public class CommentWriteCommand implements CommentCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		CommentDao cdao = sqlSession.getMapper(CommentDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int qIdx = Integer.parseInt(request.getParameter("qIdx"));
		String cContent = request.getParameter("cContent");
		
		cdao.commentWrite(qIdx, cContent);
	
	}
	
}