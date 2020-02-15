package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.Paging2;

public class SearchMemberCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1;
		if(currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		model.addAttribute("currentPage", nowPage);
		
		int recordPerPage = 10;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		HttpSession session = request.getSession();
		if(key.isEmpty() || key==null) {
			if(value.isEmpty() || value == null) {
				key = (String) session.getAttribute("key");
				value = (String) session.getAttribute("value");
			}
		}
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		if(key.equals("uState")) {
			if(value.contains("탈퇴")) {
				value = "0";
			}else if(value.contains("강퇴") || value.contains("강제")) {
				value = "-1";
			}else {
				value = "1";
			}
		}
		List<UserDto> list = dao.searchMemberForMap(key, value, begin, end);
		model.addAttribute("list", list);
		
		int totalRecord = dao.searchMemberForMapCount(key, value);
		
		String pagingView = Paging2.getPaging("searchMember?key=" + key + "&value=" + value, nowPage, recordPerPage, totalRecord);
		
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		session.setAttribute("key", key);
		session.setAttribute("value", value);
		session.setAttribute("search", "YES");
		model.addAttribute("pagingView", pagingView);
		
	}

}
