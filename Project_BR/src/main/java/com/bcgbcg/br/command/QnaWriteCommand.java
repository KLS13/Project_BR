package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.QnaDao;

public class QnaWriteCommand implements QnaCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int qCategory = Integer.parseInt(request.getParameter("qCategory"));
		String qTitle = request.getParameter("qTitle");
		String uId_ = request.getParameter("uId_");
		String qContent = request.getParameter("qContent");
		
		qdao.qnaWrite(qCategory, qTitle, uId_ , qContent);
		
	}
	
}
