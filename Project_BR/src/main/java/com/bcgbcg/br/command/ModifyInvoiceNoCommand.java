package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;

public class ModifyInvoiceNoCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String currentPage = request.getParameter("currentPage");
		model.addAttribute("currentPage", currentPage);
		
		int pIdx = Integer.parseInt(request.getParameter("pIdx"));
		String pInvoiceNo = request.getParameter("pInvoiceNo");
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		int result = dao.modifyInvoiceNo(pIdx, pInvoiceNo);
		
		model.addAttribute("pIdx", pIdx);
		model.addAttribute("result", result);
		
	}

}
