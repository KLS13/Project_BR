package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.QnaDao;
import com.bcgbcg.br.dto.QnaDto;
import com.bcgbcg.br.util.QnaPaging;

public class QnaMyListCommand implements QnaCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String uId_ = request.getParameter("uId_");
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1;
		if (currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		model.addAttribute("currentPage", nowPage);

		int recordPerPage = 10;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;

		QnaDao qdao = sqlSession.getMapper(QnaDao.class);
		List<QnaDto> list = qdao.qnaMyList(uId_ ,begin, end);
		model.addAttribute("list", list); // 전체 게시물 전달
		
		int totalRecord = qdao.qnaListCount();
		
		String pagingView = QnaPaging.getPaging("qnaMyList", nowPage, recordPerPage, totalRecord);
		
		model.addAttribute("result", totalRecord); // 전체 게시물 개수 전달	
		model.addAttribute("pagingView", pagingView);
		
	}

}