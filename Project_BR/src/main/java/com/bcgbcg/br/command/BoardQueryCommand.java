package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.util.Paging2;

public class BoardQueryCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
        String currentPage = request.getParameter("currentPage");
		
		int nowPage = 1;
		
		if(currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		
		model.addAttribute("currentPage", nowPage);
		int recordPerPage = 10;
		int begin = (nowPage -1 ) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		String query = request.getParameter("query");
		String content = "%"+request.getParameter("content")+"%";
		String rawContent = request.getParameter("content");
	   
		int totalRecord = bDao.getDynamicTotalReview(query, content);
		
		
		String pagingView = Paging2.getPaging("dynamicQuery?query="+query+"&content="+rawContent, nowPage, recordPerPage, totalRecord);
		
		model.addAttribute("list", bDao.dynamicQueryList(query,content,begin,end));
		model.addAttribute("pagingView", pagingView);
		model.addAttribute("result", totalRecord);
	}

}
