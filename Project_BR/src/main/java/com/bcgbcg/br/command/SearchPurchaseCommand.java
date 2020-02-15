package com.bcgbcg.br.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.util.Paging2;

public class SearchPurchaseCommand implements AdminCommand{
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();

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
		if(key.isEmpty() && value.isEmpty()) {
			key = (String) session.getAttribute("key");
			value = (String) session.getAttribute("value");
		}
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int totalRecord = 0;
		if(key.equals("pIdx")) {
			int pIdx = Integer.parseInt(value);
			List<PurchaseDto> list = dao.searchPurchaseBypIdx(pIdx);
			model.addAttribute("list", list);
			totalRecord = dao.searchPurchaseBypIdxCount(pIdx);
		}else if(key.equals("uId_")) {
			List<PurchaseDto> list = dao.searchPurchaseByuId(value, begin, end);
			model.addAttribute("list", list);
			totalRecord = dao.searchPurchaseByuIdCount(value);
		}else if(key.equals("pDate")) {
			List<PurchaseDto> list = dao.searchPurchaseByDate(value, begin, end);
			model.addAttribute("list", list);
			totalRecord = dao.searchPurchaseByDateCount(value);
		}else {
			List<PurchaseDto> list = dao.searchPurchaseBygName(value, begin, end);
			model.addAttribute("list", list);
			totalRecord = dao.searchPurchaseBygNameCount(value);
		}
		
		session.setAttribute("key", key);
		session.setAttribute("value", value);
		session.setAttribute("search", "YES");
		String pagingView = Paging2.getPaging("purchaseSearchList?key=" + key + "&value=" + value, nowPage, recordPerPage, totalRecord);
		model.addAttribute("pagingView", pagingView);
		
	}
}
